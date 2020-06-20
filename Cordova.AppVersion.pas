unit Cordova.AppVersion;

type
  JAppVersion = class external 'getAppVersion'
    procedure getAppName(Callback: procedure (AppName: String));
    procedure getPackageName(Callback: procedure (PackageName: String));
    procedure getVersionCode(Callback: procedure (VersionCode: String));
    procedure getVersionNumber(Callback: procedure (VersionNumber: String));
  end; 

var AppVersion external 'cordova.getAppVersion': JAppVersion;
