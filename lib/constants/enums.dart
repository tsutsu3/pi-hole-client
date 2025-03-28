enum LoadStatus { loading, loaded, error }

/// Lists status (Supscription status)
/// - 0: List was not downloaded so far
/// - 1: List download was successful (OK)
/// - 2: List unchanged upstream, Pi-hole used a local copy (OK)
/// - 3: List unavailable, Pi-hole used a local copy (check list)
/// - 4: List unavailable, there is no local copy of this list available (replace list)
enum ListsStatus {
  notDownloaded, // 0: Not downloaded yet
  downloaded, // 1: Download successful
  unchanged, // 2: No changes (using local copy)
  unavailableCached, // 3: Not available upstream but local copy exists
  unavailableNoCache; // 4: Not available upstream and no local copy
}
