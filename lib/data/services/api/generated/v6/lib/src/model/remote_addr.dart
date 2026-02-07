//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_addr.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RemoteAddr {
  /// Returns a new [RemoteAddr] instance.
  RemoteAddr({

     this.remoteAddr,
  });

      /// Address of requesting client
  @JsonKey(
    
    name: r'remote_addr',
    required: false,
    includeIfNull: false,
  )


  final String? remoteAddr;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RemoteAddr &&
      other.remoteAddr == remoteAddr;

    @override
    int get hashCode =>
        remoteAddr.hashCode;

  factory RemoteAddr.fromJson(Map<String, dynamic> json) => _$RemoteAddrFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAddrToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

