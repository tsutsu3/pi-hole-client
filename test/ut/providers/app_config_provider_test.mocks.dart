// Mocks generated by Mockito 5.4.5 from annotations
// in pi_hole_client/test/ut/providers/app_config_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pi_hole_client/models/repository/database.dart' as _i2;
import 'package:pi_hole_client/models/server.dart' as _i6;
import 'package:pi_hole_client/repository/database.dart' as _i4;
import 'package:sqflite/sqflite.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAppDbData_0 extends _i1.SmartFake implements _i2.AppDbData {
  _FakeAppDbData_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDatabase_1 extends _i1.SmartFake implements _i3.Database {
  _FakeDatabase_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePiHoleClientData_2 extends _i1.SmartFake
    implements _i2.PiHoleClientData {
  _FakePiHoleClientData_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DatabaseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseRepository extends _i1.Mock
    implements _i4.DatabaseRepository {
  MockDatabaseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i2.ServerDbData> get servers => (super.noSuchMethod(
        Invocation.getter(#servers),
        returnValue: <_i2.ServerDbData>[],
      ) as List<_i2.ServerDbData>);

  @override
  _i2.AppDbData get appConfig => (super.noSuchMethod(
        Invocation.getter(#appConfig),
        returnValue: _FakeAppDbData_0(
          this,
          Invocation.getter(#appConfig),
        ),
      ) as _i2.AppDbData);

  @override
  _i3.Database get dbInstance => (super.noSuchMethod(
        Invocation.getter(#dbInstance),
        returnValue: _FakeDatabase_1(
          this,
          Invocation.getter(#dbInstance),
        ),
      ) as _i3.Database);

  @override
  _i5.Future<void> initialize({String? path}) => (super.noSuchMethod(
        Invocation.method(
          #initialize,
          [],
          {#path: path},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  Map<String, dynamic> toDict() => (super.noSuchMethod(
        Invocation.method(
          #toDict,
          [],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);

  @override
  _i5.Future<_i2.PiHoleClientData> loadDb({String? path}) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadDb,
          [],
          {#path: path},
        ),
        returnValue:
            _i5.Future<_i2.PiHoleClientData>.value(_FakePiHoleClientData_2(
          this,
          Invocation.method(
            #loadDb,
            [],
            {#path: path},
          ),
        )),
      ) as _i5.Future<_i2.PiHoleClientData>);

  @override
  _i5.Future<bool> closeDb() => (super.noSuchMethod(
        Invocation.method(
          #closeDb,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool?> saveServerQuery(_i6.Server? server) => (super.noSuchMethod(
        Invocation.method(
          #saveServerQuery,
          [server],
        ),
        returnValue: _i5.Future<bool?>.value(),
      ) as _i5.Future<bool?>);

  @override
  _i5.Future<bool> editServerQuery(_i6.Server? server) => (super.noSuchMethod(
        Invocation.method(
          #editServerQuery,
          [server],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool?> setDefaultServerQuery(String? url) => (super.noSuchMethod(
        Invocation.method(
          #setDefaultServerQuery,
          [url],
        ),
        returnValue: _i5.Future<bool?>.value(),
      ) as _i5.Future<bool?>);

  @override
  _i5.Future<bool> removeServerQuery(String? address) => (super.noSuchMethod(
        Invocation.method(
          #removeServerQuery,
          [address],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> deleteServersDataQuery() => (super.noSuchMethod(
        Invocation.method(
          #deleteServersDataQuery,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<Map<String, dynamic>> checkUrlExistsQuery(String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkUrlExistsQuery,
          [url],
        ),
        returnValue:
            _i5.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i5.Future<Map<String, dynamic>>);

  @override
  _i5.Future<bool> updateConfigQuery({
    required String? column,
    required Object? value,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateConfigQuery,
          [],
          {
            #column: column,
            #value: value,
          },
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> restoreAppConfigQuery() => (super.noSuchMethod(
        Invocation.method(
          #restoreAppConfigQuery,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}
