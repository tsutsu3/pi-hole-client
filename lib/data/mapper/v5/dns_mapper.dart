import 'package:pi_hole_client/data/mapper/v6/dns_mapper.dart';
import 'package:pi_hole_client/data/model/v5/dns.dart' as s;
import 'package:pi_hole_client/domain/model/dns/dns.dart' as d;

extension BlockingMapperV5 on s.Blocking {
  d.Blocking toDomain() {
    return d.Blocking(status: convertBlockingStatus(status), timer: null);
  }
}
