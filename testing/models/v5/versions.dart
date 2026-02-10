import 'package:pi_hole_client/data/model/v5/versions.dart' as srv;
import 'package:pi_hole_client/domain/model/ftl/pihole_server.dart' as repo;
import 'package:pi_hole_client/domain/model/ftl/version.dart' as repo;

const kSrvVersions = srv.Versions(
  coreUpdate: true,
  webUpdate: true,
  ftlUpdate: true,
  coreCurrent: 'v5.18.3',
  webCurrent: 'v5.21',
  ftlCurrent: 'v5.25.2',
  coreLatest: 'v6.0.5',
  webLatest: 'v6.0.2',
  ftlLatest: 'v6.0.4',
  coreBranch: 'master',
  webBranch: 'master',
  ftlBranch: 'master',
);

const kSrvVersionsWithDocker = srv.Versions(
  coreUpdate: true,
  webUpdate: true,
  ftlUpdate: true,
  dockerUpdate: true,
  coreCurrent: 'v5.18.3',
  webCurrent: 'v5.21',
  ftlCurrent: 'v5.25.2',
  dockerCurrent: '2024.07.0',
  coreLatest: 'v6.0.5',
  webLatest: 'v6.0.2',
  ftlLatest: 'v6.0.4',
  dockerLatest: '2025.03.0',
  coreBranch: 'master',
  webBranch: 'master',
  ftlBranch: 'master',
);

// repo model

const kRepoFtlVersionWithDocker = repo.FtlVersion(
  core: repo.ComponentVersion(
    local: repo.VersionDetail(version: 'v5.18.3', branch: 'master'),
    remote: repo.VersionDetail(version: 'v6.0.5'),
    canUpdate: true,
  ),
  web: repo.ComponentVersion(
    local: repo.VersionDetail(version: 'v5.21', branch: 'master'),
    remote: repo.VersionDetail(version: 'v6.0.2'),
    canUpdate: true,
  ),
  ftl: repo.ComponentVersion(
    local: repo.VersionDetail(version: 'v5.25.2', branch: 'master'),
    remote: repo.VersionDetail(version: 'v6.0.4'),
    canUpdate: true,
  ),
  docker: repo.ComponentVersion(
    local: repo.VersionDetail(version: '2024.07.0'),
    remote: repo.VersionDetail(version: '2025.03.0'),
    canUpdate: true,
  ),
);

const kRepoFtlVersion = repo.FtlVersion(
  core: repo.ComponentVersion(
    local: repo.VersionDetail(version: 'v5.18.3', branch: 'master'),
    remote: repo.VersionDetail(version: 'v6.0.5'),
    canUpdate: true,
  ),
  web: repo.ComponentVersion(
    local: repo.VersionDetail(version: 'v5.21', branch: 'master'),
    remote: repo.VersionDetail(version: 'v6.0.2'),
    canUpdate: true,
  ),
  ftl: repo.ComponentVersion(
    local: repo.VersionDetail(version: 'v5.25.2', branch: 'master'),
    remote: repo.VersionDetail(version: 'v6.0.4'),
    canUpdate: true,
  ),
  docker: repo.ComponentVersion(
    local: repo.VersionDetail(version: ''),
    remote: repo.VersionDetail(version: ''),
    canUpdate: false,
  ),
);

const kRepoPiholeServer = repo.PiholeServer(version: kRepoFtlVersion);

const kRepoPiholeServerWithDocker = repo.PiholeServer(
  version: kRepoFtlVersionWithDocker,
);
