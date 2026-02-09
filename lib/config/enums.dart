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

  /// 2: Unknown
  unknown,
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
  none,
  a,
  aaaa,
  any,
  srv,
  soa,
  ptr,
  txt,
  naptr,
  mx,
  ds,
  rrsig,
  dnskey,
  ns,
  svcb,
  https,
  na,
  cname,
  other,
  empty,
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
  unknown,
}

/// Query status type (unified for Pi-hole v5 and v6).
enum QueryStatusType {
  /// v5=1, v6=GRAVITY
  gravity,

  /// v5=2, v6=FORWARDED
  forwarded,

  /// v5=3, v6=CACHE
  cache,

  /// v5=4, v6=REGEX
  regex,

  /// v5=5, v6=DENYLIST
  denylist,

  /// v5=9, v6=GRAVITY_CNAME
  gravityCname,

  /// v5=10, v6=REGEX_CNAME
  regexCname,

  /// v5=11, v6=DENYLIST_CNAME
  denylistCname,

  /// v5=6, v6=EXTERNAL_BLOCKED_IP
  externalBlockedIp,

  /// v5=7, v6=EXTERNAL_BLOCKED_NULL
  externalBlockedNull,

  /// v5=8, v6=EXTERNAL_BLOCKED_NXRA
  externalBlockedNxra,

  /// v6=EXTERNAL_BLOCKED_EDE15
  externalBlockedEde15,

  /// v5=12, v6=RETRIED
  retried,

  /// v5=13, v6=RETRIED_DNSSEC
  retriedDnssec,

  /// v5=14, v6=IN_PROGRESS
  inProgress,

  /// v5=15, v6=DBBUSY
  dbBusy,

  /// v6=SPECIAL_DOMAIN
  specialDomain,

  /// v6=CACHE_STALE
  cacheStale,

  /// v6=UNKNOWN, or unmapped value
  unknown,
}

enum RouteFamilyType { inet, inet6, link, mpls, bridge, unknown }

/// DNS blocking mode (Pi-hole v6)
enum BlockingMode {
  /// Reply with NULL (0.0.0.0 or ::) — default and recommended
  nullMode,

  /// Reply with Pi-hole's IP for A queries, NODATA for AAAA
  ipNodataAaaa,

  /// Reply with Pi-hole's IP for both A and AAAA
  ip,

  /// Reply with NXDOMAIN
  nxdomain,

  /// Reply with NODATA
  nodata,

  unknown,
}

/// DNS listening mode (Pi-hole v6)
enum ListeningMode {
  /// Allow only local requests (default)
  local,

  /// Permit all origins
  all,

  /// Respond only on a single interface
  single,

  /// Listen with bind configuration
  bind,

  /// Don't listen
  none,

  unknown,
}
