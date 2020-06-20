unit Cordova.CookieSync;

type
  JCookieSync = class external 'wkwebview.cookiesync'
    procedure sync;
  end;

var WkWebView external 'Wkwebview': JCookieSync;
