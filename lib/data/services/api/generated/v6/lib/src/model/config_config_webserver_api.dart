//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/config_config_webserver_api_temp.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_webserver_api.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigWebserverApi {
  /// Returns a new [ConfigConfigWebserverApi] instance.
  ConfigConfigWebserverApi({

     this.maxSessions,

     this.prettyJSON,

     this.password,

     this.pwhash,

     this.totpSecret,

     this.appPwhash,

     this.appSudo,

     this.cliPw,

     this.excludeClients,

     this.excludeDomains,

     this.maxHistory,

     this.maxClients,

     this.clientHistoryGlobalMax,

     this.allowDestructive,

     this.temp,
  });

  @JsonKey(
    
    name: r'max_sessions',
    required: false,
    includeIfNull: false,
  )


  final int? maxSessions;



  @JsonKey(
    
    name: r'prettyJSON',
    required: false,
    includeIfNull: false,
  )


  final bool? prettyJSON;



      /// *Note:* Special write-only property used to change the password via the API. 
  @JsonKey(
    
    name: r'password',
    required: false,
    includeIfNull: false,
  )


  final String? password;



  @JsonKey(
    
    name: r'pwhash',
    required: false,
    includeIfNull: false,
  )


  final String? pwhash;



  @JsonKey(
    
    name: r'totp_secret',
    required: false,
    includeIfNull: false,
  )


  final String? totpSecret;



  @JsonKey(
    
    name: r'app_pwhash',
    required: false,
    includeIfNull: false,
  )


  final String? appPwhash;



  @JsonKey(
    
    name: r'app_sudo',
    required: false,
    includeIfNull: false,
  )


  final bool? appSudo;



  @JsonKey(
    
    name: r'cli_pw',
    required: false,
    includeIfNull: false,
  )


  final bool? cliPw;



  @JsonKey(
    
    name: r'excludeClients',
    required: false,
    includeIfNull: false,
  )


  final List<String>? excludeClients;



  @JsonKey(
    
    name: r'excludeDomains',
    required: false,
    includeIfNull: false,
  )


  final List<String>? excludeDomains;



  @JsonKey(
    
    name: r'maxHistory',
    required: false,
    includeIfNull: false,
  )


  final int? maxHistory;



  @JsonKey(
    
    name: r'maxClients',
    required: false,
    includeIfNull: false,
  )


  final int? maxClients;



  @JsonKey(
    
    name: r'client_history_global_max',
    required: false,
    includeIfNull: false,
  )


  final bool? clientHistoryGlobalMax;



  @JsonKey(
    
    name: r'allow_destructive',
    required: false,
    includeIfNull: false,
  )


  final bool? allowDestructive;



  @JsonKey(
    
    name: r'temp',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigWebserverApiTemp? temp;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigWebserverApi &&
      other.maxSessions == maxSessions &&
      other.prettyJSON == prettyJSON &&
      other.password == password &&
      other.pwhash == pwhash &&
      other.totpSecret == totpSecret &&
      other.appPwhash == appPwhash &&
      other.appSudo == appSudo &&
      other.cliPw == cliPw &&
      other.excludeClients == excludeClients &&
      other.excludeDomains == excludeDomains &&
      other.maxHistory == maxHistory &&
      other.maxClients == maxClients &&
      other.clientHistoryGlobalMax == clientHistoryGlobalMax &&
      other.allowDestructive == allowDestructive &&
      other.temp == temp;

    @override
    int get hashCode =>
        maxSessions.hashCode +
        prettyJSON.hashCode +
        password.hashCode +
        pwhash.hashCode +
        totpSecret.hashCode +
        appPwhash.hashCode +
        appSudo.hashCode +
        cliPw.hashCode +
        excludeClients.hashCode +
        excludeDomains.hashCode +
        maxHistory.hashCode +
        maxClients.hashCode +
        clientHistoryGlobalMax.hashCode +
        allowDestructive.hashCode +
        temp.hashCode;

  factory ConfigConfigWebserverApi.fromJson(Map<String, dynamic> json) => _$ConfigConfigWebserverApiFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigWebserverApiToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

