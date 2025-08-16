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

  /// 5. Fallback status
  unknown,
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

enum V5DomainType {
  /// 0: White list
  white,

  /// 1. Black list
  black,

  /// 2: Regex white list
  regex_white, // ignore: constant_identifier_names
  /// 3: Regex black list
  regex_black, // ignore: constant_identifier_names
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

enum GraphSection { homeView, statsView }

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

/// DNS blocking status
enum DnsBlockingStatus {
  /// 0: DNS blocking is enabled
  enabled,

  /// 1: DNS blocking is disabled
  disabled,

  /// 2: DNS blocking is failed
  failed,

  /// 3: DNS blocking is unknown
  unknown,
}

enum DnsRecordType {
  a,
  aaaa,
  cname,
  ptr,
  txt,
  srv,
  https,
  mx,
  ns,
  soa,
  unknown,
}

enum ReplyType {
  na,
  nodata,
  nxdomain,
  cname,
  ip,
  domain,
  rrname,
  servfail,
  refused,
  notimp,
  upstreamError,
  dnssec,
  none,
  blob,
}

enum QueryStatusType {
  // v5
  unknown(0),

  // Allowed / OK
  forwarded(200),
  cache(201),
  inProgress(202),
  alreadyForwarded(203),

  // Blocked
  gravity(300),
  regex(301),
  denylist(302),
  gravityCname(310),
  regexCname(311),
  denylistCname(312),

  // External / Dropped
  externalBlockedIp(400),
  externalBlockedNull(401),
  externalBlockedNxra(402),
  externalBlockedEde15(403),

  // Retry
  retried(500),
  retriedDnssec(501),

  // Others
  dbBusy(600),
  specialDomain(601),
  cacheStale(602);

  const QueryStatusType(this.code);

  final int code;

  static QueryStatusType fromCode(int code) => QueryStatusType.values
      .firstWhere((e) => e.code == code, orElse: () => QueryStatusType.unknown);
}
