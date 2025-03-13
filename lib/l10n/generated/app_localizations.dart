import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('ja'),
    Locale('pl')
  ];

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutThisApp.
  ///
  /// In en, this message translates to:
  /// **'Get help and learn about this app'**
  String get aboutThisApp;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addAsWildcard.
  ///
  /// In en, this message translates to:
  /// **'Add as wildcard'**
  String get addAsWildcard;

  /// No description provided for @addDomain.
  ///
  /// In en, this message translates to:
  /// **'Add domain'**
  String get addDomain;

  /// No description provided for @addServer.
  ///
  /// In en, this message translates to:
  /// **'Add server connection'**
  String get addServer;

  /// No description provided for @addedBlacklist.
  ///
  /// In en, this message translates to:
  /// **'Domain added to blacklist.'**
  String get addedBlacklist;

  /// No description provided for @addedWhitelist.
  ///
  /// In en, this message translates to:
  /// **'Domain added to whitelist.'**
  String get addedWhitelist;

  /// No description provided for @addingBlacklist.
  ///
  /// In en, this message translates to:
  /// **'Adding to blacklist...'**
  String get addingBlacklist;

  /// No description provided for @addingDomain.
  ///
  /// In en, this message translates to:
  /// **'Adding domain...'**
  String get addingDomain;

  /// No description provided for @addingWhitelist.
  ///
  /// In en, this message translates to:
  /// **'Adding to whitelist...'**
  String get addingWhitelist;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'IP address or domain'**
  String get address;

  /// No description provided for @advancedSetup.
  ///
  /// In en, this message translates to:
  /// **'Advanced settings'**
  String get advancedSetup;

  /// No description provided for @advancedSetupDescription.
  ///
  /// In en, this message translates to:
  /// **'Advanced options'**
  String get advancedSetupDescription;

  /// No description provided for @advancedStatusFiltering.
  ///
  /// In en, this message translates to:
  /// **'Advanced status filtering'**
  String get advancedStatusFiltering;

  /// No description provided for @agreePrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'By enabling this option, you agree to our'**
  String get agreePrivacyPolicy;

  /// No description provided for @alias.
  ///
  /// In en, this message translates to:
  /// **'Alias'**
  String get alias;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @allClientsSelected.
  ///
  /// In en, this message translates to:
  /// **'All clients selected'**
  String get allClientsSelected;

  /// No description provided for @allItemsSelected.
  ///
  /// In en, this message translates to:
  /// **'All items selected'**
  String get allItemsSelected;

  /// No description provided for @allStatusSelected.
  ///
  /// In en, this message translates to:
  /// **'All status selected'**
  String get allStatusSelected;

  /// No description provided for @allowCrashReport.
  ///
  /// In en, this message translates to:
  /// **'Allow crash report submission?'**
  String get allowCrashReport;

  /// No description provided for @allowed.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get allowed;

  /// No description provided for @alreadyBlacklist.
  ///
  /// In en, this message translates to:
  /// **'Domain is already on blacklist.'**
  String get alreadyBlacklist;

  /// No description provided for @alreadyWhitelist.
  ///
  /// In en, this message translates to:
  /// **'Domain is already on whitelist.'**
  String get alreadyWhitelist;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @answeredBy.
  ///
  /// In en, this message translates to:
  /// **'Answered by'**
  String get answeredBy;

  /// No description provided for @apiToken.
  ///
  /// In en, this message translates to:
  /// **'API token'**
  String get apiToken;

  /// No description provided for @appInfo.
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get appInfo;

  /// No description provided for @appLogs.
  ///
  /// In en, this message translates to:
  /// **'App logs'**
  String get appLogs;

  /// No description provided for @appSettings.
  ///
  /// In en, this message translates to:
  /// **'App settings'**
  String get appSettings;

  /// No description provided for @appUnlock.
  ///
  /// In en, this message translates to:
  /// **'App unlock'**
  String get appUnlock;

  /// No description provided for @appUnlockDescription.
  ///
  /// In en, this message translates to:
  /// **'Use a code or the fingerprint to unlock the app'**
  String get appUnlockDescription;

  /// No description provided for @appUnlockDisabled.
  ///
  /// In en, this message translates to:
  /// **'App unlock disabled'**
  String get appUnlockDisabled;

  /// No description provided for @appUnlockEnabled.
  ///
  /// In en, this message translates to:
  /// **'App unlock enabled'**
  String get appUnlockEnabled;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'App version'**
  String get appVersion;

  /// No description provided for @application.
  ///
  /// In en, this message translates to:
  /// **'Application'**
  String get application;

  /// No description provided for @applicationDetail.
  ///
  /// In en, this message translates to:
  /// **'Application Detail'**
  String get applicationDetail;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @areSureRemovePasscode.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove the passcode? This will disable the app unlock protection.'**
  String get areSureRemovePasscode;

  /// No description provided for @authentication.
  ///
  /// In en, this message translates to:
  /// **'Authentication'**
  String get authentication;

  /// No description provided for @autoRefreshTime.
  ///
  /// In en, this message translates to:
  /// **'Auto refresh time'**
  String get autoRefreshTime;

  /// No description provided for @beginAddConnection.
  ///
  /// In en, this message translates to:
  /// **'First of all, add a connection to a server.'**
  String get beginAddConnection;

  /// No description provided for @between.
  ///
  /// In en, this message translates to:
  /// **'between'**
  String get between;

  /// No description provided for @biometricUnlockNotActivated.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t activate unlock with fingerprint.'**
  String get biometricUnlockNotActivated;

  /// No description provided for @biometricUnlockNotDisabled.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t disable unlock with fingerprint.'**
  String get biometricUnlockNotDisabled;

  /// No description provided for @blacklist.
  ///
  /// In en, this message translates to:
  /// **'Add to blacklist'**
  String get blacklist;

  /// No description provided for @blocked.
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get blocked;

  /// No description provided for @cameraPermission.
  ///
  /// In en, this message translates to:
  /// **'Pi-hole client does not have permission to access the camera.\n\nGo to settings and grant the permission.'**
  String get cameraPermission;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cannotAddDomain.
  ///
  /// In en, this message translates to:
  /// **'Domain couldn\'t be added'**
  String get cannotAddDomain;

  /// No description provided for @cannotChangeUpdateTime.
  ///
  /// In en, this message translates to:
  /// **'Cannot change update time'**
  String get cannotChangeUpdateTime;

  /// No description provided for @cannotCheckUrlSaved.
  ///
  /// In en, this message translates to:
  /// **'Cannot check if this URL is already saved.'**
  String get cannotCheckUrlSaved;

  /// No description provided for @cannotConnect.
  ///
  /// In en, this message translates to:
  /// **'Cannot connect to server.'**
  String get cannotConnect;

  /// No description provided for @cannotUpdateSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings cannot be updated.'**
  String get cannotUpdateSettings;

  /// No description provided for @cantReachServer.
  ///
  /// In en, this message translates to:
  /// **'Can\'t reach the server. Check IP address and port.'**
  String get cantReachServer;

  /// No description provided for @cantSaveConnectionData.
  ///
  /// In en, this message translates to:
  /// **'Connection data couldn\'t be saved'**
  String get cantSaveConnectionData;

  /// No description provided for @cantUpdateLogsPerQuery.
  ///
  /// In en, this message translates to:
  /// **'Logs quantity per request couldn\'t be updated'**
  String get cantUpdateLogsPerQuery;

  /// No description provided for @changeServer.
  ///
  /// In en, this message translates to:
  /// **'Change server'**
  String get changeServer;

  /// No description provided for @changeTheme.
  ///
  /// In en, this message translates to:
  /// **'Change app theme'**
  String get changeTheme;

  /// No description provided for @charts.
  ///
  /// In en, this message translates to:
  /// **'Charts'**
  String get charts;

  /// No description provided for @chartsNotLoaded.
  ///
  /// In en, this message translates to:
  /// **'Charts could not be loaded'**
  String get chartsNotLoaded;

  /// No description provided for @checkAddress.
  ///
  /// In en, this message translates to:
  /// **'Failed. Check address.'**
  String get checkAddress;

  /// No description provided for @checkAll.
  ///
  /// In en, this message translates to:
  /// **'Check all'**
  String get checkAll;

  /// No description provided for @checkingToken.
  ///
  /// In en, this message translates to:
  /// **'Checking token...'**
  String get checkingToken;

  /// No description provided for @clientActivity24.
  ///
  /// In en, this message translates to:
  /// **'Client activity last 24 hours'**
  String get clientActivity24;

  /// No description provided for @clients.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get clients;

  /// No description provided for @clientsSelected.
  ///
  /// In en, this message translates to:
  /// **'clients selected'**
  String get clientsSelected;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get comment;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @connectToServer.
  ///
  /// In en, this message translates to:
  /// **'Connect to server'**
  String get connectToServer;

  /// No description provided for @connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// No description provided for @connectedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Connected to server successfully.'**
  String get connectedSuccessfully;

  /// No description provided for @connectedTo.
  ///
  /// In en, this message translates to:
  /// **'Connected to'**
  String get connectedTo;

  /// No description provided for @connecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get connecting;

  /// No description provided for @connectingTo.
  ///
  /// In en, this message translates to:
  /// **'Connecting to'**
  String get connectingTo;

  /// No description provided for @connectingToServer.
  ///
  /// In en, this message translates to:
  /// **'Connecting to server'**
  String get connectingToServer;

  /// No description provided for @connection.
  ///
  /// In en, this message translates to:
  /// **'Connection'**
  String get connection;

  /// No description provided for @connectionAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'This connection already exists'**
  String get connectionAlreadyExists;

  /// No description provided for @connectionCannotBeRemoved.
  ///
  /// In en, this message translates to:
  /// **'Connection cannot be removed.'**
  String get connectionCannotBeRemoved;

  /// No description provided for @connectionDefaultFailed.
  ///
  /// In en, this message translates to:
  /// **'Connection could not be set as default.'**
  String get connectionDefaultFailed;

  /// No description provided for @connectionDefaultSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Connection set as default successfully.'**
  String get connectionDefaultSuccessfully;

  /// No description provided for @connectionRemoved.
  ///
  /// In en, this message translates to:
  /// **'Connection removed successfully'**
  String get connectionRemoved;

  /// No description provided for @connectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Failed. Connection timeout. Check if server is reachable.'**
  String get connectionTimeout;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @contactDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Contact the developer'**
  String get contactDeveloper;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'Contact by email'**
  String get contactEmail;

  /// No description provided for @copyLogsClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy logs to clipboard'**
  String get copyLogsClipboard;

  /// No description provided for @couldNotConnectServer.
  ///
  /// In en, this message translates to:
  /// **'Could not connect to the server'**
  String get couldNotConnectServer;

  /// No description provided for @couldntAddBlacklist.
  ///
  /// In en, this message translates to:
  /// **'Could not add domain to blacklist.'**
  String get couldntAddBlacklist;

  /// No description provided for @couldntAddWhitelist.
  ///
  /// In en, this message translates to:
  /// **'Could not add domain to whitelist.'**
  String get couldntAddWhitelist;

  /// No description provided for @couldntDisableServer.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t disable server.'**
  String get couldntDisableServer;

  /// No description provided for @couldntEnableServer.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t enable server.'**
  String get couldntEnableServer;

  /// No description provided for @couldntLoadLogs.
  ///
  /// In en, this message translates to:
  /// **'Logs couldn\'t be loaded'**
  String get couldntLoadLogs;

  /// No description provided for @createConnection.
  ///
  /// In en, this message translates to:
  /// **'Create a connection'**
  String get createConnection;

  /// No description provided for @createdBy.
  ///
  /// In en, this message translates to:
  /// **'Created by'**
  String get createdBy;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @customMinutes.
  ///
  /// In en, this message translates to:
  /// **'Custom minutes'**
  String get customMinutes;

  /// No description provided for @customSeconds.
  ///
  /// In en, this message translates to:
  /// **'Custom seconds'**
  String get customSeconds;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @dateAdded.
  ///
  /// In en, this message translates to:
  /// **'Date added'**
  String get dateAdded;

  /// No description provided for @dateModified.
  ///
  /// In en, this message translates to:
  /// **'Date modified'**
  String get dateModified;

  /// No description provided for @dbNotWorking.
  ///
  /// In en, this message translates to:
  /// **'Database is not working. Reinstall the application.'**
  String get dbNotWorking;

  /// No description provided for @defaultConnection.
  ///
  /// In en, this message translates to:
  /// **'Default connection'**
  String get defaultConnection;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteDomain.
  ///
  /// In en, this message translates to:
  /// **'Delete domain'**
  String get deleteDomain;

  /// No description provided for @deleteDomainMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this domain?'**
  String get deleteDomainMessage;

  /// No description provided for @deleting.
  ///
  /// In en, this message translates to:
  /// **'Deleting...'**
  String get deleting;

  /// No description provided for @device.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get device;

  /// No description provided for @disable.
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;

  /// No description provided for @disabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// No description provided for @disablingServer.
  ///
  /// In en, this message translates to:
  /// **'Disabling server...'**
  String get disablingServer;

  /// No description provided for @domain.
  ///
  /// In en, this message translates to:
  /// **'Domain'**
  String get domain;

  /// No description provided for @domainAdded.
  ///
  /// In en, this message translates to:
  /// **'Domain added successfully'**
  String get domainAdded;

  /// No description provided for @domainAlreadyAdded.
  ///
  /// In en, this message translates to:
  /// **'Domain already added'**
  String get domainAlreadyAdded;

  /// No description provided for @domainDetails.
  ///
  /// In en, this message translates to:
  /// **'Domain details'**
  String get domainDetails;

  /// No description provided for @domainNotExists.
  ///
  /// In en, this message translates to:
  /// **'Domain does not exist'**
  String get domainNotExists;

  /// No description provided for @domainRemoved.
  ///
  /// In en, this message translates to:
  /// **'Domain removed successfully'**
  String get domainRemoved;

  /// No description provided for @domains.
  ///
  /// In en, this message translates to:
  /// **'Domains'**
  String get domains;

  /// No description provided for @domainsAdlists.
  ///
  /// In en, this message translates to:
  /// **'Domains on Adlists'**
  String get domainsAdlists;

  /// No description provided for @domainsClientsDataMode.
  ///
  /// In en, this message translates to:
  /// **'Statistics display mode'**
  String get domainsClientsDataMode;

  /// No description provided for @domainsClientsDataModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Changes the way that domains and clients data is displayed'**
  String get domainsClientsDataModeDescription;

  /// No description provided for @domainsNotLoaded.
  ///
  /// In en, this message translates to:
  /// **'Domains list couldn\'t be loaded'**
  String get domainsNotLoaded;

  /// No description provided for @dontCheckCertificate.
  ///
  /// In en, this message translates to:
  /// **'Don\'t check SSL certificate'**
  String get dontCheckCertificate;

  /// No description provided for @dontCheckCertificateDescription.
  ///
  /// In en, this message translates to:
  /// **'Overrides the server\'s SSL certificate validation'**
  String get dontCheckCertificateDescription;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @editConnection.
  ///
  /// In en, this message translates to:
  /// **'Edit a Connection'**
  String get editConnection;

  /// No description provided for @editServer.
  ///
  /// In en, this message translates to:
  /// **'Edit server connection'**
  String get editServer;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @enableCrashReport.
  ///
  /// In en, this message translates to:
  /// **'Enable Crash Reporting'**
  String get enableCrashReport;

  /// No description provided for @enableCrashReportDetail.
  ///
  /// In en, this message translates to:
  /// **'Automatically send anonymized reports to diagnose issues.'**
  String get enableCrashReportDetail;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @enablingServer.
  ///
  /// In en, this message translates to:
  /// **'Enabling server...'**
  String get enablingServer;

  /// No description provided for @endTimeNotAfterStartTime.
  ///
  /// In en, this message translates to:
  /// **'End time is not after start time'**
  String get endTimeNotAfterStartTime;

  /// No description provided for @enterCodeUnlock.
  ///
  /// In en, this message translates to:
  /// **'Enter code to unlock'**
  String get enterCodeUnlock;

  /// No description provided for @enterPasscode.
  ///
  /// In en, this message translates to:
  /// **'Enter passcode'**
  String get enterPasscode;

  /// No description provided for @eraseAll.
  ///
  /// In en, this message translates to:
  /// **'ERASE ALL'**
  String get eraseAll;

  /// No description provided for @eraseAppData.
  ///
  /// In en, this message translates to:
  /// **'Erase app data'**
  String get eraseAppData;

  /// No description provided for @eraseWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning! This action will reset the application and remove all its data.\n\nAre you sure you want to continue?'**
  String get eraseWarning;

  /// No description provided for @erasesAppData.
  ///
  /// In en, this message translates to:
  /// **'Erases all application data'**
  String get erasesAppData;

  /// No description provided for @errorRemovingDomain.
  ///
  /// In en, this message translates to:
  /// **'Error when removing domain'**
  String get errorRemovingDomain;

  /// No description provided for @errorsApp.
  ///
  /// In en, this message translates to:
  /// **'Errors registered by the app'**
  String get errorsApp;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @fingerprintAuthUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint authentication unavailable.'**
  String get fingerprintAuthUnavailable;

  /// No description provided for @fingerprintAuthUnavailableAttempts.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint authentication unavailable due to many failed attempts.'**
  String get fingerprintAuthUnavailableAttempts;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @fromLast.
  ///
  /// In en, this message translates to:
  /// **'from last'**
  String get fromLast;

  /// No description provided for @fromLatestToOldest.
  ///
  /// In en, this message translates to:
  /// **'From latest to oldest'**
  String get fromLatestToOldest;

  /// No description provided for @fromOldestToLatest.
  ///
  /// In en, this message translates to:
  /// **'From oldest to latest'**
  String get fromOldestToLatest;

  /// No description provided for @fromTime.
  ///
  /// In en, this message translates to:
  /// **'From time'**
  String get fromTime;

  /// No description provided for @gettingPermission.
  ///
  /// In en, this message translates to:
  /// **'Getting permission...'**
  String get gettingPermission;

  /// No description provided for @gettingStarted.
  ///
  /// In en, this message translates to:
  /// **'Getting Started'**
  String get gettingStarted;

  /// No description provided for @gitHub.
  ///
  /// In en, this message translates to:
  /// **'App code available on GitHub'**
  String get gitHub;

  /// No description provided for @helpUsImprove.
  ///
  /// In en, this message translates to:
  /// **'Help Us Improve'**
  String get helpUsImprove;

  /// No description provided for @helpUsImproveMessage.
  ///
  /// In en, this message translates to:
  /// **'To improve app quality, we may collect anonymous crash reports when an issue occurs.\nThese reports do not contain any personally identifiable information. '**
  String get helpUsImproveMessage;

  /// No description provided for @hideZeroValues.
  ///
  /// In en, this message translates to:
  /// **'Hide zero values'**
  String get hideZeroValues;

  /// No description provided for @hideZeroValuesDescription.
  ///
  /// In en, this message translates to:
  /// **'Hides zero values from clients chart'**
  String get hideZeroValuesDescription;

  /// No description provided for @hits.
  ///
  /// In en, this message translates to:
  /// **'Hits:'**
  String get hits;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @hour1.
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get hour1;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hours;

  /// No description provided for @hours2.
  ///
  /// In en, this message translates to:
  /// **'2 hours'**
  String get hours2;

  /// No description provided for @hours4.
  ///
  /// In en, this message translates to:
  /// **'4 hours'**
  String get hours4;

  /// No description provided for @hours6.
  ///
  /// In en, this message translates to:
  /// **'6 hours'**
  String get hours6;

  /// No description provided for @hours8.
  ///
  /// In en, this message translates to:
  /// **'8 hours'**
  String get hours8;

  /// No description provided for @howCreateConnection.
  ///
  /// In en, this message translates to:
  /// **'How to create a connection'**
  String get howCreateConnection;

  /// No description provided for @howToContact.
  ///
  /// In en, this message translates to:
  /// **'You can contact me by opening an issue on the GitHub repository or by email. All the details about how to contact are in Settings > Contact.'**
  String get howToContact;

  /// No description provided for @importantAnnouncement.
  ///
  /// In en, this message translates to:
  /// **'Important announcement'**
  String get importantAnnouncement;

  /// No description provided for @importantInformation.
  ///
  /// In en, this message translates to:
  /// **'Important information'**
  String get importantInformation;

  /// No description provided for @indefinitely.
  ///
  /// In en, this message translates to:
  /// **'Indefinitely'**
  String get indefinitely;

  /// No description provided for @invalidAddress.
  ///
  /// In en, this message translates to:
  /// **'Invalid IP or domain'**
  String get invalidAddress;

  /// No description provided for @invalidDomain.
  ///
  /// In en, this message translates to:
  /// **'Invalid domain'**
  String get invalidDomain;

  /// No description provided for @invalidPort.
  ///
  /// In en, this message translates to:
  /// **'Invalid port'**
  String get invalidPort;

  /// No description provided for @invalidSubroute.
  ///
  /// In en, this message translates to:
  /// **'Invalid subroute. Remember not to finish with a \'/\', \'.\' or \':\'.'**
  String get invalidSubroute;

  /// No description provided for @ipCannotEmpty.
  ///
  /// In en, this message translates to:
  /// **'IP field cannot be empty'**
  String get ipCannotEmpty;

  /// No description provided for @issuesSuggestions.
  ///
  /// In en, this message translates to:
  /// **'If you are experiencing issues or you have suggestions'**
  String get issuesSuggestions;

  /// No description provided for @itemsSelected.
  ///
  /// In en, this message translates to:
  /// **'items selected'**
  String get itemsSelected;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @legal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legal;

  /// No description provided for @legalInfo.
  ///
  /// In en, this message translates to:
  /// **'Legal information'**
  String get legalInfo;

  /// No description provided for @legalText.
  ///
  /// In en, this message translates to:
  /// **'All registered trademarks which are present on this application are property of it\'s respective owners.'**
  String get legalText;

  /// No description provided for @letMeKnow.
  ///
  /// In en, this message translates to:
  /// **'Sometimes the Pi-hole team makes some changes to the API used by this app to get all the data. If you are experiencing connection issues or data not loading, and you are sure that your server is working fine, please let me know it to investigate it and release an update as soon as possible.'**
  String get letMeKnow;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licenses;

  /// No description provided for @licensesInfo.
  ///
  /// In en, this message translates to:
  /// **'OSS Information'**
  String get licensesInfo;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @list.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get list;

  /// No description provided for @listDescription.
  ///
  /// In en, this message translates to:
  /// **'Displays the data on a list with the label and the numeric value at the left side, and a bar at the right side.'**
  String get listDescription;

  /// No description provided for @loadingCharts.
  ///
  /// In en, this message translates to:
  /// **'Loading charts...'**
  String get loadingCharts;

  /// No description provided for @loadingList.
  ///
  /// In en, this message translates to:
  /// **'Loading list...'**
  String get loadingList;

  /// No description provided for @loadingLogs.
  ///
  /// In en, this message translates to:
  /// **'Loading logs...'**
  String get loadingLogs;

  /// No description provided for @loadingStats.
  ///
  /// In en, this message translates to:
  /// **'Loading stats...'**
  String get loadingStats;

  /// No description provided for @logDetails.
  ///
  /// In en, this message translates to:
  /// **'Log details'**
  String get logDetails;

  /// No description provided for @logs.
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get logs;

  /// No description provided for @logsCopiedClipboard.
  ///
  /// In en, this message translates to:
  /// **'Logs copied to clipboard'**
  String get logsCopiedClipboard;

  /// No description provided for @logsPerQueryLabel.
  ///
  /// In en, this message translates to:
  /// **'Select the time interval to be used for each log request to the API.'**
  String get logsPerQueryLabel;

  /// No description provided for @logsPerQueryUpdated.
  ///
  /// In en, this message translates to:
  /// **'Logs quantity per request updated successfully'**
  String get logsPerQueryUpdated;

  /// No description provided for @logsPerQueryWarning.
  ///
  /// In en, this message translates to:
  /// **'Selecting a long time could result on slow load times.\nIt will depend on the speed of the server.'**
  String get logsPerQueryWarning;

  /// No description provided for @logsQuantityPerLoad.
  ///
  /// In en, this message translates to:
  /// **'Logs quantity per request'**
  String get logsQuantityPerLoad;

  /// No description provided for @logsStatus.
  ///
  /// In en, this message translates to:
  /// **'Logs status'**
  String get logsStatus;

  /// No description provided for @logsWillBeRequested.
  ///
  /// In en, this message translates to:
  /// **'Logs will be requested in groups of'**
  String get logsWillBeRequested;

  /// No description provided for @minute1.
  ///
  /// In en, this message translates to:
  /// **'1 minute'**
  String get minute1;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @minutes2.
  ///
  /// In en, this message translates to:
  /// **'2 minutes'**
  String get minutes2;

  /// No description provided for @minutes30.
  ///
  /// In en, this message translates to:
  /// **'30 minutes'**
  String get minutes30;

  /// No description provided for @minutes5.
  ///
  /// In en, this message translates to:
  /// **'5 minutes'**
  String get minutes5;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @noAvailableBiometrics.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any fingerprints saved on the device.'**
  String get noAvailableBiometrics;

  /// No description provided for @noComment.
  ///
  /// In en, this message translates to:
  /// **'No comment'**
  String get noComment;

  /// No description provided for @noConnection.
  ///
  /// In en, this message translates to:
  /// **'No connection'**
  String get noConnection;

  /// No description provided for @noConnections.
  ///
  /// In en, this message translates to:
  /// **'Seems that you don\'t have added any connection yet.'**
  String get noConnections;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @noDomains.
  ///
  /// In en, this message translates to:
  /// **'There are no domains to show here.'**
  String get noDomains;

  /// No description provided for @noItemsSelected.
  ///
  /// In en, this message translates to:
  /// **'No items selected'**
  String get noItemsSelected;

  /// No description provided for @noLogsDisplay.
  ///
  /// In en, this message translates to:
  /// **'No logs to display here'**
  String get noLogsDisplay;

  /// No description provided for @noSavedConnections.
  ///
  /// In en, this message translates to:
  /// **'No saved connections'**
  String get noSavedConnections;

  /// No description provided for @noSavedLogs.
  ///
  /// In en, this message translates to:
  /// **'No saved logs'**
  String get noSavedLogs;

  /// No description provided for @noServerSelected.
  ///
  /// In en, this message translates to:
  /// **'No server is selected'**
  String get noServerSelected;

  /// No description provided for @notBlocked.
  ///
  /// In en, this message translates to:
  /// **'Not blocked'**
  String get notBlocked;

  /// No description provided for @notConnectServer.
  ///
  /// In en, this message translates to:
  /// **'Could not connect to the server'**
  String get notConnectServer;

  /// No description provided for @notConnected.
  ///
  /// In en, this message translates to:
  /// **'Not connected'**
  String get notConnected;

  /// No description provided for @notSelected.
  ///
  /// In en, this message translates to:
  /// **'Not selected'**
  String get notSelected;

  /// No description provided for @noticeError.
  ///
  /// In en, this message translates to:
  /// **'ERROR'**
  String get noticeError;

  /// No description provided for @noticeErrorDetail.
  ///
  /// In en, this message translates to:
  /// **'The NOTICE file could not be found.'**
  String get noticeErrorDetail;

  /// No description provided for @now.
  ///
  /// In en, this message translates to:
  /// **'now'**
  String get now;

  /// No description provided for @olderVersion.
  ///
  /// In en, this message translates to:
  /// **'If you have an older version, please update your Pi-hole to continue using this app.'**
  String get olderVersion;

  /// No description provided for @openExternalUrl.
  ///
  /// In en, this message translates to:
  /// **'Opens an external link'**
  String get openExternalUrl;

  /// No description provided for @openIssueGitHub.
  ///
  /// In en, this message translates to:
  /// **'Open an issue on GitHub'**
  String get openIssueGitHub;

  /// No description provided for @openWebPanel.
  ///
  /// In en, this message translates to:
  /// **'Open web panel'**
  String get openWebPanel;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get others;

  /// No description provided for @passCodeNotSaved.
  ///
  /// In en, this message translates to:
  /// **'Passcode couldn\'t be saved.'**
  String get passCodeNotSaved;

  /// No description provided for @passcodesDontMatch.
  ///
  /// In en, this message translates to:
  /// **'Initial passcode and repeated passcode do not match.'**
  String get passcodesDontMatch;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordNotValid.
  ///
  /// In en, this message translates to:
  /// **'Failed. Password not valid.'**
  String get passwordNotValid;

  /// No description provided for @percentageBlocked.
  ///
  /// In en, this message translates to:
  /// **'Percentage blocked'**
  String get percentageBlocked;

  /// No description provided for @performance.
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get performance;

  /// No description provided for @piHoleServers.
  ///
  /// In en, this message translates to:
  /// **'Servers connections'**
  String get piHoleServers;

  /// No description provided for @pieChart.
  ///
  /// In en, this message translates to:
  /// **'Pie chart'**
  String get pieChart;

  /// No description provided for @pieChartDescription.
  ///
  /// In en, this message translates to:
  /// **'Displays the data on a pie chart with the legend under it.'**
  String get pieChartDescription;

  /// No description provided for @port.
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get port;

  /// No description provided for @portCannotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Port field cannot be empty'**
  String get portCannotEmpty;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @privacyInfo.
  ///
  /// In en, this message translates to:
  /// **'Privacy and Data Management'**
  String get privacyInfo;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicyDescription.
  ///
  /// In en, this message translates to:
  /// **'View Privacy Policy'**
  String get privacyPolicyDescription;

  /// No description provided for @qrScanner.
  ///
  /// In en, this message translates to:
  /// **'QR scanner'**
  String get qrScanner;

  /// No description provided for @queriesBlocked.
  ///
  /// In en, this message translates to:
  /// **'Queries blocked'**
  String get queriesBlocked;

  /// No description provided for @queriesServers.
  ///
  /// In en, this message translates to:
  /// **'Queries & servers'**
  String get queriesServers;

  /// No description provided for @queryLogs.
  ///
  /// In en, this message translates to:
  /// **'Query logs'**
  String get queryLogs;

  /// No description provided for @queryTypes.
  ///
  /// In en, this message translates to:
  /// **'Query types'**
  String get queryTypes;

  /// No description provided for @readIssues.
  ///
  /// In en, this message translates to:
  /// **'Read this if you are experimenting issues'**
  String get readIssues;

  /// No description provided for @reducedDataCharts.
  ///
  /// In en, this message translates to:
  /// **'Use reduced data'**
  String get reducedDataCharts;

  /// No description provided for @reducedDataChartsDescription.
  ///
  /// In en, this message translates to:
  /// **'Affects the clients chart at Home. Can improve application performance'**
  String get reducedDataChartsDescription;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @refreshingData.
  ///
  /// In en, this message translates to:
  /// **'Refreshing data...'**
  String get refreshingData;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @removePasscode.
  ///
  /// In en, this message translates to:
  /// **'Remove passcode'**
  String get removePasscode;

  /// No description provided for @removeWarning.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove the connection with this PiHole server?'**
  String get removeWarning;

  /// No description provided for @repeatPasscode.
  ///
  /// In en, this message translates to:
  /// **'Repeat passcode'**
  String get repeatPasscode;

  /// No description provided for @reply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests:'**
  String get requests;

  /// No description provided for @requiredVersions.
  ///
  /// In en, this message translates to:
  /// **'Required versions:'**
  String get requiredVersions;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @resetApplication.
  ///
  /// In en, this message translates to:
  /// **'Reset application'**
  String get resetApplication;

  /// No description provided for @restartAppTakeEffect.
  ///
  /// In en, this message translates to:
  /// **'Please restart the application to apply the settings.'**
  String get restartAppTakeEffect;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// No description provided for @scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan the QR code'**
  String get scanQrCode;

  /// No description provided for @searchDomainInternet.
  ///
  /// In en, this message translates to:
  /// **'Search domain on the Internet'**
  String get searchDomainInternet;

  /// No description provided for @searchDomains.
  ///
  /// In en, this message translates to:
  /// **'Search domains...'**
  String get searchDomains;

  /// No description provided for @searchUrl.
  ///
  /// In en, this message translates to:
  /// **'Search by URL...'**
  String get searchUrl;

  /// No description provided for @second1.
  ///
  /// In en, this message translates to:
  /// **'1 second'**
  String get second1;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'Seconds'**
  String get seconds;

  /// No description provided for @seconds10.
  ///
  /// In en, this message translates to:
  /// **'10 seconds'**
  String get seconds10;

  /// No description provided for @seconds2.
  ///
  /// In en, this message translates to:
  /// **'2 seconds'**
  String get seconds2;

  /// No description provided for @seconds30.
  ///
  /// In en, this message translates to:
  /// **'30 seconds'**
  String get seconds30;

  /// No description provided for @seconds5.
  ///
  /// In en, this message translates to:
  /// **'5 seconds'**
  String get seconds5;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @selectConnection.
  ///
  /// In en, this message translates to:
  /// **'Select a connection'**
  String get selectConnection;

  /// No description provided for @selectDomainsLeftColumn.
  ///
  /// In en, this message translates to:
  /// **'Choose a domain to see its details.'**
  String get selectDomainsLeftColumn;

  /// No description provided for @selectEndTime.
  ///
  /// In en, this message translates to:
  /// **'Select end time'**
  String get selectEndTime;

  /// No description provided for @selectLogsLeftColumn.
  ///
  /// In en, this message translates to:
  /// **'Choose a query log to see its details.'**
  String get selectLogsLeftColumn;

  /// No description provided for @selectOptionLeftColumn.
  ///
  /// In en, this message translates to:
  /// **'Select an option from the left column.'**
  String get selectOptionLeftColumn;

  /// No description provided for @selectServer.
  ///
  /// In en, this message translates to:
  /// **'Select server'**
  String get selectServer;

  /// No description provided for @selectStartTime.
  ///
  /// In en, this message translates to:
  /// **'Select start time'**
  String get selectStartTime;

  /// No description provided for @selectedDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Selected but disconnected'**
  String get selectedDisconnected;

  /// No description provided for @sendCrashReport.
  ///
  /// In en, this message translates to:
  /// **'Send Crash Report'**
  String get sendCrashReport;

  /// No description provided for @serverAddress.
  ///
  /// In en, this message translates to:
  /// **'Server address'**
  String get serverAddress;

  /// No description provided for @serverConnectionGuide.
  ///
  /// In en, this message translates to:
  /// **'Server Connection Guide'**
  String get serverConnectionGuide;

  /// No description provided for @serverConnectionGuideDescription.
  ///
  /// In en, this message translates to:
  /// **'Learn how to connect to the server.'**
  String get serverConnectionGuideDescription;

  /// No description provided for @serverDisabled.
  ///
  /// In en, this message translates to:
  /// **'Server disabled successfully.'**
  String get serverDisabled;

  /// No description provided for @serverEnabled.
  ///
  /// In en, this message translates to:
  /// **'Server enabled successfully.'**
  String get serverEnabled;

  /// No description provided for @serverInvalidData.
  ///
  /// In en, this message translates to:
  /// **'Server connection saved with invalid data. Add the connection again.'**
  String get serverInvalidData;

  /// No description provided for @serverName.
  ///
  /// In en, this message translates to:
  /// **'Server name'**
  String get serverName;

  /// No description provided for @servers.
  ///
  /// In en, this message translates to:
  /// **'Servers'**
  String get servers;

  /// No description provided for @setDefault.
  ///
  /// In en, this message translates to:
  /// **'Set as default connection'**
  String get setDefault;

  /// No description provided for @setPassCode.
  ///
  /// In en, this message translates to:
  /// **'Setup passcode'**
  String get setPassCode;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @settingsUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Settings updated successfully.'**
  String get settingsUpdatedSuccessfully;

  /// No description provided for @sslErrorLong.
  ///
  /// In en, this message translates to:
  /// **'SSL error. Check if the server\'s certificate is valid.'**
  String get sslErrorLong;

  /// No description provided for @sslErrorShort.
  ///
  /// In en, this message translates to:
  /// **'SSL error.'**
  String get sslErrorShort;

  /// No description provided for @startTimeNotBeforeEndTime.
  ///
  /// In en, this message translates to:
  /// **'Start time is not before end time'**
  String get startTimeNotBeforeEndTime;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @statsNotLoaded.
  ///
  /// In en, this message translates to:
  /// **'Stats could not be loaded'**
  String get statsNotLoaded;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @statusDisabled.
  ///
  /// In en, this message translates to:
  /// **'Status: disabled'**
  String get statusDisabled;

  /// No description provided for @statusEnabled.
  ///
  /// In en, this message translates to:
  /// **'Status: enabled'**
  String get statusEnabled;

  /// No description provided for @statusSelected.
  ///
  /// In en, this message translates to:
  /// **'status selected'**
  String get statusSelected;

  /// No description provided for @subrouteExample.
  ///
  /// In en, this message translates to:
  /// **'Example: /pihole'**
  String get subrouteExample;

  /// No description provided for @subrouteField.
  ///
  /// In en, this message translates to:
  /// **'Subroute'**
  String get subrouteField;

  /// No description provided for @subrouteHelper.
  ///
  /// In en, this message translates to:
  /// **'To be used with a reverse proxy'**
  String get subrouteHelper;

  /// No description provided for @supportFeedback.
  ///
  /// In en, this message translates to:
  /// **'Support and Feedback'**
  String get supportFeedback;

  /// No description provided for @supportForm.
  ///
  /// In en, this message translates to:
  /// **'Support form'**
  String get supportForm;

  /// No description provided for @supportFormDescription.
  ///
  /// In en, this message translates to:
  /// **'Send a support request using the support form.'**
  String get supportFormDescription;

  /// No description provided for @switchServer.
  ///
  /// In en, this message translates to:
  /// **'Switch server'**
  String get switchServer;

  /// No description provided for @systemLanguage.
  ///
  /// In en, this message translates to:
  /// **'System Language'**
  String get systemLanguage;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System theme'**
  String get systemTheme;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @toTime.
  ///
  /// In en, this message translates to:
  /// **'To time'**
  String get toTime;

  /// No description provided for @token.
  ///
  /// In en, this message translates to:
  /// **'Token'**
  String get token;

  /// No description provided for @tokenInstructions.
  ///
  /// In en, this message translates to:
  /// **'You can get it on the web interface on Settings > API/Web interface > Show API token.'**
  String get tokenInstructions;

  /// No description provided for @tokenNeeded.
  ///
  /// In en, this message translates to:
  /// **'Token needed'**
  String get tokenNeeded;

  /// No description provided for @tokenNotValid.
  ///
  /// In en, this message translates to:
  /// **'Token not valid'**
  String get tokenNotValid;

  /// No description provided for @topBlockedDomains.
  ///
  /// In en, this message translates to:
  /// **'Top blocked domains'**
  String get topBlockedDomains;

  /// No description provided for @topClients.
  ///
  /// In en, this message translates to:
  /// **'Top clients (total)'**
  String get topClients;

  /// No description provided for @topClientsBlocked.
  ///
  /// In en, this message translates to:
  /// **'Top clients (blocked only)'**
  String get topClientsBlocked;

  /// No description provided for @topPermittedDomains.
  ///
  /// In en, this message translates to:
  /// **'Top permitted domains'**
  String get topPermittedDomains;

  /// No description provided for @totalQueries.
  ///
  /// In en, this message translates to:
  /// **'Total queries'**
  String get totalQueries;

  /// No description provided for @totalQueries24.
  ///
  /// In en, this message translates to:
  /// **'Total queries last 24 hours'**
  String get totalQueries24;

  /// No description provided for @tryReconnect.
  ///
  /// In en, this message translates to:
  /// **'Try reconnect'**
  String get tryReconnect;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @uncheckAll.
  ///
  /// In en, this message translates to:
  /// **'Uncheck all'**
  String get uncheckAll;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Failed. Unknown error.'**
  String get unknownError;

  /// No description provided for @unlockFingerprint.
  ///
  /// In en, this message translates to:
  /// **'Unlock with fingerprint'**
  String get unlockFingerprint;

  /// No description provided for @unlockWithFingerprint.
  ///
  /// In en, this message translates to:
  /// **'Unlock the app with your fingerprint'**
  String get unlockWithFingerprint;

  /// No description provided for @updatePasscode.
  ///
  /// In en, this message translates to:
  /// **'Update passcode'**
  String get updatePasscode;

  /// No description provided for @updateTimeChanged.
  ///
  /// In en, this message translates to:
  /// **'Update time changed successfully.'**
  String get updateTimeChanged;

  /// No description provided for @upstreamServers.
  ///
  /// In en, this message translates to:
  /// **'Upstream servers'**
  String get upstreamServers;

  /// No description provided for @url.
  ///
  /// In en, this message translates to:
  /// **'URL'**
  String get url;

  /// No description provided for @useFingerprint.
  ///
  /// In en, this message translates to:
  /// **'Use fingerprint'**
  String get useFingerprint;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @valueNotValid.
  ///
  /// In en, this message translates to:
  /// **'Value not valid'**
  String get valueNotValid;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @versionDescription.
  ///
  /// In en, this message translates to:
  /// **'Select the version of Pi-hole you are using'**
  String get versionDescription;

  /// No description provided for @versionRequirements.
  ///
  /// In en, this message translates to:
  /// **'Version Requirements'**
  String get versionRequirements;

  /// No description provided for @visitGooglePlay.
  ///
  /// In en, this message translates to:
  /// **'Visit Google Play page'**
  String get visitGooglePlay;

  /// No description provided for @welcomeToApp.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the App'**
  String get welcomeToApp;

  /// No description provided for @whitelist.
  ///
  /// In en, this message translates to:
  /// **'Add to whitelist'**
  String get whitelist;

  /// No description provided for @writeEmail.
  ///
  /// In en, this message translates to:
  /// **'Write me by email.'**
  String get writeEmail;

  /// No description provided for @writeEmailDetails.
  ///
  /// In en, this message translates to:
  /// **'Include on the body of the email all the possible details: Pi-hole and web interface version, how to reproduce the issue, screenshots...\n\nAll provided information will be very welcome.'**
  String get writeEmailDetails;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'ja', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'ja': return AppLocalizationsJa();
    case 'pl': return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
