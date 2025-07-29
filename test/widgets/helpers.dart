import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/config/query_types.dart';
import 'package:pi_hole_client/data/services/api/api_gateway_interface.dart';
import 'package:pi_hole_client/data/services/api/model/v6/auth/sessions.dart';
import 'package:pi_hole_client/data/services/api/model/v6/config/config.dart'
    show Config;
import 'package:pi_hole_client/data/services/api/model/v6/dhcp/dhcp.dart'
    show Dhcp;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/client.dart'
    show InfoClient;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/host.dart'
    show InfoHost;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/messages.dart'
    show InfoMessages;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/metrics.dart'
    show InfoMetrics;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/sensors.dart'
    show InfoSensors;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/system.dart'
    show InfoSystem;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/version.dart'
    show InfoVersion;
import 'package:pi_hole_client/data/services/api/model/v6/groups/groups.dart'
    show Groups;
import 'package:pi_hole_client/data/services/api/model/v6/lists/lists.dart'
    show Lists;
import 'package:pi_hole_client/data/services/api/model/v6/metrics/query.dart';
import 'package:pi_hole_client/data/services/api/model/v6/network/devices.dart';
import 'package:pi_hole_client/data/services/api/model/v6/network/gateway.dart';
import 'package:pi_hole_client/data/services/api/shared/models/app_log.dart';
import 'package:pi_hole_client/data/services/api/shared/models/client.dart';
import 'package:pi_hole_client/data/services/api/shared/models/config.dart';
import 'package:pi_hole_client/data/services/api/shared/models/devices.dart';
import 'package:pi_hole_client/data/services/api/shared/models/dhcp.dart';
import 'package:pi_hole_client/data/services/api/shared/models/domain.dart';
import 'package:pi_hole_client/data/services/api/shared/models/gateway.dart';
import 'package:pi_hole_client/data/services/api/shared/models/gateways.dart';
import 'package:pi_hole_client/data/services/api/shared/models/groups.dart';
import 'package:pi_hole_client/data/services/api/shared/models/host.dart';
import 'package:pi_hole_client/data/services/api/shared/models/log.dart';
import 'package:pi_hole_client/data/services/api/shared/models/messages.dart';
import 'package:pi_hole_client/data/services/api/shared/models/metrics.dart';
import 'package:pi_hole_client/data/services/api/shared/models/overtime_data.dart';
import 'package:pi_hole_client/data/services/api/shared/models/realtime_status.dart';
import 'package:pi_hole_client/data/services/api/shared/models/sensors.dart';
import 'package:pi_hole_client/data/services/api/shared/models/sessions.dart';
import 'package:pi_hole_client/data/services/api/shared/models/subscriptions.dart';
import 'package:pi_hole_client/data/services/api/shared/models/system.dart';
import 'package:pi_hole_client/data/services/api/shared/models/version.dart';
import 'package:pi_hole_client/data/services/api/v5/api_gateway_v5.dart';
import 'package:pi_hole_client/data/services/api/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/domain/models/server.dart';
import 'package:pi_hole_client/domain/use_cases/status_update_service.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/domains_list_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/gravity_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/subscriptions_list_provider.dart';
import 'package:provider/provider.dart';

import './helpers.mocks.dart';

final serverV5 = Server(
  address: 'http://localhost:8080',
  alias: 'test v5',
  defaultServer: false,
  apiVersion: 'v5',
  enabled: false,
  allowSelfSignedCert: true,
);

final serverV6 = Server(
  address: 'http://localhost:8081',
  alias: 'test v6',
  defaultServer: false,
  apiVersion: 'v6',
  enabled: true,
  allowSelfSignedCert: true,
);

final domains = [
  Domain(
    id: 1,
    type: 0,
    domain: 'example.com',
    enabled: 1,
    dateAdded: DateTime.now(),
    dateModified: DateTime.now(),
    comment: null,
    groups: [0],
  ),
];

final blackDomains = [
  Domain(
    id: 3,
    type: 1,
    domain: 'black01.example.com',
    enabled: 1,
    dateAdded: DateTime.now(),
    dateModified: DateTime.now(),
    comment: null,
    groups: [0],
  ),
];

final whiteDomains = [
  Domain(
    id: 1,
    type: 1,
    domain: 'white01.example.com',
    enabled: 1,
    dateAdded: DateTime.now(),
    dateModified: DateTime.now(),
    comment: null,
    groups: [0],
  ),
  Domain(
    id: 2,
    type: 1,
    domain: 'white02.example.com',
    enabled: 1,
    dateAdded: DateTime.now(),
    dateModified: DateTime.now(),
    comment: null,
    groups: [0],
  ),
];

final queries = Queries.fromJson({
  'queries': [
    {
      'id': 1,
      'time': DateTime.now().millisecondsSinceEpoch / 1000 - 600,
      'type': 'A',
      'domain': 'white.example.com',
      'cname': null,
      'status': 'FORWARDED',
      'client': {'ip': '192.168.100.2'},
      'dnssec': 'INSECURE',
      'reply': {'type': 'IP', 'time': 19},
      'list_id': null,
      'upstream': 'localhost#5353',
      'dbid': 112421354, // Not exist
      'ede': {'code': -1, 'text': null},
    },
  ],
  'cursor': 175881,
  'recordsTotal': 1234,
  'recordsFiltered': 1234,
  'draw': 1,
  'took': 0.003,
});

final overtimeData = OverTimeData.fromJson(
  {
    'domains_over_time': {
      '1733391300': 0,
      '1733391900': 0,
      '1733392500': 0,
      '1733393100': 0,
      '1733393700': 0,
      '1733394300': 0,
      '1733394900': 0,
      '1733395500': 0,
      '1733396100': 0,
      '1733396700': 3,
      '1733397300': 0,
      '1733397900': 0,
      '1733398500': 0,
      '1733399100': 0,
      '1733399700': 0,
      '1733400300': 2,
      '1733400900': 7,
      '1733401500': 0,
      '1733402100': 0,
      '1733402700': 0,
      '1733403300': 0,
      '1733403900': 2,
      '1733404500': 0,
      '1733405100': 0,
      '1733405700': 0,
      '1733406300': 0,
      '1733406900': 0,
      '1733407500': 2,
      '1733408100': 0,
      '1733408700': 0,
      '1733409300': 0,
      '1733409900': 0,
      '1733410500': 0,
      '1733411100': 0,
      '1733411700': 0,
      '1733412300': 0,
      '1733412900': 0,
      '1733413500': 0,
      '1733414100': 0,
      '1733414700': 0,
      '1733415300': 0,
      '1733415900': 0,
      '1733416500': 0,
      '1733417100': 0,
      '1733417700': 0,
      '1733418300': 0,
      '1733418900': 0,
      '1733419500': 0,
      '1733420100': 0,
      '1733420700': 0,
      '1733421300': 0,
      '1733421900': 0,
      '1733422500': 0,
      '1733423100': 0,
      '1733423700': 0,
      '1733424300': 0,
      '1733424900': 0,
      '1733425500': 0,
      '1733426100': 0,
      '1733426700': 0,
      '1733427300': 0,
      '1733427900': 0,
      '1733428500': 0,
      '1733429100': 0,
      '1733429700': 0,
      '1733430300': 0,
      '1733430900': 0,
      '1733431500': 0,
      '1733432100': 0,
      '1733432700': 0,
      '1733433300': 0,
      '1733433900': 0,
      '1733434500': 0,
      '1733435100': 0,
      '1733435700': 0,
      '1733436300': 0,
      '1733436900': 0,
      '1733437500': 0,
      '1733438100': 0,
      '1733438700': 0,
      '1733439300': 0,
      '1733439900': 0,
      '1733440500': 0,
      '1733441100': 0,
      '1733441700': 0,
      '1733442300': 0,
      '1733442900': 0,
      '1733443500': 0,
      '1733444100': 0,
      '1733444700': 0,
      '1733445300': 0,
      '1733445900': 0,
      '1733446500': 0,
      '1733447100': 0,
      '1733447700': 0,
      '1733448300': 0,
      '1733448900': 0,
      '1733449500': 0,
      '1733450100': 0,
      '1733450700': 0,
      '1733451300': 0,
      '1733451900': 0,
      '1733452500': 0,
      '1733453100': 0,
      '1733453700': 0,
      '1733454300': 0,
      '1733454900': 0,
      '1733455500': 0,
      '1733456100': 0,
      '1733456700': 0,
      '1733457300': 0,
      '1733457900': 0,
      '1733458500': 0,
      '1733459100': 0,
      '1733459700': 0,
      '1733460300': 0,
      '1733460900': 0,
      '1733461500': 0,
      '1733462100': 0,
      '1733462700': 0,
      '1733463300': 0,
      '1733463900': 0,
      '1733464500': 0,
      '1733465100': 0,
      '1733465700': 0,
      '1733466300': 0,
      '1733466900': 0,
      '1733467500': 0,
      '1733468100': 0,
      '1733468700': 0,
      '1733469300': 0,
      '1733469900': 0,
      '1733470500': 0,
      '1733471100': 0,
      '1733471700': 0,
      '1733472300': 0,
      '1733472900': 0,
      '1733473500': 0,
      '1733474100': 0,
      '1733474700': 0,
      '1733475300': 0,
      '1733475900': 0,
      '1733476500': 0,
      '1733477100': 0,
    },
    'ads_over_time': {
      '1733391300': 0,
      '1733391900': 0,
      '1733392500': 0,
      '1733393100': 0,
      '1733393700': 0,
      '1733394300': 0,
      '1733394900': 0,
      '1733395500': 0,
      '1733396100': 0,
      '1733396700': 0,
      '1733397300': 0,
      '1733397900': 0,
      '1733398500': 0,
      '1733399100': 0,
      '1733399700': 0,
      '1733400300': 0,
      '1733400900': 1,
      '1733401500': 0,
      '1733402100': 0,
      '1733402700': 0,
      '1733403300': 0,
      '1733403900': 0,
      '1733404500': 0,
      '1733405100': 0,
      '1733405700': 0,
      '1733406300': 0,
      '1733406900': 0,
      '1733407500': 0,
      '1733408100': 0,
      '1733408700': 0,
      '1733409300': 0,
      '1733409900': 0,
      '1733410500': 0,
      '1733411100': 0,
      '1733411700': 0,
      '1733412300': 0,
      '1733412900': 0,
      '1733413500': 0,
      '1733414100': 0,
      '1733414700': 0,
      '1733415300': 0,
      '1733415900': 0,
      '1733416500': 0,
      '1733417100': 0,
      '1733417700': 0,
      '1733418300': 0,
      '1733418900': 0,
      '1733419500': 0,
      '1733420100': 0,
      '1733420700': 0,
      '1733421300': 0,
      '1733421900': 0,
      '1733422500': 0,
      '1733423100': 0,
      '1733423700': 0,
      '1733424300': 0,
      '1733424900': 0,
      '1733425500': 0,
      '1733426100': 0,
      '1733426700': 0,
      '1733427300': 0,
      '1733427900': 0,
      '1733428500': 0,
      '1733429100': 0,
      '1733429700': 0,
      '1733430300': 0,
      '1733430900': 0,
      '1733431500': 0,
      '1733432100': 0,
      '1733432700': 0,
      '1733433300': 0,
      '1733433900': 0,
      '1733434500': 0,
      '1733435100': 0,
      '1733435700': 0,
      '1733436300': 0,
      '1733436900': 0,
      '1733437500': 0,
      '1733438100': 0,
      '1733438700': 0,
      '1733439300': 0,
      '1733439900': 0,
      '1733440500': 0,
      '1733441100': 0,
      '1733441700': 0,
      '1733442300': 0,
      '1733442900': 0,
      '1733443500': 0,
      '1733444100': 0,
      '1733444700': 0,
      '1733445300': 0,
      '1733445900': 0,
      '1733446500': 0,
      '1733447100': 0,
      '1733447700': 0,
      '1733448300': 0,
      '1733448900': 0,
      '1733449500': 0,
      '1733450100': 0,
      '1733450700': 0,
      '1733451300': 0,
      '1733451900': 0,
      '1733452500': 0,
      '1733453100': 0,
      '1733453700': 0,
      '1733454300': 0,
      '1733454900': 0,
      '1733455500': 0,
      '1733456100': 0,
      '1733456700': 0,
      '1733457300': 0,
      '1733457900': 0,
      '1733458500': 0,
      '1733459100': 0,
      '1733459700': 0,
      '1733460300': 0,
      '1733460900': 0,
      '1733461500': 0,
      '1733462100': 0,
      '1733462700': 0,
      '1733463300': 0,
      '1733463900': 0,
      '1733464500': 0,
      '1733465100': 0,
      '1733465700': 0,
      '1733466300': 0,
      '1733466900': 0,
      '1733467500': 0,
      '1733468100': 0,
      '1733468700': 0,
      '1733469300': 0,
      '1733469900': 0,
      '1733470500': 0,
      '1733471100': 0,
      '1733471700': 0,
      '1733472300': 0,
      '1733472900': 0,
      '1733473500': 0,
      '1733474100': 0,
      '1733474700': 0,
      '1733475300': 0,
      '1733475900': 0,
      '1733476500': 0,
      '1733477100': 0,
    },
    'clients': [
      {'name': '', 'ip': '172.26.0.1'},
      {'name': 'localhost', 'ip': '127.0.0.1'},
    ],
    'over_time': {
      '1733391300': [0, 0],
      '1733391900': [0, 0],
      '1733392500': [0, 0],
      '1733393100': [0, 0],
      '1733393700': [0, 0],
      '1733394300': [0, 0],
      '1733394900': [0, 0],
      '1733395500': [0, 0],
      '1733396100': [0, 0],
      '1733396700': [3, 0],
      '1733397300': [0, 0],
      '1733397900': [0, 0],
      '1733398500': [0, 0],
      '1733399100': [0, 0],
      '1733399700': [0, 0],
      '1733400300': [0, 2],
      '1733400900': [7, 0],
      '1733401500': [0, 0],
      '1733402100': [0, 0],
      '1733402700': [0, 0],
      '1733403300': [0, 0],
      '1733403900': [0, 2],
      '1733404500': [0, 0],
      '1733405100': [0, 0],
      '1733405700': [0, 0],
      '1733406300': [0, 0],
      '1733406900': [0, 0],
      '1733407500': [0, 2],
      '1733408100': [0, 0],
      '1733408700': [0, 0],
      '1733409300': [0, 0],
      '1733409900': [0, 0],
      '1733410500': [0, 0],
      '1733411100': [0, 0],
      '1733411700': [0, 0],
      '1733412300': [0, 0],
      '1733412900': [0, 0],
      '1733413500': [0, 0],
      '1733414100': [0, 0],
      '1733414700': [0, 0],
      '1733415300': [0, 0],
      '1733415900': [0, 0],
      '1733416500': [0, 0],
      '1733417100': [0, 0],
      '1733417700': [0, 0],
      '1733418300': [0, 0],
      '1733418900': [0, 0],
      '1733419500': [0, 0],
      '1733420100': [0, 0],
      '1733420700': [0, 0],
      '1733421300': [0, 0],
      '1733421900': [0, 0],
      '1733422500': [0, 0],
      '1733423100': [0, 0],
      '1733423700': [0, 0],
      '1733424300': [0, 0],
      '1733424900': [0, 0],
      '1733425500': [0, 0],
      '1733426100': [0, 0],
      '1733426700': [0, 0],
      '1733427300': [0, 0],
      '1733427900': [0, 0],
      '1733428500': [0, 0],
      '1733429100': [0, 0],
      '1733429700': [0, 0],
      '1733430300': [0, 0],
      '1733430900': [0, 0],
      '1733431500': [0, 0],
      '1733432100': [0, 0],
      '1733432700': [0, 0],
      '1733433300': [0, 0],
      '1733433900': [0, 0],
      '1733434500': [0, 0],
      '1733435100': [0, 0],
      '1733435700': [0, 0],
      '1733436300': [0, 0],
      '1733436900': [0, 0],
      '1733437500': [0, 0],
      '1733438100': [0, 0],
      '1733438700': [0, 0],
      '1733439300': [0, 0],
      '1733439900': [0, 0],
      '1733440500': [0, 0],
      '1733441100': [0, 0],
      '1733441700': [0, 0],
      '1733442300': [0, 0],
      '1733442900': [0, 0],
      '1733443500': [0, 0],
      '1733444100': [0, 0],
      '1733444700': [0, 0],
      '1733445300': [0, 0],
      '1733445900': [0, 0],
      '1733446500': [0, 0],
      '1733447100': [0, 0],
      '1733447700': [0, 0],
      '1733448300': [0, 0],
      '1733448900': [0, 0],
      '1733449500': [0, 0],
      '1733450100': [0, 0],
      '1733450700': [0, 0],
      '1733451300': [0, 0],
      '1733451900': [0, 0],
      '1733452500': [0, 0],
      '1733453100': [0, 0],
      '1733453700': [0, 0],
      '1733454300': [0, 0],
      '1733454900': [0, 0],
      '1733455500': [0, 0],
      '1733456100': [0, 0],
      '1733456700': [0, 0],
      '1733457300': [0, 0],
      '1733457900': [0, 0],
      '1733458500': [0, 0],
      '1733459100': [0, 0],
      '1733459700': [0, 0],
      '1733460300': [0, 0],
      '1733460900': [0, 0],
      '1733461500': [0, 0],
      '1733462100': [0, 0],
      '1733462700': [0, 0],
      '1733463300': [0, 0],
      '1733463900': [0, 0],
      '1733464500': [0, 0],
      '1733465100': [0, 0],
      '1733465700': [0, 0],
      '1733466300': [0, 0],
      '1733466900': [0, 0],
      '1733467500': [0, 0],
      '1733468100': [0, 0],
      '1733468700': [0, 0],
      '1733469300': [0, 0],
      '1733469900': [0, 0],
      '1733470500': [0, 0],
      '1733471100': [0, 0],
      '1733471700': [0, 0],
      '1733472300': [0, 0],
      '1733472900': [0, 0],
      '1733473500': [0, 0],
      '1733474100': [0, 0],
      '1733474700': [0, 0],
      '1733475300': [0, 0],
      '1733475900': [0, 0],
      '1733476500': [0, 0],
      '1733477100': [0, 0],
    },
  },
);

final realtimeStatus = RealtimeStatus.fromJson(
  {
    'domains_being_blocked': 121860,
    'dns_queries_today': 16,
    'ads_blocked_today': 1,
    'ads_percentage_today': 6.25,
    'unique_domains': 11,
    'queries_forwarded': 9,
    'queries_cached': 6,
    'clients_ever_seen': 2,
    'unique_clients': 2,
    'dns_queries_all_types': 16,
    'reply_UNKNOWN': 0,
    'reply_NODATA': 0,
    'reply_NXDOMAIN': 3,
    'reply_CNAME': 0,
    'reply_IP': 10,
    'reply_DOMAIN': 3,
    'reply_RRNAME': 0,
    'reply_SERVFAIL': 0,
    'reply_REFUSED': 0,
    'reply_NOTIMP': 0,
    'reply_OTHER': 0,
    'reply_DNSSEC': 0,
    'reply_NONE': 0,
    'reply_BLOB': 0,
    'dns_queries_all_replies': 16,
    'privacy_level': 0,
    'status': 'enabled',
    'gravity_last_updated': {
      'file_exists': true,
      'absolute': 1732972589,
      'relative': {'days': 5, 'hours': 18, 'minutes': 14},
    },
    'top_queries': {
      '1.0.26.172.in-addr.arpa': 3,
      '8.8.8.8.in-addr.arpa': 3,
      'github.com': 2,
      'gitlab.com': 1,
      'sample.com': 1,
      'test.com': 1,
      'google.com': 1,
      'google.co.jp': 1,
      'yahoo.co.jp': 1,
      'fix.test.com': 1,
    },
    'top_ads': {'test.com': 1},
    'top_sources': {'172.26.0.1': 10, 'localhost|127.0.0.1': 6},
    'top_sources_blocked': {'172.26.0.1': 1},
    'forward_destinations': {
      'blocked|blocked': 6.25,
      'cached|cached': 37.5,
      'other|other': 0,
      'dns.google#53|8.8.8.8#53': 56.25,
    },
    'querytypes': {
      'A (IPv4)': 62.5,
      'AAAA (IPv6)': 0,
      'ANY': 0,
      'SRV': 0,
      'SOA': 0,
      'PTR': 37.5,
      'TXT': 0,
      'NAPTR': 0,
      'MX': 0,
      'DS': 0,
      'RRSIG': 0,
      'DNSKEY': 0,
      'NS': 0,
      'OTHER': 0,
      'SVCB': 0,
      'HTTPS': 0,
    },
  },
);

final host = InfoHost.fromJson(
  {
    'host': {
      'uname': {
        'domainname': '(none)',
        'machine': 'x86_64',
        'nodename': 'raspberrypi',
        'release': '5.15.0-52-generic',
        'sysname': 'Linux',
        'version': '#58-Ubuntu SMP Thu Oct 13 08:03:55 UTC 2022',
      },
      'model': 'Raspberry Pi Model 4B',
      'dmi': {
        'bios': {'vendor': 'American Megatrends Inc.'},
        'board': {
          'name': 'Raspberry Pi 4 Model B Rev 1.4',
          'vendor': 'Raspberry Pi Foundation',
          'version': '0x14',
        },
        'product': {
          'name': 'Raspberry Pi 4 Model B Rev 1.4',
          'version': '0x14',
          'family': 'Raspberry Pi 4 Model B Rev 1.4',
        },
        'sys': {'vendor': 'Raspberry Pi Foundation'},
      },
    },
    'took': 0.003,
  },
);

final version = InfoVersion.fromJson(
  {
    'version': {
      'core': {
        'local': {
          'version': 'v6.0.5',
          'branch': 'master',
          'hash': '9fe687bd',
        },
        'remote': {
          'version': 'v6.0.5',
          'hash': '9fe687bd',
        },
      },
      'web': {
        'local': {
          'version': 'v6.0.2',
          'branch': 'master',
          'hash': '25441178',
        },
        'remote': {
          'version': 'v6.0.2',
          'hash': '25441178',
        },
      },
      'ftl': {
        'local': {
          'hash': 'b7eb53bf',
          'branch': 'master',
          'version': 'v6.0.4',
          'date': '2025-03-04 17:22:10 +0000',
        },
        'remote': {
          'version': 'v6.0.4',
          'hash': 'b7eb53bf',
        },
      },
      'docker': {
        'local': '2025.03.0',
        'remote': '2025.03.0',
      },
    },
    'took': 0.014363765716552734,
  },
);

final sensors = InfoSensors.fromJson(
  {
    'sensors': {
      'list': [
        {
          'name': 'amdgpu',
          'path': 'hwmon1',
          'source': 'devices/pci0000:00/0000:00:08.1/0000:05:00.0',
          'temps': [
            {
              'name': 'edge',
              'value': 40,
              'max': null,
              'crit': null,
              'sensor': 'temp1',
            }
          ],
        },
      ],
      'cpu_temp': 48,
      'hot_limit': 60,
      'unit': 'C',
    },
    'took': 0.003,
  },
);

final system = InfoSystem.fromJson(
  {
    'system': {
      'uptime': 67906,
      'memory': {
        'ram': {
          'total': 10317877,
          'free': 308736,
          'used': 8920416,
          'available': 972304,
          '%used': 26.854,
        },
        'swap': {
          'total': 10317877,
          'used': 8920416,
          'free': 308736,
          '%used': 1.67,
        },
      },
      'procs': 1452,
      'cpu': {
        'nprocs': 8,
        'load': {
          'raw': [0.58837890625, 0.64990234375, 0.66748046875],
          'percent': [
            4.903157711029053,
            5.415853023529053,
            5.562337398529053,
          ],
        },
      },
    },
    'took': 0.003,
  },
);

final subscriptions = Lists.fromJson(
  {
    'lists': [
      {
        'address': 'https://hosts-file.net/ad_servers.txt',
        'comment': 'Some comment for this list',
        'groups': [0],
        'enabled': true,
        'id': 106,
        'date_added': 1742739018,
        'date_modified': 1742739030,
        'type': 'block',
        'date_updated': 0,
        'number': 0,
        'invalid_domains': 0,
        'abp_entries': 0,
        'status': 0,
      }
    ],
    'processed': {
      'errors': [],
      'success': [
        {'item': 'https://hosts-file.net/ad_servers.txt'},
      ],
    },
    'took': 0.019428014755249023,
  },
);

final groups = Groups.fromJson(
  {
    'groups': [
      {
        'name': 'Default',
        'comment': 'The default group',
        'enabled': true,
        'id': 0,
        'date_added': 1594670974,
        'date_modified': 1611157897,
      },
      {
        'name': 'group1',
        'comment': null,
        'enabled': true,
        'id': 5,
        'date_added': 1604871899,
        'date_modified': 1604871899,
      }
    ],
    'took': 0.003,
  },
);

final messages = InfoMessages.fromJson(
  {
    'messages': [
      {
        'id': 5,
        'timestamp': 1743936482,
        'type': 'LIST',
        'plain':
            'List with ID 10 (http://localhost:8989/test.txt) was inaccessible during last gravity run',
        'html':
            '<a href="groups/lists?listid=10">List with ID <strong>10</strong> (<code>http://localhost:8989/test.txt</code>)</a> was inaccessible during last gravity run',
      },
      {
        'id': 3,
        'timestamp': 123456789.123,
        'type': 'SUBNET',
        'plain': 'Rate-limiting 192.168.2.42 for at least 5 seconds',
        'html':
            'Client <code>192.168.2.42</code> has been rate-limited for at least 5 seconds (current limit: 1000 queries per 60 seconds)',
      }
    ],
    'took': 0.0005114078521728516,
  },
);

final metrics = InfoMetrics.fromJson(
  {
    'metrics': {
      'dns': {
        'cache': {
          'size': 10000,
          'inserted': 4060,
          'evicted': 0,
          'expired': 0,
          'immortal': 0,
          'content': [
            {
              'type': 0,
              'name': 'OTHER',
              'count': {'valid': 0, 'stale': 0},
            },
            {
              'type': 1,
              'name': 'A',
              'count': {'valid': 14, 'stale': 3},
            },
            {
              'type': 28,
              'name': 'AAAA',
              'count': {'valid': 12, 'stale': 1},
            },
            {
              'type': 5,
              'name': 'CNAME',
              'count': {'valid': 5, 'stale': 3},
            },
            {
              'type': 43,
              'name': 'DS',
              'count': {'valid': 34, 'stale': 21},
            },
            {
              'type': 48,
              'name': 'DNSKEY',
              'count': {'valid': 1, 'stale': 0},
            }
          ],
        },
        'replies': {
          'optimized': 1,
          'local': 84,
          'auth': 0,
          'forwarded': 46,
          'unanswered': 0,
          'sum': 131,
        },
      },
      'dhcp': {
        'ack': 0,
        'nak': 0,
        'decline': 0,
        'offer': 0,
        'discover': 0,
        'inform': 0,
        'request': 0,
        'release': 0,
        'noanswer': 0,
        'bootp': 0,
        'pxe': 0,
        'leases': {
          'allocated_4': 0,
          'pruned_4': 0,
          'allocated_6': 0,
          'pruned_6': 0,
        },
      },
    },
    'took': 0.003,
  },
);

final gateway = Gateway.fromJson(
  {
    'gateway': [
      {
        'family': 'inet',
        'interface': 'eth0',
        'address': '172.26.0.1',
        'local': ['172.26.0.5'],
      }
    ],
    'routes': [
      {
        'table': 254,
        'family': 'inet',
        'protocol': 'boot',
        'scope': 'universe',
        'type': 'unicast',
        'flags': [],
        'iflags': 0,
        'gateway': '172.26.0.1',
        'oif': 'eth0',
        'dst': 'default',
      },
      {
        'table': 254,
        'family': 'inet',
        'protocol': 'kernel',
        'scope': 'link',
        'type': 'unicast',
        'flags': [],
        'iflags': 0,
        'dst': '172.26.0.0',
        'prefsrc': '172.26.0.5',
        'oif': 'eth0',
      },
      {
        'table': 255,
        'family': 'inet',
        'protocol': 'kernel',
        'scope': 'host',
        'type': 'local',
        'flags': [],
        'iflags': 0,
        'dst': '127.0.0.0',
        'prefsrc': '127.0.0.1',
        'oif': 'lo',
      },
      {
        'table': 255,
        'family': 'inet',
        'protocol': 'kernel',
        'scope': 'host',
        'type': 'local',
        'flags': [],
        'iflags': 0,
        'dst': '127.0.0.1',
        'prefsrc': '127.0.0.1',
        'oif': 'lo',
      },
      {
        'table': 255,
        'family': 'inet',
        'protocol': 'kernel',
        'scope': 'link',
        'type': 'broadcast',
        'flags': [],
        'iflags': 0,
        'dst': '127.255.255.255',
        'prefsrc': '127.0.0.1',
        'oif': 'lo',
      },
      {
        'table': 255,
        'family': 'inet',
        'protocol': 'kernel',
        'scope': 'host',
        'type': 'local',
        'flags': [],
        'iflags': 0,
        'dst': '172.26.0.5',
        'prefsrc': '172.26.0.5',
        'oif': 'eth0',
      },
      {
        'table': 255,
        'family': 'inet',
        'protocol': 'kernel',
        'scope': 'link',
        'type': 'broadcast',
        'flags': [],
        'iflags': 0,
        'dst': '172.26.255.255',
        'prefsrc': '172.26.0.5',
        'oif': 'eth0',
      },
      {
        'table': 255,
        'family': 'inet6',
        'protocol': 'kernel',
        'scope': 'universe',
        'type': 'local',
        'flags': [],
        'iflags': 0,
        'dst': '::1',
        'priority': 0,
        'oif': 'lo',
        'cstamp': 1748575809,
        'tstamp': 1748575809,
        'expires': 0,
        'error': 0,
        'used': 0,
        'pref': 0,
      }
    ],
    'interfaces': [
      {
        'name': 'lo',
        'index': 1,
        'family': 'unspec',
        'speed': null,
        'type': 'loopback',
        'flags': ['up', 'loopback', 'running', 'lower_up'],
        'ifname': 'lo',
        'txqlen': 1000,
        'state': 'unknown',
        'linkmode': 0,
        'mtu': 65536,
        'min_mtu': 0,
        'max_mtu': 0,
        'group': 0,
        'promiscuity': 0,
        'num_tx_queues': 1,
        'gso_max_segs': 65535,
        'gso_max_size': 65536,
        'num_rx_queues': 1,
        'carrier': true,
        'qdisc': 'noqueue',
        'carrier_changes': 0,
        'carrier_up_count': 0,
        'carrier_down_count': 0,
        'proto_down': false,
        'map': 0,
        'address': '00:00:00:00:00:00',
        'broadcast': '00:00:00:00:00:00',
        'stats': {
          'rx_bytes': {'value': 631.882, 'unit': 'K'},
          'tx_bytes': {'value': 631.882, 'unit': 'K'},
          'bits': 64,
          'rx_packets': 7318,
          'tx_packets': 7318,
          'rx_errors': 0,
          'tx_errors': 0,
          'rx_dropped': 0,
          'tx_dropped': 0,
          'multicast': 0,
          'collisions': 0,
          'rx_length_errors': 0,
          'rx_over_errors': 0,
          'rx_crc_errors': 0,
          'rx_frame_errors': 0,
          'rx_fifo_errors': 0,
          'rx_missed_errors': 0,
          'tx_aborted_errors': 0,
          'tx_carrier_errors': 0,
          'tx_fifo_errors': 0,
          'tx_heartbeat_errors': 0,
          'tx_window_errors': 0,
          'rx_compressed': 0,
          'tx_compressed': 0,
          'rx_nohandler': 0,
        },
        'addresses': [
          {
            'index': 1,
            'family': 'inet',
            'scope': 'host',
            'flags': ['permanent'],
            'prefixlen': 8,
            'address': '127.0.0.1',
            'address_type': 'loopback',
            'local': '127.0.0.1',
            'local_type': 'loopback',
            'label': 'lo',
            'prefered': 4294967295,
            'valid': 4294967295,
            'cstamp': 1748575822.73,
            'tstamp': 1748575822.73,
          },
          {
            'index': 1,
            'family': 'inet6',
            'scope': 'host',
            'flags': ['permanent'],
            'prefixlen': 128,
            'address': '::1',
            'address_type': 'loopback',
            'prefered': 4294967295,
            'valid': 4294967295,
            'cstamp': 1748575822.73,
            'tstamp': 1748575822.73,
          }
        ],
      },
      {
        'name': 'eth0',
        'index': 23,
        'family': 'unspec',
        'speed': 10000,
        'type': 'ether',
        'flags': ['up', 'broadcast', 'running', 'multicast', 'lower_up'],
        'ifname': 'eth0',
        'txqlen': 0,
        'state': 'up',
        'linkmode': 0,
        'mtu': 1500,
        'min_mtu': 68,
        'max_mtu': 65535,
        'group': 0,
        'promiscuity': 0,
        'num_tx_queues': 12,
        'gso_max_segs': 65535,
        'gso_max_size': 65536,
        'num_rx_queues': 12,
        'carrier': true,
        'qdisc': 'noqueue',
        'carrier_changes': 2,
        'carrier_up_count': 1,
        'carrier_down_count': 1,
        'proto_down': false,
        'map': 0,
        'address': '02:43:ad:1a:00:09',
        'broadcast': 'ff:ff:ff:ff:ff:ff',
        'link_kind': 'veth',
        'link_netnsid': 0,
        'link': 24,
        'stats': {
          'rx_bytes': {'value': 17.927896, 'unit': 'M'},
          'tx_bytes': {'value': 32.886229, 'unit': 'M'},
          'bits': 64,
          'rx_packets': 215497,
          'tx_packets': 203769,
          'rx_errors': 0,
          'tx_errors': 0,
          'rx_dropped': 0,
          'tx_dropped': 0,
          'multicast': 0,
          'collisions': 0,
          'rx_length_errors': 0,
          'rx_over_errors': 0,
          'rx_crc_errors': 0,
          'rx_frame_errors': 0,
          'rx_fifo_errors': 0,
          'rx_missed_errors': 0,
          'tx_aborted_errors': 0,
          'tx_carrier_errors': 0,
          'tx_fifo_errors': 0,
          'tx_heartbeat_errors': 0,
          'tx_window_errors': 0,
          'rx_compressed': 0,
          'tx_compressed': 0,
          'rx_nohandler': 0,
        },
        'addresses': [
          {
            'index': 23,
            'family': 'inet',
            'scope': 'universe',
            'flags': ['permanent'],
            'prefixlen': 16,
            'address': '172.26.0.5',
            'address_type': 'private',
            'local': '172.26.0.5',
            'local_type': 'private',
            'broadcast': '172.26.255.255',
            'broadcast_type': 'private',
            'label': 'eth0',
            'prefered': 4294967295,
            'valid': 4294967295,
            'cstamp': 1748575822.99,
            'tstamp': 1748575822.99,
          }
        ],
      }
    ],
    'took': 0.00055408477783203125,
  },
);

final configDns = Config.fromJson({
  'config': {
    'dns': {'queryLogging': true},
  },
  'took': 0.003,
});

final sessions = AuthSessions.fromJson(
  {
    'sessions': [
      {
        'id': 0,
        'current_session': false,
        'valid': false,
        'tls': {'login': false, 'mixed': false},
        'app': false,
        'cli': false,
        'login_at': 1580000000,
        'last_active': 1580000000,
        'valid_until': 1580000300,
        'remote_addr': '192.168.0.30',
        'user_agent': 'Dart/3.7 (dart:io)',
        'x_forwarded_for': null,
      },
      {
        'id': 1,
        'current_session': true,
        'valid': true,
        'tls': {'login': true, 'mixed': false},
        'app': false,
        'cli': false,
        'login_at': 1580000000,
        'last_active': 1580000000,
        'valid_until': 1580000300,
        'remote_addr': '192.168.0.31',
        'user_agent':
            'Mozilla/5.0 (X11; Linux x86_64; rv:107.0) Gecko/20100101 Firefox/107.0',
        'x_forwarded_for': null,
      },
      {
        'id': 3,
        'current_session': false,
        'valid': false,
        'tls': {'login': false, 'mixed': true},
        'app': true,
        'cli': true,
        'login_at': 1580000000,
        'last_active': 1580000000,
        'valid_until': 1580000300,
        'remote_addr': '192.168.0.32',
        'user_agent': 'Dart/3.7 (dart:io)',
        'x_forwarded_for': null,
      },
    ],
    'took': 0.003,
  },
);

final client = InfoClient.fromJson(
  {
    'remote_addr': '192.168.1.51',
    'http_version': '1.1',
    'method': 'GET',
    'headers': [
      {'name': 'Accept', 'value': 'application/json'},
      {'name': 'Connection', 'value': 'keep-alive'},
      {'name': 'Pragma', 'value': 'no-cache'},
    ],
    'took': 0.003,
  },
);

final devices = Devices.fromJson({
  'devices': [
    {
      'id': 1,
      'hwaddr': '00:11:22:33:44:55',
      'interface': 'enp2s0',
      'firstSeen': 1664623620,
      'lastQuery': 1664688620,
      'numQueries': 585462,
      'macVendor': 'Digital Data Communications Asia Co.,Ltd',
      'ips': [
        {
          'ip': '192.168.1.51',
          'name': 'ubuntu-server',
          'lastSeen': 1664688620,
          'nameUpdated': 1664688620,
        }
      ],
    },
    {
      'id': 2,
      'hwaddr': '00:11:22:33:44:xx',
      'interface': 'enp2s0',
      'firstSeen': 1664523620,
      'lastQuery': 1664588620,
      'numQueries': 562,
      'macVendor': null,
      'ips': [
        {
          'ip': '192.168.1.52',
          'name': 'ubuntu-server',
          'lastSeen': 1664588620,
          'nameUpdated': 1654588620,
        },
        {
          'ip': '192.168.1.62',
          'name': null,
          'lastSeen': 1664488620,
          'nameUpdated': 1654488620,
        }
      ],
    }
  ],
  'took': 0.003,
});

final dhcp = Dhcp.fromJson({
  'leases': [
    {
      'expires': 1675671991,
      'name': 'raspberrypi',
      'hwaddr': '00:00:00:00:00:00',
      'ip': '192.168.1.51',
      'clientid': '00:00:00:00:00:00',
    },
    {
      'expires': 1675671992,
      'name': '*',
      'hwaddr': '00:00:00:00:00:11',
      'ip': '192.168.1.52',
      'clientid': '00:00:00:00:00:11',
    },
  ],
  'took': 0.003,
});

/// Initialize the app with the given environment file.
///
/// This function should be called before any other setup.
/// Call this function in the `main` function of the test file.
///
/// Parameters:
/// - `envFileName`: The name of the environment file.
///
/// Example:
/// ```dart
/// void main() async {
///   await initializeApp();
///   // ...
/// ```
Future<void> initializeApp() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  FlutterSecureStorage.setMockInitialValues({
    'http://localhost:8080_token': 'token123',
    'http://localhost:8081_password': 'password123',
  });
}

/// Helper class to setup the providers for the test.
///
/// This class should be used in the `setUp` method of the test.
///
/// Example:
/// ```dart
/// setUp(() {
///   // If you need to override the default mock behavior
///   final customApiGateway = MockApiGatewayV6();
///
///   testSetup = TestSetupHelper(
///     server: server,
///     queries: queries,
///     customApiGatewayV6: customApiGateway,
///   );
///
///   // Initialize the mocks
///   testSetup.initializeMocks();
///
///   // Override the default mock behavior
///   when(customApiGateway.fetchLogs(any, any)).thenAnswer((_) async {
///     return FetchLogsResponse(
///       result: APiResponseType.success,
///       data: [],
///     );
///   });
/// });
/// });
@GenerateMocks([
  AppConfigProvider,
  ServersProvider,
  FiltersProvider,
  StatusProvider,
  DomainsListProvider,
  ApiGatewayV5,
  ApiGatewayV6,
  StatusUpdateService,
  GroupsProvider,
  SubscriptionsListProvider,
  GravityUpdateProvider,
])
class TestSetupHelper {
  TestSetupHelper({
    MockAppConfigProvider? customConfigProvider,
    MockServersProvider? customServersProvider,
    MockFiltersProvider? customFiltersProvider,
    MockStatusProvider? customStatusProvider,
    MockDomainsListProvider? customDomainsListProvider,
    MockGroupsProvider? customGroupsProvider,
    MockSubscriptionsListProvider? customSubscriptionsListProvider,
    MockGravityUpdateProvider? customGravityUpdateProvider,
    MockApiGatewayV5? customApiGatewayV5,
    MockApiGatewayV6? customApiGatewayV6,
    MockStatusUpdateService? customStatusUpdateService,
  }) {
    mockConfigProvider = customConfigProvider ?? MockAppConfigProvider();
    mockServersProvider = customServersProvider ?? MockServersProvider();
    mockFiltersProvider = customFiltersProvider ?? MockFiltersProvider();
    mockStatusProvider = customStatusProvider ?? MockStatusProvider();
    mockDomainsListProvider =
        customDomainsListProvider ?? MockDomainsListProvider();
    mockGroupsProvider = customGroupsProvider ?? MockGroupsProvider();
    mockSubscriptionsListProvider =
        customSubscriptionsListProvider ?? MockSubscriptionsListProvider();
    mockGravityUpdateProvider =
        customGravityUpdateProvider ?? MockGravityUpdateProvider();

    mockApiGatewayV5 = customApiGatewayV5 ?? MockApiGatewayV5();
    mockApiGatewayV6 = customApiGatewayV6 ?? MockApiGatewayV6();

    mockStatusUpdateService =
        customStatusUpdateService ?? MockStatusUpdateService();
  }

  late MockAppConfigProvider mockConfigProvider;
  late MockServersProvider mockServersProvider;
  late MockFiltersProvider mockFiltersProvider;
  late MockStatusProvider mockStatusProvider;
  late MockDomainsListProvider mockDomainsListProvider;
  late MockGroupsProvider mockGroupsProvider;
  late MockSubscriptionsListProvider mockSubscriptionsListProvider;
  late MockGravityUpdateProvider mockGravityUpdateProvider;

  late MockApiGatewayV5 mockApiGatewayV5;
  late MockApiGatewayV6 mockApiGatewayV6;

  late MockStatusUpdateService mockStatusUpdateService;

  void initializeMock({String useApiGatewayVersion = 'v5'}) {
    _initConfiProviderMock(useApiGatewayVersion);
    _initServerProviderMock(useApiGatewayVersion);
    _initFiltersProviderMock(useApiGatewayVersion);
    _initStatusProviderMock(useApiGatewayVersion);
    _initDomainListProviderMock(useApiGatewayVersion);
    _initGroupsPtoviderMock(useApiGatewayVersion);
    _initSubscriptionsListProviderMock(useApiGatewayVersion);
    _initGravityUpdateProviderMock(useApiGatewayVersion);
    _initApiGatewayV5Mock();
    _initApiGatewayV6Mock();
    _initStatusUpdateServiceMock();
  }

  /// Build the test widget with the given setup helper.
  ///
  /// Example:
  /// ```dart
  /// testWidgets(
  ///   'should show the successful snackbar when adding a server',
  ///   (WidgetTester tester) async {
  ///     await tester.pumpWidget(
  ///       testSetup.buildTestWidget(
  ///         YourTestWidget(),  // Your test widget
  ///       ),
  ///     );
  ///   },
  /// );
  /// ```
  Widget buildTestWidget(Widget child) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AppConfigProvider>(
              create: (context) => mockConfigProvider,
            ),
            ChangeNotifierProvider<ServersProvider>(
              create: (context) => mockServersProvider,
            ),
            ChangeNotifierProvider<StatusProvider>(
              create: (context) => mockStatusProvider,
            ),
            ChangeNotifierProxyProvider<AppConfigProvider, ServersProvider>(
              create: (context) => mockServersProvider,
              update: (context, appConfig, servers) =>
                  servers!..update(appConfig),
            ),
            ChangeNotifierProxyProvider<ServersProvider, DomainsListProvider>(
              create: (context) => mockDomainsListProvider,
              update: (context, serverConfig, servers) =>
                  servers!..update(serverConfig),
            ),
            ChangeNotifierProxyProvider<ServersProvider, FiltersProvider>(
              create: (context) => mockFiltersProvider,
              update: (context, serverConfig, servers) =>
                  servers!..update(serverConfig),
            ),
            ChangeNotifierProxyProvider<ServersProvider,
                SubscriptionsListProvider>(
              create: (context) => mockSubscriptionsListProvider,
              update: (context, serverConfig, servers) =>
                  servers!..update(serverConfig),
            ),
            ChangeNotifierProxyProvider<ServersProvider, GroupsProvider>(
              create: (context) => mockGroupsProvider,
              update: (context, serverConfig, servers) =>
                  servers!..update(serverConfig),
            ),
            ChangeNotifierProxyProvider<ServersProvider, GravityUpdateProvider>(
              create: (context) => mockGravityUpdateProvider,
              update: (context, serverConfig, servers) =>
                  servers!..update(serverConfig),
            ),
            Provider<StatusUpdateService>(
              create: (_) => mockStatusUpdateService,
              dispose: (_, service) => service.stopAutoRefresh(),
            ),
          ],
          child: Phoenix(
            child: MaterialApp(
              theme: lightTheme(lightDynamic),
              darkTheme: darkTheme(darkDynamic),
              themeMode: mockConfigProvider.selectedTheme,
              home: Scaffold(
                body: child,
              ),
              locale: Locale(mockConfigProvider.selectedLanguage),
              supportedLocales: const [
                Locale('en', ''),
                Locale('es', ''),
                Locale('de', ''),
                Locale('pl', ''),
                Locale('ja', ''),
              ],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              scaffoldMessengerKey: scaffoldMessengerKey,
            ),
          ),
        );
      },
    );
  }

  Widget buildMainTestWidget(Widget child) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppConfigProvider>(
          create: (context) => mockConfigProvider,
        ),
        ChangeNotifierProvider<ServersProvider>(
          create: (context) => mockServersProvider,
        ),
        ChangeNotifierProvider<StatusProvider>(
          create: (context) => mockStatusProvider,
        ),
        ChangeNotifierProxyProvider<AppConfigProvider, ServersProvider>(
          create: (context) => mockServersProvider,
          update: (context, appConfig, servers) => servers!..update(appConfig),
        ),
        ChangeNotifierProxyProvider<ServersProvider, DomainsListProvider>(
          create: (context) => mockDomainsListProvider,
          update: (context, serverConfig, servers) =>
              servers!..update(serverConfig),
        ),
        ChangeNotifierProxyProvider<ServersProvider, FiltersProvider>(
          create: (context) => mockFiltersProvider,
          update: (context, serverConfig, servers) =>
              servers!..update(serverConfig),
        ),
        ChangeNotifierProxyProvider<ServersProvider, SubscriptionsListProvider>(
          create: (context) => mockSubscriptionsListProvider,
          update: (context, serverConfig, servers) =>
              servers!..update(serverConfig),
        ),
        ChangeNotifierProxyProvider<ServersProvider, GroupsProvider>(
          create: (context) => mockGroupsProvider,
          update: (context, serverConfig, servers) =>
              servers!..update(serverConfig),
        ),
        ChangeNotifierProxyProvider<ServersProvider, GravityUpdateProvider>(
          create: (context) => mockGravityUpdateProvider,
          update: (context, serverConfig, servers) =>
              servers!..update(serverConfig),
        ),
        Provider<StatusUpdateService>(
          create: (_) => mockStatusUpdateService,
          dispose: (_, service) => service.stopAutoRefresh(),
        ),
      ],
      child: child,
    );
  }

  void _initConfiProviderMock(String useApiGatewayVersion) {
    when(mockConfigProvider.showingSnackbar).thenReturn(false);
    when(mockConfigProvider.logsPerQuery).thenReturn(2);
    when(mockConfigProvider.passCode).thenReturn(null);
    when(mockConfigProvider.useBiometrics).thenReturn(false);
    when(mockConfigProvider.reducedDataCharts).thenReturn(false);
    when(mockConfigProvider.hideZeroValues).thenReturn(false);
    when(mockConfigProvider.selectedTheme).thenReturn(ThemeMode.light);
    when(mockConfigProvider.statisticsVisualizationMode).thenReturn(0);
    when(mockConfigProvider.homeVisualizationMode).thenReturn(0);
    when(mockConfigProvider.setShowingSnackbar(any)).thenReturn(null);
    when(mockConfigProvider.setReducedDataCharts(any))
        .thenAnswer((_) async => true);
    when(mockConfigProvider.setHideZeroValues(any))
        .thenAnswer((_) async => true);
    when(mockConfigProvider.restoreAppConfig()).thenAnswer((_) async => true);
    when(mockConfigProvider.logs).thenReturn([
      AppLog(
        type: 'sample',
        dateTime: DateTime(2025, 01, 22, 10, 50, 31),
        message: 'message',
        statusCode: '200',
        resBody: 'body',
      ),
    ]);
    when(mockConfigProvider.selectedThemeNumber).thenReturn(0);
    when(mockConfigProvider.selectedLanguage).thenReturn('en');
    when(mockConfigProvider.getAutoRefreshTime).thenReturn(5);
    when(mockConfigProvider.selectedSettingsScreen).thenReturn(null);
    when(mockConfigProvider.selectedLanguageNumber).thenReturn(0);
    when(mockConfigProvider.getAppInfo).thenReturn(
      PackageInfo(
        appName: 'pi-hole client',
        packageName: 'io.github.tsutsu3.pi_hole_clien',
        version: '1.0.0',
        buildNumber: '1',
      ),
    );
    when(mockConfigProvider.setAutoRefreshTime(any))
        .thenAnswer((_) async => true);
    when(mockConfigProvider.colors).thenReturn(lightAppColors);
    when(mockConfigProvider.biometricsSupport).thenReturn(true);
    when(mockConfigProvider.setStatisticsVisualizationMode(any))
        .thenAnswer((_) async => true);
    when(mockConfigProvider.setHomeVisualizationMode(any))
        .thenAnswer((_) async => true);
    when(mockConfigProvider.validVibrator).thenReturn(true);
    when(mockConfigProvider.setPassCode(any)).thenAnswer((_) async => true);
    when(mockConfigProvider.selectedTab).thenReturn(0);
    when(mockConfigProvider.importantInfoReaden).thenReturn(true);
    when(mockConfigProvider.sendCrashReports).thenReturn(false);
    when(mockConfigProvider.loadingAnimation).thenReturn(true);
    when(mockConfigProvider.setShowLoadingAnimation(any))
        .thenAnswer((_) async => true);
  }

  void _initServerProviderMock(String useApiGatewayVersion) {
    when(mockServersProvider.selectedApiGateway).thenReturn(
      useApiGatewayVersion == 'v5'
          ? mockApiGatewayV5 as ApiGateway
          : mockApiGatewayV6 as ApiGateway,
    );
    when(mockServersProvider.selectedServer).thenReturn(
      useApiGatewayVersion == 'v5' ? serverV5 : serverV6,
    );
    when(mockServersProvider.colors).thenReturn(lightAppColors);
    when(mockServersProvider.numShown).thenReturn(
      useApiGatewayVersion == 'v5' ? 12 : 14,
    );
    when(mockServersProvider.getQueryStatus(any)).thenReturn(
      // forwarded
      useApiGatewayVersion == 'v5' ? queryStatusesV5[1] : queryStatusesV6[2],
    );
    when(mockServersProvider.checkUrlExists(any))
        .thenAnswer((_) async => {'result': 'success', 'exists': false});
    when(mockServersProvider.addServer(any)).thenAnswer((_) async => true);
    when(mockServersProvider.editServer(any)).thenAnswer((_) async => true);
    when(mockServersProvider.loadApiGateway(any)).thenReturn(
      useApiGatewayVersion == 'v5'
          ? mockApiGatewayV5 as ApiGateway
          : mockApiGatewayV6 as ApiGateway,
    );
    when(mockServersProvider.createApiGateway(any)).thenReturn(
      useApiGatewayVersion == 'v5'
          ? mockApiGatewayV5 as ApiGateway
          : mockApiGatewayV6 as ApiGateway,
    );
    when(mockServersProvider.getServersList)
        .thenReturn(useApiGatewayVersion == 'v5' ? [serverV5] : [serverV6]);
    when(mockServersProvider.colors).thenReturn(lightAppColors);
    when(mockServersProvider.queryStatuses).thenReturn(
      useApiGatewayVersion == 'v5' ? queryStatusesV5 : queryStatusesV6,
    );
    when(mockServersProvider.removeServer(any)).thenAnswer((_) async => true);
    when(mockServersProvider.deleteDbData()).thenAnswer((_) async => true);
    when(mockServersProvider.connectingServer).thenReturn(serverV6);
  }

  void _initFiltersProviderMock(String useApiGatewayVersion) {
    when(mockFiltersProvider.statusSelected).thenReturn(
      useApiGatewayVersion == 'v5'
          ? [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14]
          : [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
    );
    when(mockFiltersProvider.selectedClients).thenReturn(['192.168.100.2']);
    when(mockFiltersProvider.selectedDomain).thenReturn('white.example.com');
    when(mockFiltersProvider.startTime).thenReturn(DateTime.now());
    when(mockFiltersProvider.endTime)
        .thenReturn(DateTime.now().add(const Duration(hours: 2)));
    when(mockFiltersProvider.resetFilters()).thenReturn(null);
    when(mockFiltersProvider.totalClients)
        .thenReturn(['localhost', '192.168.100.2']);
    when(mockFiltersProvider.resetTime()).thenReturn(null);
    when(mockFiltersProvider.resetStatus()).thenReturn(null);
    when(mockFiltersProvider.resetClients()).thenReturn(null);
    when(mockFiltersProvider.setSelectedDomain(null)).thenReturn(null);
    when(mockFiltersProvider.statusAllowedAndRetried).thenReturn(
      useApiGatewayVersion == 'v5' ? [2, 3, 12, 13, 14] : [3, 4, 13, 14, 15],
    );
    when(mockFiltersProvider.requestStatus).thenReturn(RequestStatus.all);
    when(mockFiltersProvider.defaultSelected).thenReturn(
      useApiGatewayVersion == 'v5'
          ? [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14]
          : [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
    );
  }

  void _initStatusProviderMock(String useApiGatewayVersion) {
    when(mockStatusProvider.getStatusLoading).thenReturn(LoadStatus.loaded);
    when(mockStatusProvider.getServerStatus).thenReturn(LoadStatus.loaded);
    when(mockStatusProvider.isServerLoading).thenReturn(false);
    when(mockStatusProvider.getOvertimeData).thenReturn(overtimeData);
    when(mockStatusProvider.getOvertimeDataLoadStatus)
        .thenReturn(LoadStatus.loaded);
    when(mockStatusProvider.getOvertimeDataJson)
        .thenReturn(overtimeData.toJson());
    when(mockStatusProvider.getRealtimeStatus).thenReturn(realtimeStatus);
    when(mockStatusProvider.getMetricsInfo)
        .thenReturn(MetricsInfo.fromV6(metrics));
    when(mockStatusProvider.getDnsCacheInfo)
        .thenReturn(MetricsInfo.fromV6(metrics).dnsCache);
    when(mockStatusProvider.getDnsRepliesInfo)
        .thenReturn(MetricsInfo.fromV6(metrics).dnsReplies);
  }

  void _initDomainListProviderMock(String useApiGatewayVersion) {
    when(mockDomainsListProvider.fetchDomainsList()).thenAnswer((_) async {});
    when(mockDomainsListProvider.searchMode).thenReturn(false);
    when(mockDomainsListProvider.searchTerm).thenReturn('');
    when(mockDomainsListProvider.filteredWhitelistDomains).thenReturn(domains);
    when(mockDomainsListProvider.filteredBlacklistDomains).thenReturn([]);
    when(mockDomainsListProvider.loadingStatus).thenReturn(LoadStatus.loaded);
    when(mockDomainsListProvider.whitelistDomains).thenReturn(domains);
    when(mockDomainsListProvider.blacklistDomains).thenReturn([]);
    when(mockDomainsListProvider.setLoadingStatus(any)).thenReturn(null);
    when(mockDomainsListProvider.setWhitelistDomains(any)).thenReturn(null);
    when(mockDomainsListProvider.setBlacklistDomains(any)).thenReturn(null);
    when(mockDomainsListProvider.onSearch(any)).thenReturn(null);
    when(mockDomainsListProvider.removeDomainFromList(any))
        .thenAnswer((_) async => true);
  }

  void _initGroupsPtoviderMock(String useApiGatewayVersion) {
    when(mockGroupsProvider.groups)
        .thenReturn(GroupsInfo.fromV6(groups).groups);

    when(mockGroupsProvider.groupItems).thenReturn(
      {
        for (final group in GroupsInfo.fromV6(groups).groups)
          group.id: group.name,
      },
    );

    when(mockGroupsProvider.loadingStatus).thenReturn(LoadStatus.loaded);

    when(mockGroupsProvider.setLoadingStatus(any)).thenReturn(null);

    when(mockGroupsProvider.loadGroups()).thenAnswer((_) async => ());
  }

  void _initSubscriptionsListProviderMock(String useApiGatewayVersion) {
    when(mockSubscriptionsListProvider.loadingStatus)
        .thenReturn(LoadStatus.loaded);

    when(mockSubscriptionsListProvider.whitelistSubscriptions).thenReturn([]);

    when(mockSubscriptionsListProvider.blacklistSubscriptions)
        .thenReturn(SubscriptionsInfo.fromV6(subscriptions).subscriptions);

    when(mockSubscriptionsListProvider.filteredWhitelistSubscriptions)
        .thenReturn([]);

    when(mockSubscriptionsListProvider.filteredBlacklistSubscriptions)
        .thenReturn(SubscriptionsInfo.fromV6(subscriptions).subscriptions);

    when(mockSubscriptionsListProvider.selectedTab).thenReturn(0);

    when(mockSubscriptionsListProvider.searchMode).thenReturn(false);

    when(mockSubscriptionsListProvider.setLoadingStatus(any)).thenReturn(null);

    when(mockSubscriptionsListProvider.setWhitelistSubscriptions(any))
        .thenReturn(null);

    when(mockSubscriptionsListProvider.setBlacklistSubscriptions(any))
        .thenReturn(null);

    when(mockSubscriptionsListProvider.setSelectedTab(any)).thenReturn(null);

    when(mockSubscriptionsListProvider.onSearch(any)).thenReturn(null);

    when(mockSubscriptionsListProvider.fetchSubscriptionsList())
        .thenAnswer((_) async => ());

    when(mockSubscriptionsListProvider.removeSubscriptionFromList(any))
        .thenReturn(null);
  }

  void _initGravityUpdateProviderMock(String useApiGatewayVersion) {
    when(mockGravityUpdateProvider.status).thenReturn(GravityStatus.idle);

    when(mockGravityUpdateProvider.logs).thenReturn(['log1', 'log2']);

    when(mockGravityUpdateProvider.messages)
        .thenReturn(MessagesInfo.fromV6(messages).messages);

    when(mockGravityUpdateProvider.startedAtTime).thenReturn(
      DateTime.fromMillisecondsSinceEpoch(1733465700 * 1000),
    ); // Convert to milliseconds since epoch

    when(mockGravityUpdateProvider.completedAtTime).thenReturn(
      DateTime.fromMillisecondsSinceEpoch(1733465700 * 1000),
    );

    when(mockGravityUpdateProvider.isLoaded).thenReturn(false);

    when(mockGravityUpdateProvider.load()).thenAnswer((_) async => ());
    when(mockGravityUpdateProvider.start()).thenAnswer((_) async => ());
    when(mockGravityUpdateProvider.reset()).thenReturn(null);
  }

  void _initApiGatewayV5Mock() {
    when(mockApiGatewayV5.loginQuery()).thenAnswer(
      (_) async => LoginQueryResponse(
        result: APiResponseType.success,
        status: 'enabled',
        sid: 'sid123',
      ),
    );

    when(mockApiGatewayV5.enableServerRequest()).thenAnswer((_) async {
      return EnableServerResponse(result: APiResponseType.success);
    });

    when(mockApiGatewayV5.fetchAllServerInfo()).thenAnswer((_) async {
      return PiHoleServerInfoResponse(
        result: APiResponseType.success,
        version: VersionInfo.fromJson({
          'core_update': false,
          'web_update': false,
          'FTL_update': false,
          'docker_update': true,
          'core_current': 'v5.18.3',
          'web_current': 'v5.21',
          'FTL_current': 'v5.25.2',
          'docker_current': '2024.07.0',
          'core_latest': 'v6.0.5',
          'web_latest': 'v6.0.2',
          'FTL_latest': 'v6.0.4',
          'docker_latest': '2025.03.0',
          'core_branch': 'master',
          'web_branch': 'master',
          'FTL_branch': 'master',
        }),
      );
    });

    when(mockApiGatewayV5.server).thenReturn(serverV5);

    when(mockApiGatewayV5.updateDomain(body: anyNamed('body'))).thenAnswer(
      (_) async => DomainResponse(
        result: APiResponseType.success,
        data: domains[0],
      ),
    );

    when(
      mockApiGatewayV5.fetchLogs(
        any,
        any,
        size: anyNamed('size'),
        cursor: anyNamed('cursor'),
      ),
    ).thenAnswer((_) async {
      return FetchLogsResponse(
        result: APiResponseType.success,
        data: LogsInfo.fromV6(queries),
      );
    });
  }

  void _initApiGatewayV6Mock() {
    when(mockApiGatewayV6.getDomainLists()).thenAnswer(
      (_) async => GetDomainLists(
        result: APiResponseType.success,
        data: DomainListResult(
          whitelist: domains,
          whitelistRegex: [],
          blacklist: domains,
          blacklistRegex: [],
        ),
      ),
    );

    when(mockApiGatewayV6.removeDomainFromList(any)).thenAnswer((_) async {
      return RemoveDomainFromListResponse(result: APiResponseType.success);
    });

    when(mockApiGatewayV6.addDomainToList(any)).thenAnswer((_) async {
      return AddDomainToListResponse(result: APiResponseType.success);
    });

    when(
      mockApiGatewayV6.fetchLogs(
        any,
        any,
        size: anyNamed('size'),
        cursor: anyNamed('cursor'),
      ),
    ).thenAnswer((_) async {
      return FetchLogsResponse(
        result: APiResponseType.success,
        data: LogsInfo.fromV6(queries),
      );
    });

    when(mockApiGatewayV6.setWhiteBlacklist(any, any)).thenAnswer((_) async {
      return SetWhiteBlacklistResponse(
        result: APiResponseType.success,
        data: DomainResult(success: true, message: 'Added white.example.com'),
      );
    });

    when(mockApiGatewayV6.enableServerRequest()).thenAnswer((_) async {
      return EnableServerResponse(result: APiResponseType.success);
    });

    when(mockApiGatewayV6.disableServerRequest(any)).thenAnswer((_) async {
      return DisableServerResponse(result: APiResponseType.success);
    });

    when(mockApiGatewayV6.loginQuery()).thenAnswer(
      (_) async => LoginQueryResponse(
        result: APiResponseType.success,
        status: 'enabled',
        sid: 'sid123',
      ),
    );

    when(mockApiGatewayV6.loginQuery(refresh: true)).thenAnswer(
      (_) async => LoginQueryResponse(
        result: APiResponseType.success,
        status: 'enabled',
        sid: 'sid123',
      ),
    );

    when(mockApiGatewayV6.realtimeStatus(clientCount: anyNamed('clientCount')))
        .thenAnswer(
      (_) async => RealtimeStatusResponse(
        result: APiResponseType.success,
        data: realtimeStatus,
      ),
    );

    when(mockApiGatewayV6.fetchOverTimeData()).thenAnswer(
      (_) async => FetchOverTimeDataResponse(
        result: APiResponseType.success,
        data: overtimeData,
      ),
    );

    when(mockApiGatewayV6.fetchAllServerInfo()).thenAnswer(
      (_) async => PiHoleServerInfoResponse(
        result: APiResponseType.success,
        version: VersionInfo.fromV6(version),
        host: HostInfo.fromV6(host),
        sensors: SensorsInfo.fromV6(sensors),
        system: SystemInfo.fromV6(system),
      ),
    );

    when(mockApiGatewayV6.server).thenReturn(serverV6);

    when(mockApiGatewayV6.updateSubscription(body: anyNamed('body')))
        .thenAnswer(
      (_) async => SubscriptionsResponse(
        result: APiResponseType.success,
        data: SubscriptionsInfo.fromV6(subscriptions),
      ),
    );

    when(mockApiGatewayV6.createSubscription(body: anyNamed('body')))
        .thenAnswer(
      (_) async => SubscriptionsResponse(
        result: APiResponseType.success,
        data: SubscriptionsInfo.fromV6(subscriptions),
      ),
    );

    when(
      mockApiGatewayV6.removeSubscription(
        url: anyNamed('url'),
        stype: anyNamed('stype'),
      ),
    ).thenAnswer(
      (_) async => RemoveSubscriptionResponse(
        result: APiResponseType.success,
      ),
    );

    when(mockApiGatewayV6.updateDomain(body: anyNamed('body'))).thenAnswer(
      (_) async => DomainResponse(
        result: APiResponseType.success,
        data: domains[0],
      ),
    );

    when(mockApiGatewayV6.getMetrics()).thenAnswer(
      (_) async => MetricsResponse(
        result: APiResponseType.success,
        data: MetricsInfo.fromV6(metrics),
      ),
    );

    when(mockApiGatewayV6.getGateway(isDetailed: true)).thenAnswer(
      (_) async => GatewayResponse(
        result: APiResponseType.success,
        data: GatewayInfo.fromV6(gateway),
      ),
    );

    when(mockApiGatewayV6.getConfiguration(element: anyNamed('element')))
        .thenAnswer(
      (_) async => ConfigurationResponse(
        result: APiResponseType.success,
        data: ConfigInfo.fromV6(configDns),
      ),
    );

    when(mockApiGatewayV6.patchConfiguration(any)).thenAnswer(
      (_) async => ConfigurationResponse(
        result: APiResponseType.success,
        data: ConfigInfo.fromV6(configDns),
      ),
    );

    when(mockApiGatewayV6.patchDnsQueryLoggingConfig(any)).thenAnswer(
      (_) async => ConfigurationResponse(
        result: APiResponseType.success,
        data: ConfigInfo.fromV6(configDns),
      ),
    );

    when(mockApiGatewayV6.flushArp()).thenAnswer(
      (_) async => ActionResponse(
        result: APiResponseType.success,
        data: 'success',
      ),
    );

    when(mockApiGatewayV6.flushLogs()).thenAnswer(
      (_) async => ActionResponse(
        result: APiResponseType.success,
        data: 'success',
      ),
    );

    when(mockApiGatewayV6.restartDns()).thenAnswer(
      (_) async => ActionResponse(
        result: APiResponseType.success,
        data: 'success',
      ),
    );

    when(mockApiGatewayV6.getSessions()).thenAnswer(
      (_) async => SessionsResponse(
        result: APiResponseType.success,
        data: SessionsInfo.fromV6(sessions),
      ),
    );

    when(mockApiGatewayV6.deleteSession(any)).thenAnswer(
      (_) async => DeleteSessionResponse(
        result: APiResponseType.success,
      ),
    );

    when(mockApiGatewayV6.getClient()).thenAnswer(
      (_) async => ClientResponse(
        result: APiResponseType.success,
        data: ClientInfo.fromV6(client),
      ),
    );

    when(mockApiGatewayV6.getDevices()).thenAnswer(
      (_) async => DevicesResponse(
        result: APiResponseType.success,
        data: DevicesInfo.fromV6(devices),
      ),
    );

    when(mockApiGatewayV6.deleteDevice(any)).thenAnswer(
      (_) async => DeleteDeviceResponse(
        result: APiResponseType.success,
      ),
    );

    when(mockApiGatewayV6.getDhcps()).thenAnswer(
      (_) async => DhcpResponse(
        result: APiResponseType.success,
        data: DhcpsInfo.fromV6(dhcp),
      ),
    );

    when(mockApiGatewayV6.deleteDhcp(any)).thenAnswer(
      (_) async => DeleteDhcpResponse(
        result: APiResponseType.success,
      ),
    );
  }

  void _initStatusUpdateServiceMock() {
    when(mockStatusUpdateService.startAutoRefresh()).thenReturn(null);
    when(mockStatusUpdateService.refreshOnce()).thenAnswer((_) async => ());
  }
}
