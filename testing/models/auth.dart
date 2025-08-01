import 'package:pi_hole_client/data/services/api/model/v6/auth/auth.dart'
    as s_auth;
import 'package:pi_hole_client/data/services/api/model/v6/auth/sessions.dart'
    as s_auth_sessions;
import 'package:pi_hole_client/domain/models/auth.dart' as d_auth;
import 'package:pi_hole_client/domain/models/auth_session.dart'
    as d_auth_session;

// ===========================================================================
// Json data for testing
// ===========================================================================
final kPostAuthJson = {
  'session': {
    'valid': true,
    'totp': false,
    'sid': 'n9n9f6c3umrumfq2ese1lvu2pg',
    'csrf': 'Ux87YTIiMOf/GKCefVIOMw=',
    'validity': 300,
    'message': 'correct password',
  },
  'took': 0.03,
};

final kGetAuthSessionsJson = {
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
};

// ===========================================================================
// Service response data
// ===========================================================================
final kPostAuth = s_auth.Session.fromJson(kPostAuthJson);

final kGetAuthSessions =
    s_auth_sessions.AuthSessions.fromJson(kGetAuthSessionsJson);

// ===========================================================================
// Repository response data
// ===========================================================================
final kCreateSession = d_auth.Auth.fromV6(kPostAuth);

final kGetAllSessions =
    kGetAuthSessions.sessions.map(d_auth_session.AuthSession.fromV6).toList();
