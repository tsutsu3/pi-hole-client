//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/schemas_queries_queries_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_queries.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasQueries {
  /// Returns a new [SchemasQueries] instance.
  SchemasQueries({

     this.queries,

     this.cursor,

     this.recordsTotal,

     this.recordsFiltered,

     this.draw,
  });

      /// Data array
  @JsonKey(
    
    name: r'queries',
    required: false,
    includeIfNull: false,
  )


  final List<SchemasQueriesQueriesInner>? queries;



      /// Database ID of most recent query to show
  @JsonKey(
    
    name: r'cursor',
    required: false,
    includeIfNull: false,
  )


  final int? cursor;



      /// Total number of available queries
  @JsonKey(
    
    name: r'recordsTotal',
    required: false,
    includeIfNull: false,
  )


  final int? recordsTotal;



      /// Number of available queries after filtering
  @JsonKey(
    
    name: r'recordsFiltered',
    required: false,
    includeIfNull: false,
  )


  final int? recordsFiltered;



      /// DataTables-specific integer (echos input value)
  @JsonKey(
    
    name: r'draw',
    required: false,
    includeIfNull: false,
  )


  final int? draw;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasQueries &&
      other.queries == queries &&
      other.cursor == cursor &&
      other.recordsTotal == recordsTotal &&
      other.recordsFiltered == recordsFiltered &&
      other.draw == draw;

    @override
    int get hashCode =>
        queries.hashCode +
        cursor.hashCode +
        recordsTotal.hashCode +
        recordsFiltered.hashCode +
        draw.hashCode;

  factory SchemasQueries.fromJson(Map<String, dynamic> json) => _$SchemasQueriesFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasQueriesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

