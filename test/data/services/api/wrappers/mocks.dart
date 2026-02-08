import 'package:mockito/annotations.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';

@GenerateMocks([
  PiholeV6Api,
  AuthenticationApi,
  ActionsApi,
  ClientManagementApi,
  DHCPApi,
  DNSControlApi,
  DomainManagementApi,
  FTLInformationApi,
  GroupManagementApi,
  ListManagementApi,
  MetricsApi,
  NetworkInformationApi,
  PiHoleConfigurationApi,
])
void main() {}
