import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/server.dart';

abstract interface class ApiGateway {
  Future realtimeStatus(Server server);

  Future loginQuery(Server server);

  dynamic disableServerRequest(Server server, int time);

  dynamic enableServerRequest(Server server);

  Future fetchOverTimeData(Server server);

  Future fetchLogs({
    required Server server,
    required DateTime from,
    required DateTime until,
  });

  Future setWhiteBlacklist({
    required Server server,
    required String domain,
    required String list,
  });

  Future getDomainLists({required Server server});

  Future removeDomainFromList({required Server server, required Domain domain});

  Future addDomainToList({
    required Server server,
    required Map<String, dynamic> domainData,
  });
}
