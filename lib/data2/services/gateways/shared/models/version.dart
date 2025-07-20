import 'package:pi_hole_client/data2/services/gateways/v6/models/ftl/version.dart';

class VersionInfo {
  VersionInfo({
    required this.core,
    required this.web,
    required this.ftl,
    required this.docker,
  });

  factory VersionInfo.fromJson(Map<String, dynamic> json) {
    return VersionInfo(
      core: ComponentVersion.fromJson(json, 'core'),
      web: ComponentVersion.fromJson(json, 'web'),
      ftl: ComponentVersion.fromJson(json, 'FTL'),
      docker: ComponentVersion.fromJson(json, 'docker'),
    );
  }

  factory VersionInfo.fromV6(Version version) {
    return VersionInfo(
      core: ComponentVersion.fromV6(version.version.core),
      web: ComponentVersion.fromV6(version.version.web),
      ftl: ComponentVersion.fromV6(version.version.ftl),
      docker: ComponentVersion.fromV6(version.version.docker),
    );
  }

  final ComponentVersion core;
  final ComponentVersion web;
  final ComponentVersion ftl;
  final ComponentVersion docker;

  Map<String, dynamic> toJson() => {
        'core': core.toJson(),
        'web': web.toJson(),
        'ftl': ftl.toJson(),
        'docker': docker.toJson(),
      };
}

class ComponentVersion {
  ComponentVersion({required this.local, required this.remote, this.canUpdate});

  factory ComponentVersion.fromJson(Map<String, dynamic> json, String key) {
    return ComponentVersion(
      local: VersionDetail(
        version: json['${key}_current'] ?? '',
        branch: key == 'docker' ? null : json['${key}_branch'] ?? '',
        hash: '',
      ),
      remote: VersionDetail(
        version: json['${key}_latest'] ?? '',
        hash: '',
      ),
      canUpdate: _canUpdate(
        json['${key}_current'] ?? '',
        json['${key}_latest'] ?? '',
      ),
    );
  }

  factory ComponentVersion.fromV6(dynamic component) {
    if (component is Core || component is Web || component is FTL) {
      return ComponentVersion(
        local: VersionDetail.fromV6(component.local),
        remote: VersionDetail.fromV6(component.remote),
        canUpdate: _canUpdate(
          component.local.version,
          component.remote.version,
        ),
      );
    } else if (component is Docker) {
      return ComponentVersion(
        local: VersionDetail.fromV6(component.local),
        remote: VersionDetail.fromV6(component.remote),
        canUpdate: _canUpdate(
          component.local ?? '',
          component.remote ?? '',
        ),
      );
    } else {
      throw ArgumentError(
        'Unsupported type for ComponentVersion: ${component.runtimeType}',
      );
    }
  }

  final VersionDetail local;
  final VersionDetail remote;
  final bool? canUpdate;

  static bool _canUpdate(String? local, String? remote) {
    if (local == null || remote == null) {
      return false;
    }
    return local != remote;
  }

  Map<String, dynamic> toJson() => {
        'local': local.toJson(),
        'remote': remote.toJson(),
      };
}

class VersionDetail {
  VersionDetail({
    required this.version,
    this.branch,
    this.hash,
    this.date,
  });

  factory VersionDetail.fromJson(Map<String, dynamic> json) {
    return VersionDetail(
      version: json['version'],
      branch: json['branch'],
      hash: json['hash'],
    );
  }

  factory VersionDetail.fromV6(dynamic version) {
    if (version is LocalVersion) {
      return VersionDetail(
        version: version.version ?? '',
        branch: version.branch,
        hash: version.hash,
      );
    } else if (version is LocalFTL) {
      return VersionDetail(
        version: version.version ?? '',
        branch: version.branch,
        hash: version.hash,
        date: version.date,
      );
    } else if (version is RemoteVersion) {
      return VersionDetail(
        version: version.version ?? '',
        hash: version.hash,
      );
    } else if (version is String || version == null) {
      return VersionDetail(
        version: version ?? '',
      );
    } else {
      throw ArgumentError(
        'Unsupported type for VersionDetail: ${version.runtimeType}',
      );
    }
  }

  final String version;
  final String? branch;
  final String? hash;
  final String? date;

  Map<String, dynamic> toJson() => {
        'version': version,
        if (branch != null) 'branch': branch,
        if (hash != null) 'hash': hash,
      };
}
