//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Login {
  /// Returns a new [Login] instance.
  Login({

     this.httpsPort,

     this.dns,
  });

      /// HTTPS port of the Pi-hole webserver (0 if disabled)
  @JsonKey(
    
    name: r'https_port',
    required: false,
    includeIfNull: false,
  )


  final int? httpsPort;



      /// Whether the DNS server is up and running. False only in failed state
  @JsonKey(
    
    name: r'dns',
    required: false,
    includeIfNull: false,
  )


  final bool? dns;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Login &&
      other.httpsPort == httpsPort &&
      other.dns == dns;

    @override
    int get hashCode =>
        httpsPort.hashCode +
        dns.hashCode;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

