import 'package:freezed_annotation/freezed_annotation.dart';

part 'server.freezed.dart';

@freezed
sealed class Server with _$Server {
  const factory Server({
    required String address,
    required String alias,
    required String apiVersion,
    @Default(false) bool defaultServer,
    @Default(false) bool allowSelfSignedCert,
    @Default(false) bool ignoreCertificateErrors,
    String? pinnedCertificateSha256,
  }) = _Server;
}
