// ignore_for_file: prefer_const_constructors, prefer_const_declarations
import 'package:pi_hole_client/data/services/api/model/v6/action/action.dart'
    as s;

final kSrvPostActionFlushArp = s.Action(status: 'success', took: 0.003);

final kSrvPostActionFlushLogs = s.Action(status: 'success', took: 0.003);

final kSrvPostActionGravity = [
  ['Line 1', 'Line 2'],
  ['Line 3'],
  [],
];

final kSrvPostActionRestartDns = s.Action(status: 'success', took: 0.003);

final kRepoGravity = [
  ['Line 1', 'Line 2'],
  ['Line 3'],
  [],
];
