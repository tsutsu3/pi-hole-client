// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Config _$ConfigFromJson(Map<String, dynamic> json) => _Config(
  config: json['config'] == null
      ? null
      : ConfigData.fromJson(json['config'] as Map<String, dynamic>),
  took: (json['took'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ConfigToJson(_Config instance) => <String, dynamic>{
  'config': ?instance.config?.toJson(),
  'took': ?instance.took,
};

_ConfigData _$ConfigDataFromJson(Map<String, dynamic> json) => _ConfigData(
  dns: json['dns'] == null
      ? null
      : Dns.fromJson(json['dns'] as Map<String, dynamic>),
  dhcp: json['dhcp'] == null
      ? null
      : Dhcp.fromJson(json['dhcp'] as Map<String, dynamic>),
  ntp: json['ntp'] == null
      ? null
      : Ntp.fromJson(json['ntp'] as Map<String, dynamic>),
  resolver: json['resolver'] == null
      ? null
      : Resolver.fromJson(json['resolver'] as Map<String, dynamic>),
  database: json['database'] == null
      ? null
      : Database.fromJson(json['database'] as Map<String, dynamic>),
  webserver: json['webserver'] == null
      ? null
      : Webserver.fromJson(json['webserver'] as Map<String, dynamic>),
  files: json['files'] == null
      ? null
      : Files.fromJson(json['files'] as Map<String, dynamic>),
  misc: json['misc'] == null
      ? null
      : Misc.fromJson(json['misc'] as Map<String, dynamic>),
  debug: json['debug'] == null
      ? null
      : Debug.fromJson(json['debug'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConfigDataToJson(_ConfigData instance) =>
    <String, dynamic>{
      'dns': ?instance.dns?.toJson(),
      'dhcp': ?instance.dhcp?.toJson(),
      'ntp': ?instance.ntp?.toJson(),
      'resolver': ?instance.resolver?.toJson(),
      'database': ?instance.database?.toJson(),
      'webserver': ?instance.webserver?.toJson(),
      'files': ?instance.files?.toJson(),
      'misc': ?instance.misc?.toJson(),
      'debug': ?instance.debug?.toJson(),
    };

_Dns _$DnsFromJson(Map<String, dynamic> json) => _Dns(
  upstreams: (json['upstreams'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  cnameDeepInspect: json['CNAMEdeepInspect'] as bool?,
  blockESNI: json['blockESNI'] as bool?,
  edns0ECS: json['EDNS0ECS'] as bool?,
  ignoreLocalhost: json['ignoreLocalhost'] as bool?,
  showDNSSEC: json['showDNSSEC'] as bool?,
  analyzeOnlyAandAAAA: json['analyzeOnlyAandAAAA'] as bool?,
  piholePTR: json['piholePTR'] as String?,
  replyWhenBusy: json['replyWhenBusy'] as String?,
  blockTTL: (json['blockTTL'] as num?)?.toInt(),
  hosts: (json['hosts'] as List<dynamic>?)?.map((e) => e as String).toList(),
  domainNeeded: json['domainNeeded'] as bool?,
  expandHosts: json['expandHosts'] as bool?,
  domain: json['domain'] as String?,
  bogusPriv: json['bogusPriv'] as bool?,
  dnssec: json['dnssec'] as bool?,
  interface: json['interface'] as String?,
  hostRecord: json['hostRecord'] as String?,
  listeningMode: json['listeningMode'] as String?,
  queryLogging: json['queryLogging'] as bool?,
  cnameRecords: (json['cnameRecords'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  port: (json['port'] as num?)?.toInt(),
  cache: json['cache'] == null
      ? null
      : DnsCache.fromJson(json['cache'] as Map<String, dynamic>),
  revServers: (json['revServers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  blocking: json['blocking'] == null
      ? null
      : DnsBlocking.fromJson(json['blocking'] as Map<String, dynamic>),
  specialDomains: json['specialDomains'] == null
      ? null
      : SpecialDomains.fromJson(json['specialDomains'] as Map<String, dynamic>),
  reply: json['reply'] == null
      ? null
      : DnsReply.fromJson(json['reply'] as Map<String, dynamic>),
  rateLimit: json['rateLimit'] == null
      ? null
      : RateLimit.fromJson(json['rateLimit'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DnsToJson(_Dns instance) => <String, dynamic>{
  'upstreams': ?instance.upstreams,
  'CNAMEdeepInspect': ?instance.cnameDeepInspect,
  'blockESNI': ?instance.blockESNI,
  'EDNS0ECS': ?instance.edns0ECS,
  'ignoreLocalhost': ?instance.ignoreLocalhost,
  'showDNSSEC': ?instance.showDNSSEC,
  'analyzeOnlyAandAAAA': ?instance.analyzeOnlyAandAAAA,
  'piholePTR': ?instance.piholePTR,
  'replyWhenBusy': ?instance.replyWhenBusy,
  'blockTTL': ?instance.blockTTL,
  'hosts': ?instance.hosts,
  'domainNeeded': ?instance.domainNeeded,
  'expandHosts': ?instance.expandHosts,
  'domain': ?instance.domain,
  'bogusPriv': ?instance.bogusPriv,
  'dnssec': ?instance.dnssec,
  'interface': ?instance.interface,
  'hostRecord': ?instance.hostRecord,
  'listeningMode': ?instance.listeningMode,
  'queryLogging': ?instance.queryLogging,
  'cnameRecords': ?instance.cnameRecords,
  'port': ?instance.port,
  'cache': ?instance.cache?.toJson(),
  'revServers': ?instance.revServers,
  'blocking': ?instance.blocking?.toJson(),
  'specialDomains': ?instance.specialDomains?.toJson(),
  'reply': ?instance.reply?.toJson(),
  'rateLimit': ?instance.rateLimit?.toJson(),
};

_DnsCache _$DnsCacheFromJson(Map<String, dynamic> json) => _DnsCache(
  size: (json['size'] as num?)?.toInt(),
  optimizer: (json['optimizer'] as num?)?.toInt(),
  upstreamBlockedTTL: (json['upstreamBlockedTTL'] as num?)?.toInt(),
);

Map<String, dynamic> _$DnsCacheToJson(_DnsCache instance) => <String, dynamic>{
  'size': ?instance.size,
  'optimizer': ?instance.optimizer,
  'upstreamBlockedTTL': ?instance.upstreamBlockedTTL,
};

_DnsBlocking _$DnsBlockingFromJson(Map<String, dynamic> json) => _DnsBlocking(
  active: json['active'] as bool?,
  mode: json['mode'] as String?,
  edns: json['edns'] as String?,
);

Map<String, dynamic> _$DnsBlockingToJson(_DnsBlocking instance) =>
    <String, dynamic>{
      'active': ?instance.active,
      'mode': ?instance.mode,
      'edns': ?instance.edns,
    };

_SpecialDomains _$SpecialDomainsFromJson(Map<String, dynamic> json) =>
    _SpecialDomains(
      mozillaCanary: json['mozillaCanary'] as bool?,
      iCloudPrivateRelay: json['iCloudPrivateRelay'] as bool?,
      designatedResolver: json['designatedResolver'] as bool?,
    );

Map<String, dynamic> _$SpecialDomainsToJson(_SpecialDomains instance) =>
    <String, dynamic>{
      'mozillaCanary': ?instance.mozillaCanary,
      'iCloudPrivateRelay': ?instance.iCloudPrivateRelay,
      'designatedResolver': ?instance.designatedResolver,
    };

_DnsReply _$DnsReplyFromJson(Map<String, dynamic> json) => _DnsReply(
  host: json['host'] == null
      ? null
      : ReplyHost.fromJson(json['host'] as Map<String, dynamic>),
  blocking: json['blocking'] == null
      ? null
      : ReplyHost.fromJson(json['blocking'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DnsReplyToJson(_DnsReply instance) => <String, dynamic>{
  'host': ?instance.host?.toJson(),
  'blocking': ?instance.blocking?.toJson(),
};

_ReplyHost _$ReplyHostFromJson(Map<String, dynamic> json) => _ReplyHost(
  force4: json['force4'] as bool?,
  force6: json['force6'] as bool?,
  ipv4: json['IPv4'] as String?,
  ipv6: json['IPv6'] as String?,
);

Map<String, dynamic> _$ReplyHostToJson(_ReplyHost instance) =>
    <String, dynamic>{
      'force4': ?instance.force4,
      'force6': ?instance.force6,
      'IPv4': ?instance.ipv4,
      'IPv6': ?instance.ipv6,
    };

_RateLimit _$RateLimitFromJson(Map<String, dynamic> json) => _RateLimit(
  count: (json['count'] as num?)?.toInt(),
  interval: (json['interval'] as num?)?.toInt(),
);

Map<String, dynamic> _$RateLimitToJson(_RateLimit instance) =>
    <String, dynamic>{'count': ?instance.count, 'interval': ?instance.interval};

_Dhcp _$DhcpFromJson(Map<String, dynamic> json) => _Dhcp(
  active: json['active'] as bool?,
  start: json['start'] as String?,
  end: json['end'] as String?,
  router: json['router'] as String?,
  netmask: json['netmask'] as String?,
  leaseTime: json['leaseTime'] as String?,
  ipv6: json['ipv6'] as bool?,
  rapidCommit: json['rapidCommit'] as bool?,
  multiDNS: json['multiDNS'] as bool?,
  logging: json['logging'] as bool?,
  ignoreUnknownClients: json['ignoreUnknownClients'] as bool?,
  hosts: (json['hosts'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$DhcpToJson(_Dhcp instance) => <String, dynamic>{
  'active': ?instance.active,
  'start': ?instance.start,
  'end': ?instance.end,
  'router': ?instance.router,
  'netmask': ?instance.netmask,
  'leaseTime': ?instance.leaseTime,
  'ipv6': ?instance.ipv6,
  'rapidCommit': ?instance.rapidCommit,
  'multiDNS': ?instance.multiDNS,
  'logging': ?instance.logging,
  'ignoreUnknownClients': ?instance.ignoreUnknownClients,
  'hosts': ?instance.hosts,
};

_Ntp _$NtpFromJson(Map<String, dynamic> json) => _Ntp(
  ipv4: json['ipv4'] == null
      ? null
      : NtpEntry.fromJson(json['ipv4'] as Map<String, dynamic>),
  ipv6: json['ipv6'] == null
      ? null
      : NtpEntry.fromJson(json['ipv6'] as Map<String, dynamic>),
  sync: json['sync'] == null
      ? null
      : NtpSync.fromJson(json['sync'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NtpToJson(_Ntp instance) => <String, dynamic>{
  'ipv4': ?instance.ipv4?.toJson(),
  'ipv6': ?instance.ipv6?.toJson(),
  'sync': ?instance.sync?.toJson(),
};

_NtpEntry _$NtpEntryFromJson(Map<String, dynamic> json) => _NtpEntry(
  active: json['active'] as bool?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$NtpEntryToJson(_NtpEntry instance) => <String, dynamic>{
  'active': instance.active,
  'address': instance.address,
};

_NtpSync _$NtpSyncFromJson(Map<String, dynamic> json) => _NtpSync(
  active: json['active'] as bool?,
  server: json['server'] as String?,
  interval: (json['interval'] as num?)?.toInt(),
  count: (json['count'] as num?)?.toInt(),
  rtc: json['rtc'] == null
      ? null
      : NtpRtc.fromJson(json['rtc'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NtpSyncToJson(_NtpSync instance) => <String, dynamic>{
  'active': ?instance.active,
  'server': ?instance.server,
  'interval': ?instance.interval,
  'count': ?instance.count,
  'rtc': ?instance.rtc?.toJson(),
};

_NtpRtc _$NtpRtcFromJson(Map<String, dynamic> json) => _NtpRtc(
  set: json['set'] as bool?,
  device: json['device'] as String?,
  utc: json['utc'] as bool?,
);

Map<String, dynamic> _$NtpRtcToJson(_NtpRtc instance) => <String, dynamic>{
  'set': ?instance.set,
  'device': ?instance.device,
  'utc': ?instance.utc,
};

_Resolver _$ResolverFromJson(Map<String, dynamic> json) => _Resolver(
  resolveIPv4: json['resolveIPv4'] as bool?,
  resolveIPv6: json['resolveIPv6'] as bool?,
  networkNames: json['networkNames'] as bool?,
  refreshNames: json['refreshNames'] as String?,
);

Map<String, dynamic> _$ResolverToJson(_Resolver instance) => <String, dynamic>{
  'resolveIPv4': ?instance.resolveIPv4,
  'resolveIPv6': ?instance.resolveIPv6,
  'networkNames': ?instance.networkNames,
  'refreshNames': ?instance.refreshNames,
};

_Database _$DatabaseFromJson(Map<String, dynamic> json) => _Database(
  dbImport: json['DBimport'] as bool?,
  maxDBdays: (json['maxDBdays'] as num?)?.toInt(),
  dbInterval: (json['DBinterval'] as num?)?.toInt(),
  useWAL: json['useWAL'] as bool?,
  network: json['network'] == null
      ? null
      : DatabaseNetwork.fromJson(json['network'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DatabaseToJson(_Database instance) => <String, dynamic>{
  'DBimport': ?instance.dbImport,
  'maxDBdays': ?instance.maxDBdays,
  'DBinterval': ?instance.dbInterval,
  'useWAL': ?instance.useWAL,
  'network': ?instance.network?.toJson(),
};

_DatabaseNetwork _$DatabaseNetworkFromJson(Map<String, dynamic> json) =>
    _DatabaseNetwork(
      parseARPcache: json['parseARPcache'] as bool?,
      expire: (json['expire'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DatabaseNetworkToJson(_DatabaseNetwork instance) =>
    <String, dynamic>{
      'parseARPcache': ?instance.parseARPcache,
      'expire': ?instance.expire,
    };

_Webserver _$WebserverFromJson(Map<String, dynamic> json) => _Webserver(
  domain: json['domain'] as String?,
  acl: json['acl'] as String?,
  port: json['port'] as String?,
  threads: (json['threads'] as num?)?.toInt(),
  headers: (json['headers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  serveAll: json['serve_all'] as bool?,
  session: json['session'] == null
      ? null
      : WebSession.fromJson(json['session'] as Map<String, dynamic>),
  tls: json['tls'] == null
      ? null
      : WebTls.fromJson(json['tls'] as Map<String, dynamic>),
  paths: json['paths'] == null
      ? null
      : WebPaths.fromJson(json['paths'] as Map<String, dynamic>),
  interface: json['interface'] == null
      ? null
      : WebInterface.fromJson(json['interface'] as Map<String, dynamic>),
  api: json['api'] == null
      ? null
      : WebApi.fromJson(json['api'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WebserverToJson(_Webserver instance) =>
    <String, dynamic>{
      'domain': ?instance.domain,
      'acl': ?instance.acl,
      'port': ?instance.port,
      'threads': ?instance.threads,
      'headers': ?instance.headers,
      'serve_all': ?instance.serveAll,
      'session': ?instance.session?.toJson(),
      'tls': ?instance.tls?.toJson(),
      'paths': ?instance.paths?.toJson(),
      'interface': ?instance.interface?.toJson(),
      'api': ?instance.api?.toJson(),
    };

_WebSession _$WebSessionFromJson(Map<String, dynamic> json) => _WebSession(
  timeout: (json['timeout'] as num?)?.toInt(),
  restore: json['restore'] as bool?,
);

Map<String, dynamic> _$WebSessionToJson(_WebSession instance) =>
    <String, dynamic>{
      'timeout': ?instance.timeout,
      'restore': ?instance.restore,
    };

_WebTls _$WebTlsFromJson(Map<String, dynamic> json) =>
    _WebTls(cert: json['cert'] as String?);

Map<String, dynamic> _$WebTlsToJson(_WebTls instance) => <String, dynamic>{
  'cert': ?instance.cert,
};

_WebPaths _$WebPathsFromJson(Map<String, dynamic> json) => _WebPaths(
  webroot: json['webroot'] as String?,
  webhome: json['webhome'] as String?,
  prefix: json['prefix'] as String?,
);

Map<String, dynamic> _$WebPathsToJson(_WebPaths instance) => <String, dynamic>{
  'webroot': ?instance.webroot,
  'webhome': ?instance.webhome,
  'prefix': ?instance.prefix,
};

_WebInterface _$WebInterfaceFromJson(Map<String, dynamic> json) =>
    _WebInterface(
      boxed: json['boxed'] as bool?,
      theme: json['theme'] as String?,
    );

Map<String, dynamic> _$WebInterfaceToJson(_WebInterface instance) =>
    <String, dynamic>{'boxed': ?instance.boxed, 'theme': ?instance.theme};

_WebApi _$WebApiFromJson(Map<String, dynamic> json) => _WebApi(
  maxSessions: (json['max_sessions'] as num?)?.toInt(),
  prettyJSON: json['prettyJSON'] as bool?,
  password: json['password'] as String?,
  pwhash: json['pwhash'] as String?,
  totpSecret: json['totp_secret'] as String?,
  appPwhash: json['app_pwhash'] as String?,
  appSudo: json['app_sudo'] as bool?,
  cliPw: json['cli_pw'] as bool?,
  excludeClients: (json['excludeClients'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  excludeDomains: (json['excludeDomains'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  maxHistory: (json['maxHistory'] as num?)?.toInt(),
  maxClients: (json['maxClients'] as num?)?.toInt(),
  clientHistoryGlobalMax: json['client_history_global_max'] as bool?,
  allowDestructive: json['allow_destructive'] as bool?,
  temp: json['temp'] == null
      ? null
      : Temp.fromJson(json['temp'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WebApiToJson(_WebApi instance) => <String, dynamic>{
  'max_sessions': ?instance.maxSessions,
  'prettyJSON': ?instance.prettyJSON,
  'password': ?instance.password,
  'pwhash': ?instance.pwhash,
  'totp_secret': ?instance.totpSecret,
  'app_pwhash': ?instance.appPwhash,
  'app_sudo': ?instance.appSudo,
  'cli_pw': ?instance.cliPw,
  'excludeClients': ?instance.excludeClients,
  'excludeDomains': ?instance.excludeDomains,
  'maxHistory': ?instance.maxHistory,
  'maxClients': ?instance.maxClients,
  'client_history_global_max': ?instance.clientHistoryGlobalMax,
  'allow_destructive': ?instance.allowDestructive,
  'temp': ?instance.temp?.toJson(),
};

_Temp _$TempFromJson(Map<String, dynamic> json) => _Temp(
  limit: (json['limit'] as num?)?.toDouble(),
  unit: json['unit'] as String?,
);

Map<String, dynamic> _$TempToJson(_Temp instance) => <String, dynamic>{
  'limit': ?instance.limit,
  'unit': ?instance.unit,
};

_Files _$FilesFromJson(Map<String, dynamic> json) => _Files(
  pid: json['pid'] as String?,
  database: json['database'] as String?,
  gravity: json['gravity'] as String?,
  gravityTmp: json['gravity_tmp'] as String?,
  macvendor: json['macvendor'] as String?,
  setupVars: json['setupVars'] as String?,
  pcap: json['pcap'] as String?,
  log: json['log'] == null
      ? null
      : LogFiles.fromJson(json['log'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FilesToJson(_Files instance) => <String, dynamic>{
  'pid': ?instance.pid,
  'database': ?instance.database,
  'gravity': ?instance.gravity,
  'gravity_tmp': ?instance.gravityTmp,
  'macvendor': ?instance.macvendor,
  'setupVars': ?instance.setupVars,
  'pcap': ?instance.pcap,
  'log': ?instance.log?.toJson(),
};

_LogFiles _$LogFilesFromJson(Map<String, dynamic> json) => _LogFiles(
  ftl: json['ftl'] as String?,
  dnsmasq: json['dnsmasq'] as String?,
  webserver: json['webserver'] as String?,
);

Map<String, dynamic> _$LogFilesToJson(_LogFiles instance) => <String, dynamic>{
  'ftl': ?instance.ftl,
  'dnsmasq': ?instance.dnsmasq,
  'webserver': ?instance.webserver,
};

_Misc _$MiscFromJson(Map<String, dynamic> json) => _Misc(
  nice: (json['nice'] as num?)?.toInt(),
  delayStartup: (json['delay_startup'] as num?)?.toInt(),
  addr2line: json['addr2line'] as bool?,
  etcDnsmasqD: json['etc_dnsmasq_d'] as bool?,
  privacylevel: (json['privacylevel'] as num?)?.toInt(),
  dnsmasqLines: (json['dnsmasq_lines'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  extraLogging: json['extraLogging'] as bool?,
  readOnly: json['readOnly'] as bool?,
  check: json['check'] == null
      ? null
      : Check.fromJson(json['check'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MiscToJson(_Misc instance) => <String, dynamic>{
  'nice': ?instance.nice,
  'delay_startup': ?instance.delayStartup,
  'addr2line': ?instance.addr2line,
  'etc_dnsmasq_d': ?instance.etcDnsmasqD,
  'privacylevel': ?instance.privacylevel,
  'dnsmasq_lines': ?instance.dnsmasqLines,
  'extraLogging': ?instance.extraLogging,
  'readOnly': ?instance.readOnly,
  'check': ?instance.check?.toJson(),
};

_Check _$CheckFromJson(Map<String, dynamic> json) => _Check(
  load: json['load'] as bool?,
  shmem: (json['shmem'] as num?)?.toInt(),
  disk: (json['disk'] as num?)?.toInt(),
);

Map<String, dynamic> _$CheckToJson(_Check instance) => <String, dynamic>{
  'load': ?instance.load,
  'shmem': ?instance.shmem,
  'disk': ?instance.disk,
};

_Debug _$DebugFromJson(Map<String, dynamic> json) => _Debug(
  database: json['database'] as bool?,
  networking: json['networking'] as bool?,
  locks: json['locks'] as bool?,
  queries: json['queries'] as bool?,
  flags: json['flags'] as bool?,
  shmem: json['shmem'] as bool?,
  gc: json['gc'] as bool?,
  arp: json['arp'] as bool?,
  regex: json['regex'] as bool?,
  api: json['api'] as bool?,
  tls: json['tls'] as bool?,
  overtime: json['overtime'] as bool?,
  status: json['status'] as bool?,
  caps: json['caps'] as bool?,
  dnssec: json['dnssec'] as bool?,
  vectors: json['vectors'] as bool?,
  resolver: json['resolver'] as bool?,
  edns0: json['edns0'] as bool?,
  clients: json['clients'] as bool?,
  aliasclients: json['aliasclients'] as bool?,
  events: json['events'] as bool?,
  helper: json['helper'] as bool?,
  config: json['config'] as bool?,
  inotify: json['inotify'] as bool?,
  webserver: json['webserver'] as bool?,
  extra: json['extra'] as bool?,
  reserved: json['reserved'] as bool?,
  ntp: json['ntp'] as bool?,
  netlink: json['netlink'] as bool?,
  all: json['all'] as bool?,
);

Map<String, dynamic> _$DebugToJson(_Debug instance) => <String, dynamic>{
  'database': ?instance.database,
  'networking': ?instance.networking,
  'locks': ?instance.locks,
  'queries': ?instance.queries,
  'flags': ?instance.flags,
  'shmem': ?instance.shmem,
  'gc': ?instance.gc,
  'arp': ?instance.arp,
  'regex': ?instance.regex,
  'api': ?instance.api,
  'tls': ?instance.tls,
  'overtime': ?instance.overtime,
  'status': ?instance.status,
  'caps': ?instance.caps,
  'dnssec': ?instance.dnssec,
  'vectors': ?instance.vectors,
  'resolver': ?instance.resolver,
  'edns0': ?instance.edns0,
  'clients': ?instance.clients,
  'aliasclients': ?instance.aliasclients,
  'events': ?instance.events,
  'helper': ?instance.helper,
  'config': ?instance.config,
  'inotify': ?instance.inotify,
  'webserver': ?instance.webserver,
  'extra': ?instance.extra,
  'reserved': ?instance.reserved,
  'ntp': ?instance.ntp,
  'netlink': ?instance.netlink,
  'all': ?instance.all,
};
