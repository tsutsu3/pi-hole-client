/// Connection settings for the real Pi-hole integration/e2e layer.
///
/// | service        | host port | url (from emulator)     | secret         |
/// |----------------|-----------|-------------------------|----------------|
/// | pihole-v6-test | 19080     | http://10.0.2.2:19080   | pass `test001` |
/// | pihole-v5-test | 19085     | http://10.0.2.2:19085   | WEBPASSWORD `test123` → API token |
/// | caddy fault    | 19082     | http://10.0.2.2:19082   | pass `test001` (blocking → 503) |
/// | caddy fault-delete | 19086 | http://10.0.2.2:19086  | pass `test001` (DELETE /api/auth* → 401) |
/// | caddy TLS      | 19443     | https://10.0.2.2:19443  | pass `test001` (self-signed) |
///
/// Run example:
/// ```sh
/// docker compose -f e2e/docker-compose.yml up -d
/// flutter test integration_test/real -d EMULATOR
/// # override any target with e.g. --dart-define=PIHOLE_V6_BASE=http://10.0.2.2:19080
/// ```
class RealPiholeEnv {
  RealPiholeEnv._();

  //  v6 (HTTP, direct)
  static const String v6Base = String.fromEnvironment(
    'PIHOLE_V6_BASE',
    defaultValue: 'http://10.0.2.2:19080',
  );
  static const String v6Password = String.fromEnvironment(
    'PIHOLE_V6_PASSWORD',
    defaultValue: 'test001',
  );

  //  v5 (HTTP, direct)  token has no safe default → v5 tests skip if empty
  static const String v5Base = String.fromEnvironment(
    'PIHOLE_V5_BASE',
    defaultValue: 'http://10.0.2.2:19083',
  );
  static const String v5Token = String.fromEnvironment(
    'PIHOLE_V5_TOKEN',
    defaultValue:
        'bdaa62c79c1f74a96290af23ac66a3bd21cf61f841c0df7d1477b9f4df37e6ae',
  );

  // without password
  static const String v6BaseWP = String.fromEnvironment(
    'PIHOLE_V6_BASE_WP',
    defaultValue: 'http://10.0.2.2:19084',
  );

  // without password
  static const String v5BaseWP = String.fromEnvironment(
    'PIHOLE_V5_BASE_WP',
    defaultValue: 'http://10.0.2.2:19085',
  );

  //  v6 (HTTPS, self-signed via Caddy)
  static const String v6HttpsBase = String.fromEnvironment(
    'PIHOLE_V6_HTTPS_BASE',
    defaultValue: 'https://10.0.2.2:19443',
  );

  //  fault proxy (auth ok, /api/dns/blocking -> 503)
  static const String faultBase = String.fromEnvironment(
    'CADDY_FAULT_BASE',
    defaultValue: 'http://10.0.2.2:19082',
  );

  //  fault-delete proxy (normal add/connect; DELETE /api/auth* -> 401)
  static const String faultDeleteBase = String.fromEnvironment(
    'CADDY_FAULT_DELETE_BASE',
    defaultValue: 'http://10.0.2.2:19086',
  );
}
