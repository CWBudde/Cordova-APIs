unit Cordova.AdvancedHttp;

interface

type
  JSendRequestResponseHeaders = class external
    contentLength: String; external 'content-length';
  end;

  JSendRequestResponse = class external
    status: Integer;
    data: string;
    url: String;
    headers: Variant;
  end;

  JSendRequestErrorResponse = class external
    error: Variant;
  end;

  TSendRequestSuccess = procedure(Response: JSendRequestResponse);
  TSendRequestFailure = procedure(Response: JSendRequestErrorResponse);

  TDataSerializer = String;
  TDataSerializerHelper = strict helper for TDataSerializer
    const urlencoded = 'urlencoded';
    const json = 'json';
    const utf8 = 'utf8';
  end;
  
  JSendRequestOptions = class external
    &method: String;
    data: Variant;
    params: String;
    serializer: TDataSerializer;
    timeout: Float;
    headers: Variant;
    filePath: String;
    name: String; 
  end;
  
  JHttp = class external 'cordova.plugin.http'
    procedure getBasicAuthHeader(Username, Password: String);
    procedure useBasicAuth(Username, Password: String);
    procedure setHeader(Hostname, Header, Value: String); overload;
    procedure setHeader(Header, Value: String); overload;
    procedure setDataSerializer(DataSerializer: TDataSerializer);
    procedure setRequestTimeout(Value: Float);
    function getCookieString(Url: String): String;
    procedure setCookie(Url, Cookie, Options: String);
    procedure clearCookies;
    
    procedure enableSSLPinning(Value: Boolean; Success, Error: procedure);
    procedure acceptAllCerts(Value: Boolean; Success, Error: procedure);
    procedure disableRedirect(Value: Boolean; Success, Error: procedure);
    procedure removeCookies(Url: String; Callback: procedure);
    procedure sendRequest(Url: String; Options: JSendRequestOptions;
      Success: TSendRequestSuccess; Failure: TSendRequestFailure);
    procedure post(Url: String; Data: Variant;
      Success: TSendRequestSuccess; Failure: TSendRequestFailure); overload;
    procedure post(Url: String; Data: Variant; Options: JSendRequestOptions;
      Success: TSendRequestSuccess; Failure: TSendRequestFailure); overload;
  end;

  JCordovaPlugin = class external 'cordova.plugin'
    http: JHttp;
  end;

var Http external 'cordova.plugin.http': JHttp;
var CordovaPlugin external 'cordova.plugin': JCordovaPlugin;
