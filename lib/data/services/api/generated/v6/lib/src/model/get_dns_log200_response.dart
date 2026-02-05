//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/log_log_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_dns_log200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetDnsLog200Response {
  /// Returns a new [GetDnsLog200Response] instance.
  GetDnsLog200Response({

     this.log,

     this.nextID,

     this.pid,

     this.file,

     this.took,
  });

      /// Request headers
  @JsonKey(
    
    name: r'log',
    required: false,
    includeIfNull: false,
  )


  final List<LogLogInner>? log;



      /// Next ID to query if checking for new log lines
  @JsonKey(
    
    name: r'nextID',
    required: false,
    includeIfNull: false,
  )


  final int? nextID;



      /// Process ID of FTL. When this changes, FTL was restarted and nextID should be reset to 0.
  @JsonKey(
    
    name: r'pid',
    required: false,
    includeIfNull: false,
  )


  final int? pid;



      /// Path to respective log file on disk
  @JsonKey(
    
    name: r'file',
    required: false,
    includeIfNull: false,
  )


  final String? file;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetDnsLog200Response &&
      other.log == log &&
      other.nextID == nextID &&
      other.pid == pid &&
      other.file == file &&
      other.took == took;

    @override
    int get hashCode =>
        log.hashCode +
        nextID.hashCode +
        pid.hashCode +
        file.hashCode +
        took.hashCode;

  factory GetDnsLog200Response.fromJson(Map<String, dynamic> json) => _$GetDnsLog200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDnsLog200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

