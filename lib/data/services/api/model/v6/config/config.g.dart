// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Config _$ConfigFromJson(Map<String, dynamic> json) => _Config(
      config: json['config'] == null
          ? null
          : ConfigData.fromJson(json['config'] as Map<String, dynamic>),
      took: (json['took'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ConfigToJson(_Config instance) => <String, dynamic>{
      if (instance.config?.toJson() case final value?) 'config': value,
      if (instance.took case final value?) 'took': value,
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
      if (instance.dns?.toJson() case final value?) 'dns': value,
      if (instance.dhcp?.toJson() case final value?) 'dhcp': value,
      if (instance.ntp?.toJson() case final value?) 'ntp': value,
      if (instance.resolver?.toJson() case final value?) 'resolver': value,
      if (instance.database?.toJson() case final value?) 'database': value,
      if (instance.webserver?.toJson() case final value?) 'webserver': value,
      if (instance.files?.toJson() case final value?) 'files': value,
      if (instance.misc?.toJson() case final value?) 'misc': value,
      if (instance.debug?.toJson() case final value?) 'debug': value,
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
      hosts:
          (json['hosts'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
          : SpecialDomains.fromJson(
              json['specialDomains'] as Map<String, dynamic>),
      reply: json['reply'] == null
          ? null
          : DnsReply.fromJson(json['reply'] as Map<String, dynamic>),
      rateLimit: json['rateLimit'] == null
          ? null
          : RateLimit.fromJson(json['rateLimit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DnsToJson(_Dns instance) => <String, dynamic>{
      if (instance.upstreams case final value?) 'upstreams': value,
      if (instance.cnameDeepInspect case final value?)
        'CNAMEdeepInspect': value,
      if (instance.blockESNI case final value?) 'blockESNI': value,
      if (instance.edns0ECS case final value?) 'EDNS0ECS': value,
      if (instance.ignoreLocalhost case final value?) 'ignoreLocalhost': value,
      if (instance.showDNSSEC case final value?) 'showDNSSEC': value,
      if (instance.analyzeOnlyAandAAAA case final value?)
        'analyzeOnlyAandAAAA': value,
      if (instance.piholePTR case final value?) 'piholePTR': value,
      if (instance.replyWhenBusy case final value?) 'replyWhenBusy': value,
      if (instance.blockTTL case final value?) 'blockTTL': value,
      if (instance.hosts case final value?) 'hosts': value,
      if (instance.domainNeeded case final value?) 'domainNeeded': value,
      if (instance.expandHosts case final value?) 'expandHosts': value,
      if (instance.domain case final value?) 'domain': value,
      if (instance.bogusPriv case final value?) 'bogusPriv': value,
      if (instance.dnssec case final value?) 'dnssec': value,
      if (instance.interface case final value?) 'interface': value,
      if (instance.hostRecord case final value?) 'hostRecord': value,
      if (instance.listeningMode case final value?) 'listeningMode': value,
      if (instance.queryLogging case final value?) 'queryLogging': value,
      if (instance.cnameRecords case final value?) 'cnameRecords': value,
      if (instance.port case final value?) 'port': value,
      if (instance.cache?.toJson() case final value?) 'cache': value,
      if (instance.revServers case final value?) 'revServers': value,
      if (instance.blocking?.toJson() case final value?) 'blocking': value,
      if (instance.specialDomains?.toJson() case final value?)
        'specialDomains': value,
      if (instance.reply?.toJson() case final value?) 'reply': value,
      if (instance.rateLimit?.toJson() case final value?) 'rateLimit': value,
    };

_DnsCache _$DnsCacheFromJson(Map<String, dynamic> json) => _DnsCache(
      size: (json['size'] as num?)?.toInt(),
      optimizer: (json['optimizer'] as num?)?.toInt(),
      upstreamBlockedTTL: (json['upstreamBlockedTTL'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DnsCacheToJson(_DnsCache instance) => <String, dynamic>{
      if (instance.size case final value?) 'size': value,
      if (instance.optimizer case final value?) 'optimizer': value,
      if (instance.upstreamBlockedTTL case final value?)
        'upstreamBlockedTTL': value,
    };

_DnsBlocking _$DnsBlockingFromJson(Map<String, dynamic> json) => _DnsBlocking(
      active: json['active'] as bool?,
      mode: json['mode'] as String?,
      edns: json['edns'] as String?,
    );

Map<String, dynamic> _$DnsBlockingToJson(_DnsBlocking instance) =>
    <String, dynamic>{
      if (instance.active case final value?) 'active': value,
      if (instance.mode case final value?) 'mode': value,
      if (instance.edns case final value?) 'edns': value,
    };

_SpecialDomains _$SpecialDomainsFromJson(Map<String, dynamic> json) =>
    _SpecialDomains(
      mozillaCanary: json['mozillaCanary'] as bool?,
      iCloudPrivateRelay: json['iCloudPrivateRelay'] as bool?,
      designatedResolver: json['designatedResolver'] as bool?,
    );

Map<String, dynamic> _$SpecialDomainsToJson(_SpecialDomains instance) =>
    <String, dynamic>{
      if (instance.mozillaCanary case final value?) 'mozillaCanary': value,
      if (instance.iCloudPrivateRelay case final value?)
        'iCloudPrivateRelay': value,
      if (instance.designatedResolver case final value?)
        'designatedResolver': value,
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
      if (instance.host?.toJson() case final value?) 'host': value,
      if (instance.blocking?.toJson() case final value?) 'blocking': value,
    };

_ReplyHost _$ReplyHostFromJson(Map<String, dynamic> json) => _ReplyHost(
      force4: json['force4'] as bool?,
      force6: json['force6'] as bool?,
      ipv4: json['IPv4'] as String?,
      ipv6: json['IPv6'] as String?,
    );

Map<String, dynamic> _$ReplyHostToJson(_ReplyHost instance) =>
    <String, dynamic>{
      if (instance.force4 case final value?) 'force4': value,
      if (instance.force6 case final value?) 'force6': value,
      if (instance.ipv4 case final value?) 'IPv4': value,
      if (instance.ipv6 case final value?) 'IPv6': value,
    };

_RateLimit _$RateLimitFromJson(Map<String, dynamic> json) => _RateLimit(
      count: (json['count'] as num?)?.toInt(),
      interval: (json['interval'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RateLimitToJson(_RateLimit instance) =>
    <String, dynamic>{
      if (instance.count case final value?) 'count': value,
      if (instance.interval case final value?) 'interval': value,
    };

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
      hosts:
          (json['hosts'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DhcpToJson(_Dhcp instance) => <String, dynamic>{
      if (instance.active case final value?) 'active': value,
      if (instance.start case final value?) 'start': value,
      if (instance.end case final value?) 'end': value,
      if (instance.router case final value?) 'router': value,
      if (instance.netmask case final value?) 'netmask': value,
      if (instance.leaseTime case final value?) 'leaseTime': value,
      if (instance.ipv6 case final value?) 'ipv6': value,
      if (instance.rapidCommit case final value?) 'rapidCommit': value,
      if (instance.multiDNS case final value?) 'multiDNS': value,
      if (instance.logging case final value?) 'logging': value,
      if (instance.ignoreUnknownClients case final value?)
        'ignoreUnknownClients': value,
      if (instance.hosts case final value?) 'hosts': value,
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
      if (instance.ipv4?.toJson() case final value?) 'ipv4': value,
      if (instance.ipv6?.toJson() case final value?) 'ipv6': value,
      if (instance.sync?.toJson() case final value?) 'sync': value,
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
      if (instance.active case final value?) 'active': value,
      if (instance.server case final value?) 'server': value,
      if (instance.interval case final value?) 'interval': value,
      if (instance.count case final value?) 'count': value,
      if (instance.rtc?.toJson() case final value?) 'rtc': value,
    };

_NtpRtc _$NtpRtcFromJson(Map<String, dynamic> json) => _NtpRtc(
      set: json['set'] as bool?,
      device: json['device'] as String?,
      utc: json['utc'] as bool?,
    );

Map<String, dynamic> _$NtpRtcToJson(_NtpRtc instance) => <String, dynamic>{
      if (instance.set case final value?) 'set': value,
      if (instance.device case final value?) 'device': value,
      if (instance.utc case final value?) 'utc': value,
    };

_Resolver _$ResolverFromJson(Map<String, dynamic> json) => _Resolver(
      resolveIPv4: json['resolveIPv4'] as bool?,
      resolveIPv6: json['resolveIPv6'] as bool?,
      networkNames: json['networkNames'] as bool?,
      refreshNames: json['refreshNames'] as String?,
    );

Map<String, dynamic> _$ResolverToJson(_Resolver instance) => <String, dynamic>{
      if (instance.resolveIPv4 case final value?) 'resolveIPv4': value,
      if (instance.resolveIPv6 case final value?) 'resolveIPv6': value,
      if (instance.networkNames case final value?) 'networkNames': value,
      if (instance.refreshNames case final value?) 'refreshNames': value,
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
      if (instance.dbImport case final value?) 'DBimport': value,
      if (instance.maxDBdays case final value?) 'maxDBdays': value,
      if (instance.dbInterval case final value?) 'DBinterval': value,
      if (instance.useWAL case final value?) 'useWAL': value,
      if (instance.network?.toJson() case final value?) 'network': value,
    };

_DatabaseNetwork _$DatabaseNetworkFromJson(Map<String, dynamic> json) =>
    _DatabaseNetwork(
      parseARPcache: json['parseARPcache'] as bool?,
      expire: (json['expire'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DatabaseNetworkToJson(_DatabaseNetwork instance) =>
    <String, dynamic>{
      if (instance.parseARPcache case final value?) 'parseARPcache': value,
      if (instance.expire case final value?) 'expire': value,
    };

_Webserver _$WebserverFromJson(Map<String, dynamic> json) => _Webserver(
      domain: json['domain'] as String?,
      acl: json['acl'] as String?,
      port: json['port'] as String?,
      threads: (json['threads'] as num?)?.toInt(),
      headers:
          (json['headers'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
      if (instance.domain case final value?) 'domain': value,
      if (instance.acl case final value?) 'acl': value,
      if (instance.port case final value?) 'port': value,
      if (instance.threads case final value?) 'threads': value,
      if (instance.headers case final value?) 'headers': value,
      if (instance.serveAll case final value?) 'serve_all': value,
      if (instance.session?.toJson() case final value?) 'session': value,
      if (instance.tls?.toJson() case final value?) 'tls': value,
      if (instance.paths?.toJson() case final value?) 'paths': value,
      if (instance.interface?.toJson() case final value?) 'interface': value,
      if (instance.api?.toJson() case final value?) 'api': value,
    };

_WebSession _$WebSessionFromJson(Map<String, dynamic> json) => _WebSession(
      timeout: (json['timeout'] as num?)?.toInt(),
      restore: json['restore'] as bool?,
    );

Map<String, dynamic> _$WebSessionToJson(_WebSession instance) =>
    <String, dynamic>{
      if (instance.timeout case final value?) 'timeout': value,
      if (instance.restore case final value?) 'restore': value,
    };

_WebTls _$WebTlsFromJson(Map<String, dynamic> json) => _WebTls(
      cert: json['cert'] as String?,
    );

Map<String, dynamic> _$WebTlsToJson(_WebTls instance) => <String, dynamic>{
      if (instance.cert case final value?) 'cert': value,
    };

_WebPaths _$WebPathsFromJson(Map<String, dynamic> json) => _WebPaths(
      webroot: json['webroot'] as String?,
      webhome: json['webhome'] as String?,
      prefix: json['prefix'] as String?,
    );

Map<String, dynamic> _$WebPathsToJson(_WebPaths instance) => <String, dynamic>{
      if (instance.webroot case final value?) 'webroot': value,
      if (instance.webhome case final value?) 'webhome': value,
      if (instance.prefix case final value?) 'prefix': value,
    };

_WebInterface _$WebInterfaceFromJson(Map<String, dynamic> json) =>
    _WebInterface(
      boxed: json['boxed'] as bool?,
      theme: json['theme'] as String?,
    );

Map<String, dynamic> _$WebInterfaceToJson(_WebInterface instance) =>
    <String, dynamic>{
      if (instance.boxed case final value?) 'boxed': value,
      if (instance.theme case final value?) 'theme': value,
    };

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
      if (instance.maxSessions case final value?) 'max_sessions': value,
      if (instance.prettyJSON case final value?) 'prettyJSON': value,
      if (instance.password case final value?) 'password': value,
      if (instance.pwhash case final value?) 'pwhash': value,
      if (instance.totpSecret case final value?) 'totp_secret': value,
      if (instance.appPwhash case final value?) 'app_pwhash': value,
      if (instance.appSudo case final value?) 'app_sudo': value,
      if (instance.cliPw case final value?) 'cli_pw': value,
      if (instance.excludeClients case final value?) 'excludeClients': value,
      if (instance.excludeDomains case final value?) 'excludeDomains': value,
      if (instance.maxHistory case final value?) 'maxHistory': value,
      if (instance.maxClients case final value?) 'maxClients': value,
      if (instance.clientHistoryGlobalMax case final value?)
        'client_history_global_max': value,
      if (instance.allowDestructive case final value?)
        'allow_destructive': value,
      if (instance.temp?.toJson() case final value?) 'temp': value,
    };

_Temp _$TempFromJson(Map<String, dynamic> json) => _Temp(
      limit: (json['limit'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$TempToJson(_Temp instance) => <String, dynamic>{
      if (instance.limit case final value?) 'limit': value,
      if (instance.unit case final value?) 'unit': value,
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
      if (instance.pid case final value?) 'pid': value,
      if (instance.database case final value?) 'database': value,
      if (instance.gravity case final value?) 'gravity': value,
      if (instance.gravityTmp case final value?) 'gravity_tmp': value,
      if (instance.macvendor case final value?) 'macvendor': value,
      if (instance.setupVars case final value?) 'setupVars': value,
      if (instance.pcap case final value?) 'pcap': value,
      if (instance.log?.toJson() case final value?) 'log': value,
    };

_LogFiles _$LogFilesFromJson(Map<String, dynamic> json) => _LogFiles(
      ftl: json['ftl'] as String?,
      dnsmasq: json['dnsmasq'] as String?,
      webserver: json['webserver'] as String?,
    );

Map<String, dynamic> _$LogFilesToJson(_LogFiles instance) => <String, dynamic>{
      if (instance.ftl case final value?) 'ftl': value,
      if (instance.dnsmasq case final value?) 'dnsmasq': value,
      if (instance.webserver case final value?) 'webserver': value,
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
      if (instance.nice case final value?) 'nice': value,
      if (instance.delayStartup case final value?) 'delay_startup': value,
      if (instance.addr2line case final value?) 'addr2line': value,
      if (instance.etcDnsmasqD case final value?) 'etc_dnsmasq_d': value,
      if (instance.privacylevel case final value?) 'privacylevel': value,
      if (instance.dnsmasqLines case final value?) 'dnsmasq_lines': value,
      if (instance.extraLogging case final value?) 'extraLogging': value,
      if (instance.readOnly case final value?) 'readOnly': value,
      if (instance.check?.toJson() case final value?) 'check': value,
    };

_Check _$CheckFromJson(Map<String, dynamic> json) => _Check(
      load: json['load'] as bool?,
      shmem: (json['shmem'] as num?)?.toInt(),
      disk: (json['disk'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckToJson(_Check instance) => <String, dynamic>{
      if (instance.load case final value?) 'load': value,
      if (instance.shmem case final value?) 'shmem': value,
      if (instance.disk case final value?) 'disk': value,
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
      configData: json['ConfigData'] as bool?,
      inotify: json['inotify'] as bool?,
      webserver: json['webserver'] as bool?,
      extra: json['extra'] as bool?,
      reserved: json['reserved'] as bool?,
      ntp: json['ntp'] as bool?,
      netlink: json['netlink'] as bool?,
      all: json['all'] as bool?,
    );

Map<String, dynamic> _$DebugToJson(_Debug instance) => <String, dynamic>{
      if (instance.database case final value?) 'database': value,
      if (instance.networking case final value?) 'networking': value,
      if (instance.locks case final value?) 'locks': value,
      if (instance.queries case final value?) 'queries': value,
      if (instance.flags case final value?) 'flags': value,
      if (instance.shmem case final value?) 'shmem': value,
      if (instance.gc case final value?) 'gc': value,
      if (instance.arp case final value?) 'arp': value,
      if (instance.regex case final value?) 'regex': value,
      if (instance.api case final value?) 'api': value,
      if (instance.tls case final value?) 'tls': value,
      if (instance.overtime case final value?) 'overtime': value,
      if (instance.status case final value?) 'status': value,
      if (instance.caps case final value?) 'caps': value,
      if (instance.dnssec case final value?) 'dnssec': value,
      if (instance.vectors case final value?) 'vectors': value,
      if (instance.resolver case final value?) 'resolver': value,
      if (instance.edns0 case final value?) 'edns0': value,
      if (instance.clients case final value?) 'clients': value,
      if (instance.aliasclients case final value?) 'aliasclients': value,
      if (instance.events case final value?) 'events': value,
      if (instance.helper case final value?) 'helper': value,
      if (instance.configData case final value?) 'ConfigData': value,
      if (instance.inotify case final value?) 'inotify': value,
      if (instance.webserver case final value?) 'webserver': value,
      if (instance.extra case final value?) 'extra': value,
      if (instance.reserved case final value?) 'reserved': value,
      if (instance.ntp case final value?) 'ntp': value,
      if (instance.netlink case final value?) 'netlink': value,
      if (instance.all case final value?) 'all': value,
    };
