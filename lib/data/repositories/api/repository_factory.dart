// class RepositoryFactory {
//   const RepositoryFactory();

//   DomainRepository createDomainRepository({
//     required ServerConfig config,
//     required SessionCredentialService creds,
//     required PiholeApiClient api,
//   }) {
//     switch (config.version) {
//       case ApiVersion.v5:
//         return DomainRepositoryV5(
//           client: api as PiholeV5ApiClient,
//           creds: creds,
//         );
//       case ApiVersion.v6:
//         return DomainRepositoryV6(
//           client: api as PiholeV6ApiClient,
//           creds: creds,
//         );
//     }
//   }
// }

// class Repositories {
//   Repositories({
//     required this.domain,
//     // required this.actions,
//     // required this.auth,
//     required this.apiClient,
//   });

//   final DomainRepository domain;
//   // final ActionsRepository actions;
//   // final AuthRepository auth;
//   final PiholeApiClient apiClient;

//   void dispose() {
//     apiClient.close();
//   }
// }

// class RepositoryBundleFactory {
//   const RepositoryBundleFactory(this.repoFactory);
//   final RepositoryFactory repoFactory;

//   Repositories create({
//     required ServerConfig config,
//     required SessionCredentialService creds,
//   }) {
//     final api = config.version == ApiVersion.v5
//         ? PiholeV5ApiClient(url: config.baseUrl)
//         : PiholeV6ApiClient(url: config.baseUrl);

//     final domain = repoFactory.createDomainRepository(
//       config: config,
//       creds: creds,
//       api: api,
//     );

//     return Repositories(domain: domain, apiClient: api);
//   }
// }
