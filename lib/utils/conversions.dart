import 'package:intl/intl.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models_old/domain.dart';

String getDomainType(int type) {
  switch (type) {
    case 0:
      return 'Whitelist';

    case 1:
      return 'Blacklist';

    case 2:
      return 'Whitelist Regex';

    case 3:
      return 'Blacklist Regex';

    default:
      return '';
  }
}

String getAdlistStatusType(int type) {
  switch (type) {
    case 0:
      return 'List was not downloaded so far';

    case 1:
      return 'List download was successful (OK)';

    case 2:
      return 'List unchanged upstream, Pi-hole used a local copy (OK)';

    case 3:
      return 'List unavailable, Pi-hole used a local copy (check list)';

    case 4:
      return 'List unavailable, there is no local copy of this list available (replace list)';

    default:
      return '';
  }
}

List<Domain> parseDomainList(List<Map<String, dynamic>> jsonList) {
  return jsonList.map(Domain.fromJson).toList();
}

bool? convertFromIntToBool(int value) {
  if (value == 1) {
    return true;
  } else if (value == 0) {
    return false;
  } else {
    return null;
  }
}

int? convertFromBoolToInt(bool value) {
  if (value == true) {
    return 1;
  } else if (value == false) {
    return 0;
  } else {
    return null;
  }
}

String formatPercentage(double value, String locale) {
  final f = NumberFormat('###.##', locale);
  return f.format(value);
}

String intFormat(int value, String locale) {
  final f = NumberFormat('#,###', locale);
  return f.format(value);
}

List<Map<String, dynamic>> convertFromMapToList(Map<String, int> values) {
  final items = <Map<String, dynamic>>[];
  values.forEach((key, value) {
    items.add({'label': key, 'value': value});
  });
  return items;
}

String getDomainTypeLabel(DomainType type, DomainKind kind) {
  return switch ((type, kind)) {
    (DomainType.allow, DomainKind.exact) => 'Whitelist',
    (DomainType.deny, DomainKind.exact) => 'Blacklist',
    (DomainType.allow, DomainKind.regex) => 'Whitelist Regex',
    (DomainType.deny, DomainKind.regex) => 'Blacklist Regex',
  };
}
