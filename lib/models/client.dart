import 'package:pi_hole_client/models/api/v6/ftl/client.dart';

class ClientInfo {
  ClientInfo({
    required this.addr,
  });

  factory ClientInfo.fromV6(Client client) {
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
