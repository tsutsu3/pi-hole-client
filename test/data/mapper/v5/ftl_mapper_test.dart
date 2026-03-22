import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v5/ftl_mapper.dart';
import 'package:pi_hole_client/data/model/v5/versions.dart' as s;

void main() {
  group('VersionsMapper (v5)', () {
    test('maps all fields correctly', () {
      const source = s.Versions(
        coreUpdate: true,
        webUpdate: false,
        ftlUpdate: true,
        coreCurrent: 'v5.17.3',
        webCurrent: 'v5.20.1',
        ftlCurrent: 'v5.23',
        coreLatest: 'v5.18',
        webLatest: 'v5.20.1',
        ftlLatest: 'v5.24',
        coreBranch: 'master',
        webBranch: 'master',
        ftlBranch: 'master',
        dockerUpdate: false,
        dockerCurrent: '2023.05.2',
        dockerLatest: '2023.05.2',
      );

      final domain = source.toDomain();

      expect(domain.core.local.version, 'v5.17.3');
      expect(domain.core.local.branch, 'master');
      expect(domain.core.remote.version, 'v5.18');
      expect(domain.core.canUpdate, isTrue);

      expect(domain.web.local.version, 'v5.20.1');
      expect(domain.web.local.branch, 'master');
      expect(domain.web.remote.version, 'v5.20.1');
      expect(domain.web.canUpdate, isFalse);

      expect(domain.ftl.local.version, 'v5.23');
      expect(domain.ftl.local.branch, 'master');
      expect(domain.ftl.remote.version, 'v5.24');
      expect(domain.ftl.canUpdate, isTrue);

      expect(domain.docker.local.version, '2023.05.2');
      expect(domain.docker.remote.version, '2023.05.2');
      expect(domain.docker.canUpdate, isFalse);
    });

    test('null docker fields use empty string fallback', () {
      const source = s.Versions(
        coreUpdate: false,
        webUpdate: false,
        ftlUpdate: false,
        coreCurrent: 'v5.0',
        webCurrent: 'v5.0',
        ftlCurrent: 'v5.0',
        coreLatest: 'v5.0',
        webLatest: 'v5.0',
        ftlLatest: 'v5.0',
        coreBranch: 'main',
        webBranch: 'main',
        ftlBranch: 'main',
        dockerUpdate: null,
        dockerCurrent: null,
        dockerLatest: null,
      );

      final domain = source.toDomain();

      expect(domain.docker.local.version, '');
      expect(domain.docker.remote.version, '');
      expect(domain.docker.canUpdate, isFalse);
    });
  });
}
