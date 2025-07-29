import 'package:pi_hole_client/data/services/api/model/v6/ftl/client.dart';

class ClientInfo {
  ClientInfo({
    required this.addr,
  });

  factory ClientInfo.fromV6(InfoClient client) {
    return ClientInfo(
      addr: client.remoteAddr,
    );
  }

  final String addr;

  Map<String, dynamic> toJson() {
    return {
      'addr': addr,
    };
  }
}
