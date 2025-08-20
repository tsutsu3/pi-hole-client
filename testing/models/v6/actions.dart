import 'package:pi_hole_client/data/model/v6/action/action.dart' as s;

const kSrvPostActionFlushArp = s.Action(status: 'success', took: 0.003);

const kSrvPostActionFlushLogs = s.Action(status: 'success', took: 0.003);

const kSrvPostActionGravity = [
  ['Line 1', 'Line 2'],
  ['Line 3'],
  [],
];

const kSrvPostActionRestartDns = s.Action(status: 'success', took: 0.003);

const kRepoGravity = [
  ['Line 1', 'Line 2'],
  ['Line 3'],
  [],
];
