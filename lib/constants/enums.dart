enum LoadStatus { loading, loaded, error }

/// Lists status (Supscription status)
enum ListsStatus {
  /// 0: List was not downloaded so far
  notDownloaded,

  /// 1: List download was successful (OK)
  downloaded,

  /// 2: List unchanged upstream, Pi-hole used a local copy (OK)
  unchanged,

  /// 3: List unavailable, Pi-hole used a local copy (check list)
  unavailableCached,

  /// 4: List unavailable, there is no local copy of this list available (replace list)
  unavailableNoCache;
}

/// Gravity Status
enum GravityStatus {
  /// 0: Gravity is idle
  idle,

  /// 1: Gravity is running
  running,

  /// 2: Gravity update was successful
  success,

  /// 3: Gravity update failed
  error,
}
