import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/v6/dns/dns.dart' as s;
import 'package:pi_hole_client/domain/model/dns/dns.dart' as d;

extension BlockingMapper on s.Blocking {
  d.Blocking toDomain() {
    return d.Blocking(
      status: convertBlockingStatus(blocking),
      timer: timer,
      took: took,
    );
  }
}

DnsBlockingStatus convertBlockingStatus(String status) {
  switch (status) {
    case 'enabled':
      return DnsBlockingStatus.enabled;
    case 'disabled':
      return DnsBlockingStatus.disabled;
    case 'failed':
      return DnsBlockingStatus.failed;
    case 'unknown':
      return DnsBlockingStatus.unknown;
    default:
      return DnsBlockingStatus.unknown;
  }
}
