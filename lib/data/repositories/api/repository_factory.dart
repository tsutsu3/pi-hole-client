// import 'api/interfaces/dns_repository.dart';
// import 'api/interfaces/domain_repository.dart';
// import 'api/interfaces/config_repository.dart';
// import 'api/v5/dns_repository_v5.dart';
// import 'api/v5/domain_repository_v5.dart';
// import 'api/v5/config_repository_v5.dart';
// import 'api/v6/dns_repository_v6.dart';
// import 'api/v6/domain_repository_v6.dart';
// import 'api/v6/config_repository_v6.dart';

// class RepositoryBundle {
//   final DnsRepository? dns;
//   final DomainRepository? domain;
//   final ConfigRepository? config;

//   const RepositoryBundle({
//     this.dns,
//     this.domain,
//     this.config,
//   });
// }

// class RepositoryFactory {
//   final bool isV6;

//   RepositoryFactory({required this.isV6});

//   // 個別取得
//   DnsRepository get dnsRepository =>
//       isV6 ? DnsRepositoryV6() : DnsRepositoryV5();
//   DomainRepository get domainRepository =>
//       isV6 ? DomainRepositoryV6() : DomainRepositoryV5();
//   ConfigRepository get configRepository =>
//       isV6 ? ConfigRepositoryV6() : ConfigRepositoryV5();

//   // 一括取得
//   RepositoryBundle create({
//     bool dns = false,
//     bool domain = false,
//     bool config = false,
//   }) {
//     return RepositoryBundle(
//       dns: dns ? dnsRepository : null,
//       domain: domain ? domainRepository : null,
//       config: config ? configRepository : null,
//     );
//   }
// }
