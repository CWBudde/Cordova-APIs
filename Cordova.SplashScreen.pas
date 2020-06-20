unit Cordova.SplashScreen;

interface

uses
  W3C.HTML5, W3C.DOM4;

type
  JSplashScreen = class external 'StatusBar'
  public
    procedure hide;
    procedure show;
  end;
  
var SplashScreen external 'navigator.splashscreen': JSplashScreen;

implementation

end.