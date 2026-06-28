import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/data/services/local/session_credential_service.dart';

/// Keeps one [V6SessionCache] per server address, shared across every
/// `RepositoryBundle` built for that address.
class V6SessionCacheStore {
  final Map<String, V6SessionCache> _caches = {};

  /// Returns the cache for [address], creating it on first use. An existing
  /// cache is rebound to the freshly built [creds]/[client] (its live session
  /// state is preserved) and returned.
  V6SessionCache getOrCreate({
    required String address,
    required SessionCredentialService creds,
    required PiholeV6ApiClient client,
  }) {
    final existing = _caches[address];
    if (existing != null) {
      existing.rebind(creds: creds, client: client);
      return existing;
    }
    final cache = V6SessionCache(creds: creds, client: client);
    _caches[address] = cache;
    return cache;
  }

  /// Drops the cache for [address].
  void remove(String address) => _caches.remove(address);

  /// Drops every cache.
  void clear() => _caches.clear();
}
