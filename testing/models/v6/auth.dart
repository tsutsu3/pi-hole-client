import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/v6/auth/auth.dart' as srv;
import 'package:pi_hole_client/data/model/v6/auth/sessions.dart' as srv;
import 'package:pi_hole_client/domain/model/auth/auth.dart' as repo;

// ===========================================================================
// Service response data
// ===========================================================================
final kSrvPostAuth = srv.Session(
  session: srv.SessionDetail(
    valid: true,
    totp: false,
    sid: 'n9n9f6c3umrumfq2ese1lvu2pg',
    csrf: 'Ux87YTIiMOf/GKCefVIOMw=',
    validity: 300,
    message: 'correct password',
  ),
  took: 0.003,
);

const kSrvGetAuthSessions = srv.AuthSessions(
  sessions: [
    srv.SessionData(
      id: 0,
      currentSession: false,
      valid: false,
      tls: srv.Tls(login: false, mixed: false),
      app: false,
      cli: false,
      loginAt: 1580000000,
      lastActive: 1580000000,
      validUntil: 1580000300,
      remoteAddr: '192.168.0.30',
      userAgent: 'Dart/3.7 (dart:io)',
    ),
    srv.SessionData(
      id: 1,
      currentSession: true,
      valid: true,
      tls: srv.Tls(login: true, mixed: false),
      app: false,
      cli: false,
      loginAt: 1580000000,
      lastActive: 1580000000,
      validUntil: 1580000300,
      remoteAddr: '192.168.0.31',
      userAgent:
          'Mozilla/5.0 (X11; Linux x86_64; rv:107.0) Gecko/20100101 Firefox/107.0',
    ),
    srv.SessionData(
      id: 2,
      currentSession: false,
      valid: false,
      tls: srv.Tls(login: false, mixed: true),
      app: true,
      cli: true,
      loginAt: 1580000000,
      lastActive: 1580000000,
      validUntil: 1580000300,
      remoteAddr: '192.168.0.32',
      userAgent: 'Dart/3.7 (dart:io)',
    ),
  ],
  took: 0.003,
);

// ===========================================================================
// Repository response data
// ===========================================================================
final kRepoCreateSession = repo.Auth(
  valid: true,
  totp: false,
  sid: 'n9n9f6c3umrumfq2ese1lvu2pg',
  csrf: 'Ux87YTIiMOf/GKCefVIOMw=',
  validity: 300,
  message: 'correct password',
);

final kRepoGetAllSessions = [
  repo.AuthSession(
    id: 0,
    isValid: false,
    isCurrentSession: false,
    tlsStatus: TlsStatus.none,
    isApp: false,
    isCli: false,
    loginAt: DateTime.fromMillisecondsSinceEpoch(1580000000 * 1000),
    lastActive: DateTime.fromMillisecondsSinceEpoch(1580000000 * 1000),
    validUntil: DateTime.fromMillisecondsSinceEpoch(1580000300 * 1000),
    clientIp: '192.168.0.30',
    userAgent: 'Dart/3.7 (dart:io)',
  ),
  repo.AuthSession(
    id: 1,
    isValid: true,
    isCurrentSession: true,
    tlsStatus: TlsStatus.login,
    isApp: false,
    isCli: false,
    loginAt: DateTime.fromMillisecondsSinceEpoch(1580000000 * 1000),
    lastActive: DateTime.fromMillisecondsSinceEpoch(1580000000 * 1000),
    validUntil: DateTime.fromMillisecondsSinceEpoch(1580000300 * 1000),
    clientIp: '192.168.0.31',
    userAgent:
        'Mozilla/5.0 (X11; Linux x86_64; rv:107.0) Gecko/20100101 Firefox/107.0',
  ),
  repo.AuthSession(
    id: 2,
    isValid: false,
    isCurrentSession: false,
    tlsStatus: TlsStatus.mixed,
    isApp: true,
    isCli: true,
    loginAt: DateTime.fromMillisecondsSinceEpoch(1580000000 * 1000),
    lastActive: DateTime.fromMillisecondsSinceEpoch(1580000000 * 1000),
    validUntil: DateTime.fromMillisecondsSinceEpoch(1580000300 * 1000),
    clientIp: '192.168.0.32',
    userAgent: 'Dart/3.7 (dart:io)',
  ),
];
