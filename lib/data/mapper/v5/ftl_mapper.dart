import 'package:pi_hole_client/data/model/v5/versions.dart' as s;
import 'package:pi_hole_client/domain/model/ftl/version.dart' as d;

extension VersionsMapper on s.Versions {
  d.InfoVersion toDomain() {
    return d.InfoVersion(
      core: d.ComponentVersion(
        local: d.VersionDetail(version: coreCurrent, branch: coreBranch),
        remote: d.VersionDetail(version: coreLatest),
        canUpdate: coreUpdate,
      ),
      web: d.ComponentVersion(
        local: d.VersionDetail(version: webCurrent, branch: webBranch),
        remote: d.VersionDetail(version: webLatest),
        canUpdate: webUpdate,
      ),
      ftl: d.ComponentVersion(
        local: d.VersionDetail(version: ftlCurrent, branch: ftlBranch),
        remote: d.VersionDetail(version: ftlLatest),
        canUpdate: ftlUpdate,
      ),
      docker: d.ComponentVersion(
        local: d.VersionDetail(version: dockerCurrent ?? ''),
        remote: d.VersionDetail(version: dockerLatest ?? ''),
        canUpdate: dockerUpdate ?? false,
      ),
    );
  }
}
