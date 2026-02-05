//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/database_owner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_dbinfo200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetDbinfo200Response {
  /// Returns a new [GetDbinfo200Response] instance.
  GetDbinfo200Response({

     this.size,

     this.type,

     this.mode,

     this.atime,

     this.mtime,

     this.ctime,

     this.owner,

     this.queries,

     this.earliestTimestamp,

     this.queriesDisk,

     this.earliestTimestampDisk,

     this.sqliteVersion,

     this.took,
  });

      /// Database size in bytes
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Database file type
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Database file mode
  @JsonKey(
    
    name: r'mode',
    required: false,
    includeIfNull: false,
  )


  final String? mode;



      /// Timestamp of last access
  @JsonKey(
    
    name: r'atime',
    required: false,
    includeIfNull: false,
  )


  final int? atime;



      /// Timestamp of last modification
  @JsonKey(
    
    name: r'mtime',
    required: false,
    includeIfNull: false,
  )


  final int? mtime;



      /// Timestamp of last status change
  @JsonKey(
    
    name: r'ctime',
    required: false,
    includeIfNull: false,
  )


  final int? ctime;



  @JsonKey(
    
    name: r'owner',
    required: false,
    includeIfNull: false,
  )


  final DatabaseOwner? owner;



      /// Number of queries in in-memory database
  @JsonKey(
    
    name: r'queries',
    required: false,
    includeIfNull: false,
  )


  final int? queries;



      /// Unix timestamp of the earliest query in the in-memory database (Defaults to 0.0 if no queries are stored in memory)
  @JsonKey(
    
    name: r'earliest_timestamp',
    required: false,
    includeIfNull: false,
  )


  final num? earliestTimestamp;



      /// Number of queries in on-disk database
  @JsonKey(
    
    name: r'queries_disk',
    required: false,
    includeIfNull: false,
  )


  final int? queriesDisk;



      /// Unix timestamp of the earliest query in the on-disk database (Defaults to 0.0 if no queries are stored on disk)
  @JsonKey(
    
    name: r'earliest_timestamp_disk',
    required: false,
    includeIfNull: false,
  )


  final num? earliestTimestampDisk;



      /// Version of embedded SQLite3 engine
  @JsonKey(
    
    name: r'sqlite_version',
    required: false,
    includeIfNull: false,
  )


  final String? sqliteVersion;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetDbinfo200Response &&
      other.size == size &&
      other.type == type &&
      other.mode == mode &&
      other.atime == atime &&
      other.mtime == mtime &&
      other.ctime == ctime &&
      other.owner == owner &&
      other.queries == queries &&
      other.earliestTimestamp == earliestTimestamp &&
      other.queriesDisk == queriesDisk &&
      other.earliestTimestampDisk == earliestTimestampDisk &&
      other.sqliteVersion == sqliteVersion &&
      other.took == took;

    @override
    int get hashCode =>
        size.hashCode +
        type.hashCode +
        mode.hashCode +
        atime.hashCode +
        mtime.hashCode +
        ctime.hashCode +
        owner.hashCode +
        queries.hashCode +
        earliestTimestamp.hashCode +
        queriesDisk.hashCode +
        earliestTimestampDisk.hashCode +
        sqliteVersion.hashCode +
        took.hashCode;

  factory GetDbinfo200Response.fromJson(Map<String, dynamic> json) => _$GetDbinfo200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDbinfo200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

