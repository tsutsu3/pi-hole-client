import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/v6/dns/dns.dart' as srv;
import 'package:pi_hole_client/domain/model/dns/dns.dart' as repo;

final kSrvGetDnsBlocking = srv.Blocking(
  blocking: 'enabled',
  timer: null,
  took: 0.003,
);

final kSrvPostDnsBlockingEnabled = srv.Blocking(
  blocking: 'enabled',
  timer: null,
  took: 0.003,
);

final kSrvPostDnsBlockingDisabled = srv.Blocking(
  blocking: 'disabled',
  timer: 30,
  took: 0.003,
);

// repo models

final kRepoFetchDnsBlocking = repo.Blocking(
  status: DnsBlockingStatus.enabled,
  timer: null,
);

final kRepoEnableDnsBlocking = repo.Blocking(
  status: DnsBlockingStatus.enabled,
  timer: null,
);

final kRepoDisableDnsBlocking = repo.Blocking(
  status: DnsBlockingStatus.disabled,
  timer: 30,
);
