//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/ftl_ftl_database_domains.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_database_regex.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ftl_ftl_database.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FtlFtlDatabase {
  /// Returns a new [FtlFtlDatabase] instance.
  FtlFtlDatabase({

     this.gravity,

     this.groups,

     this.lists,

     this.clients,

     this.domains,

     this.regex,
  });

      /// Number of collected exact domains on lists
  @JsonKey(
    
    name: r'gravity',
    required: false,
    includeIfNull: false,
  )


  final int? gravity;



      /// Number of groups
  @JsonKey(
    
    name: r'groups',
    required: false,
    includeIfNull: false,
  )


  final int? groups;



      /// Number of lists
  @JsonKey(
    
    name: r'lists',
    required: false,
    includeIfNull: false,
  )


  final int? lists;



      /// Number of configured clients
  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final int? clients;



  @JsonKey(
    
    name: r'domains',
    required: false,
    includeIfNull: false,
  )


  final FtlFtlDatabaseDomains? domains;



  @JsonKey(
    
    name: r'regex',
    required: false,
    includeIfNull: false,
  )


  final FtlFtlDatabaseRegex? regex;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FtlFtlDatabase &&
      other.gravity == gravity &&
      other.groups == groups &&
      other.lists == lists &&
      other.clients == clients &&
      other.domains == domains &&
      other.regex == regex;

    @override
    int get hashCode =>
        gravity.hashCode +
        groups.hashCode +
        lists.hashCode +
        clients.hashCode +
        domains.hashCode +
        regex.hashCode;

  factory FtlFtlDatabase.fromJson(Map<String, dynamic> json) => _$FtlFtlDatabaseFromJson(json);

  Map<String, dynamic> toJson() => _$FtlFtlDatabaseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

