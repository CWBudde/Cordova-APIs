unit Cordova.InjectCookie;

type
  JWkWebView = partial class external 'wkWebView'
    procedure injectCookie(const Url: String);
    procedure setCookie(const Url, Name, Value: String);
  end;

var WkWebView external 'wkWebView': JWkWebView;
