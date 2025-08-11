// ignore_for_file: prefer_const_constructors
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/services/api/model/v6/auth/auth.dart' as s;
import 'package:pi_hole_client/data/services/api/model/v6/auth/sessions.dart'
    as s;
import 'package:pi_hole_client/domain/models/auth/auth.dart' as d;

// ===========================================================================
// Service response data
// ===========================================================================
final kSrvPostAuth = s.Session(
  session: s.SessionDetail(
    valid: true,
    totp: false,
    sid: 'n9n9f6c3umrumfq2ese1lvu2pg',
    csrf: 'Ux87YTIiMOf/GKCefVIOMw=',
    validity: 300,
    message: 'correct password',
  ),
  took: 0.003,
);

final kSrvGetAuthSessions = s.AuthSessions(
  sessions: [
    s.SessionData(
      id: 0,
      currentSession: false,
      valid: false,
      tls: s.Tls(login: false, mixed: false),
      app: false,
      cli: false,
      loginAt: 1580000000,
      lastActive: 1580000000,
      validUntil: 1580000300,
      remoteAddr: '192.168.0.30',
      userAgent: 'Dart/3.7 (dart:io)',
    ),
    s.SessionData(
      id: 1,
      currentSession: true,
      valid: true,
      tls: s.Tls(login: true, mixed: false),
      app: false,
      cli: false,
      loginAt: 1580000000,
      lastActive: 1580000000,
      validUntil: 1580000300,
      remoteAddr: '192.168.0.31',
      userAgent:
          'Mozilla/5.0 (X11; Linux x86_64; rv:107.0) Gecko/20100101 Firefox/107.0',
    ),
    s.SessionData(
      id: 2,
      currentSession: false,
      valid: false,
      tls: s.Tls(login: false, mixed: true),
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
final kRepoCreateSession = d.Auth(
  valid: true,
  totp: false,
  sid: 'n9n9f6c3umrumfq2ese1lvu2pg',
  csrf: 'Ux87YTIiMOf/GKCefVIOMw=',
  validity: 300,
  message: 'correct password',
);

final kRepoGetAllSessions = [
  d.AuthSession(
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
  d.AuthSession(
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
  d.AuthSession(
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
