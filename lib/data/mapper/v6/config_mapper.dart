import 'package:pi_hole_client/data/model/v6/config/config.dart' as s;
import 'package:pi_hole_client/domain/model/config/config.dart' as d;
import 'package:pi_hole_client/domain/model/config/dns_config.dart' as d;

extension ConfigMapper on s.Config {
  d.Config toDomain() {
    final queryLogging = config?.dns?.queryLogging;

    return d.Config(
      dns: queryLogging != null
          ? d.DnsConfig(queryLogging: queryLogging)
          : null,
    );
  }
}

extension ConfigDataMapper on d.Config {
  s.ConfigData toData() {
    final queryLogging = dns?.queryLogging;
    return s.ConfigData(
      dns: queryLogging != null ? s.Dns(queryLogging: queryLogging) : null,
    );
  }
}
