//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'totp_totp.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TotpTotp {
  /// Returns a new [TotpTotp] instance.
  TotpTotp({

     this.type,

     this.account,

     this.issuer,

     this.algorithm,

     this.digits,

     this.period,

     this.offset,

     this.secret,

     this.codes,
  });

  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @JsonKey(
    
    name: r'account',
    required: false,
    includeIfNull: false,
  )


  final String? account;



  @JsonKey(
    
    name: r'issuer',
    required: false,
    includeIfNull: false,
  )


  final String? issuer;



  @JsonKey(
    
    name: r'algorithm',
    required: false,
    includeIfNull: false,
  )


  final String? algorithm;



  @JsonKey(
    
    name: r'digits',
    required: false,
    includeIfNull: false,
  )


  final int? digits;



  @JsonKey(
    
    name: r'period',
    required: false,
    includeIfNull: false,
  )


  final int? period;



  @JsonKey(
    
    name: r'offset',
    required: false,
    includeIfNull: false,
  )


  final int? offset;



  @JsonKey(
    
    name: r'secret',
    required: false,
    includeIfNull: false,
  )


  final String? secret;



  @JsonKey(
    
    name: r'codes',
    required: false,
    includeIfNull: false,
  )


  final List<int>? codes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TotpTotp &&
      other.type == type &&
      other.account == account &&
      other.issuer == issuer &&
      other.algorithm == algorithm &&
      other.digits == digits &&
      other.period == period &&
      other.offset == offset &&
      other.secret == secret &&
      other.codes == codes;

    @override
    int get hashCode =>
        type.hashCode +
        account.hashCode +
        issuer.hashCode +
        algorithm.hashCode +
        digits.hashCode +
        period.hashCode +
        offset.hashCode +
        secret.hashCode +
        codes.hashCode;

  factory TotpTotp.fromJson(Map<String, dynamic> json) => _$TotpTotpFromJson(json);

  Map<String, dynamic> toJson() => _$TotpTotpToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

