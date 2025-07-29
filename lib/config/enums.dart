/// Http methods
enum HttpMethod {
  //0: Get
  get,

  //1: Post
  post,

  //2: Put
  put,

  //3: Patch
  patch,

  //4: Delete
  delete,
}

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
  unavailableNoCache,
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

/// Domain type
enum DomainType {
  /// 0: Allow
  allow,

  /// 1: Deny
  deny,
}

/// List type
enum ListType {
  /// 0: Allow
  allow,

  /// 1: Deny
  block,
}

/// Domain kind
enum DomainKind {
  /// 0: Exact
  exact,

  /// 1: Regex
  regex,
}

enum GraphSection {
  homeView,
  statsView,
}

/// TLS Status
enum TlsStatus {
  /// 0: Session is end-to-end encrypted
  login,

  /// 1: Session is PARTIALLY end-to-end encrypted
  mixed,

  /// 2: Session is NOT end-to-end encrypted
  none,
}

/// Log filter status
enum RequestStatus {
  /// 0: All requests
  all,

  /// 1: Blocked requests
  blocked,

  /// 2: Allowed requests
  allowed,
}
