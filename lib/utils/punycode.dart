/// Punycode decoder implementing RFC 3492.
///
/// Punycode is the encoding used for Internationalized Domain Names (IDN).
/// Domain labels containing non-ASCII characters (e.g. `さんぷる.com`) are
/// stored in DNS as ASCII-Compatible Encoding with an `xn--` prefix
/// (e.g. `xn--48j8cuc4a.com`).
///
/// This module provides [decodePunycode] to convert such encoded domain
/// names back to their Unicode representation for display purposes.
///
/// Reference: https://www.rfc-editor.org/rfc/rfc3492
library;

/// Decodes a Punycode-encoded domain name to its Unicode representation.
///
/// Splits the [domain] by `'.'` and decodes each label independently.
/// Labels prefixed with `xn--` are treated as Punycode and decoded;
/// all other labels are returned as-is.
///
/// Returns the original [domain] unchanged if any decoding error occurs,
/// ensuring this function never throws.
///
/// ```dart
/// decodePunycode('xn--48j8cuc4a.com');  // → 'さんぷる.com'
/// decodePunycode('example.com');         // → 'example.com' (unchanged)
/// decodePunycode('xn--!!!.com');         // → 'xn--!!!.com' (invalid, unchanged)
/// ```
String decodePunycode(String domain) {
  try {
    return domain.split('.').map(_decodeLabel).join('.');
  } catch (_) {
    // Return the original domain for any malformed input rather than
    // propagating exceptions to callers.
    return domain;
  }
}

/// Decodes a single domain label.
///
/// If [label] starts with the ACE prefix `xn--`, strips the prefix and
/// delegates to [_decode] for RFC 3492 Punycode decoding.
/// Otherwise returns the label unchanged (plain ASCII label).
String _decodeLabel(String label) {
  if (!label.startsWith('xn--')) return label;
  return _decode(label.substring(4));
}

// ---------------------------------------------------------------------------
// RFC 3492 constants (Section 5: Parameter values for Punycode)
// ---------------------------------------------------------------------------

/// Number base for the variable-length integer encoding (a–z = 0–25,
/// 0–9 = 26–35).
const _base = 36;

/// Minimum threshold value used in bias adaptation.
const _tMin = 1;

/// Maximum threshold value used in bias adaptation.
const _tMax = 26;

/// Skew factor for bias adaptation (controls how quickly bias converges).
const _skew = 38;

/// Damping factor applied to the first delta (reduces initial bias swing).
const _damp = 700;

/// Initial bias value before any adaptation.
const _initialBias = 72;

/// Initial code point value (first non-ASCII code point: 0x80 = 128).
const _initialN = 128;

/// Decodes a Punycode-encoded string (without the `xn--` prefix) into
/// a list of Unicode code points and returns the resulting string.
///
/// The algorithm works as follows (RFC 3492, Section 6.2):
/// 1. Extract the literal ASCII portion (everything before the last `-`).
/// 2. Walk through the remaining encoded digits to reconstruct a sequence
///    of `(code point, insertion index)` pairs using variable-length
///    integer decoding with adaptive bias.
/// 3. Insert each decoded code point at the computed position to produce
///    the final output.
///
/// Throws [FormatException] if the input contains invalid Punycode digits
/// or is truncated.
String _decode(String input) {
  final output = <int>[];

  // `n` tracks the current code point being decoded. It starts at 128
  // (first non-ASCII) and increases as deltas are accumulated.
  var n = _initialN;

  // `bias` controls the variable-length integer thresholds and is
  // updated after each code point is decoded.
  var bias = _initialBias;

  // `i` is the running insertion index into the output array.
  var i = 0;

  // --- Step 1: Extract literal ASCII portion ---
  // Everything before the last '-' delimiter is literal ASCII characters
  // that appear in the decoded output. If there is no '-', the entire
  // input is encoded digits.
  final delimIndex = input.lastIndexOf('-');
  if (delimIndex > 0) {
    for (var j = 0; j < delimIndex; j++) {
      output.add(input.codeUnitAt(j));
    }
  }

  // Start reading encoded digits after the delimiter (or from the
  // beginning if no delimiter was found).
  var pos = delimIndex > 0 ? delimIndex + 1 : 0;

  // --- Step 2: Decode variable-length integers ---
  // Each iteration of the outer loop decodes one non-ASCII code point.
  while (pos < input.length) {
    final oldI = i;
    var w = 1; // weight factor, multiplied by (base - t) each iteration

    // Inner loop: decode a single variable-length integer.
    // Each digit contributes to the value `i` with increasing weight.
    // The loop terminates when a digit is less than the threshold `t`.
    for (var k = _base;; k += _base) {
      if (pos >= input.length) {
        throw const FormatException('Invalid punycode: unexpected end');
      }
      final digit = _digitValue(input.codeUnitAt(pos++));

      i += digit * w;

      // Threshold clamping (RFC 3492, Section 6.2):
      // t = tMin if k <= bias, tMax if k >= bias + tMax, else k - bias
      final t = k <= bias
          ? _tMin
          : (k >= bias + _tMax ? _tMax : k - bias);

      if (digit < t) break; // this digit terminates the integer
      w *= _base - t;
    }

    // --- Step 3: Update state and insert code point ---
    final len = output.length + 1;
    bias = _adapt(i - oldI, len, oldI == 0);

    // `i / len` gives the code point delta; `i % len` gives the
    // insertion position.
    n += i ~/ len;
    i %= len;

    output.insert(i, n);
    i++;
  }

  return String.fromCharCodes(output);
}

/// Converts a Punycode-encoded ASCII character to its digit value.
///
/// Mapping (case-insensitive):
/// - `a`–`z` (or `A`–`Z`) → 0–25
/// - `0`–`9` → 26–35
///
/// Throws [FormatException] if [codeUnit] is not a valid Punycode digit.
int _digitValue(int codeUnit) {
  if (codeUnit >= 0x61 && codeUnit <= 0x7A) return codeUnit - 0x61; // a-z
  if (codeUnit >= 0x30 && codeUnit <= 0x39) return codeUnit - 0x30 + 26; // 0-9
  if (codeUnit >= 0x41 && codeUnit <= 0x5A) return codeUnit - 0x41; // A-Z
  throw const FormatException('Invalid punycode digit');
}

/// Adapts the bias after each code point is decoded (RFC 3492, Section 6.1).
///
/// The bias adaptation algorithm ensures that the variable-length integer
/// encoding is efficient regardless of the distribution of code points.
///
/// - [delta]: the difference between the current and previous `i` values.
/// - [numPoints]: the number of code points processed so far (output
///   length + 1).
/// - [firstTime]: `true` for the very first code point (applies extra
///   damping via [_damp]).
///
/// Returns the new bias value.
int _adapt(int delta, int numPoints, bool firstTime) {
  // Step 1: Scale the delta. The first delta is divided by damp (700)
  // to reduce initial bias swing; subsequent deltas are halved.
  var d = firstTime ? delta ~/ _damp : delta ~/ 2;

  // Step 2: Compensate for the change in string length.
  d += d ~/ numPoints;

  // Step 3: Iteratively reduce d to find the number of base divisions
  // needed, which determines the new bias.
  var k = 0;
  while (d > ((_base - _tMin) * _tMax) ~/ 2) {
    d ~/= _base - _tMin;
    k += _base;
  }
  return k + ((_base - _tMin + 1) * d) ~/ (d + _skew);
}
