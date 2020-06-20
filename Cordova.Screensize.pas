unit Cordova.Screensize;

interface

uses
  W3C.HTML5, W3C.DOM4;

type
  JScreenSizeResult = class external
    width: Integer;
    height: Integer;
    xdpi: Integer;
    ydpi: Integer;
    diameter: Float;
    densityValue: Float;
    densityBucket: String;
  end;
  
  TSuccessCallback = procedure(Result: JScreenSizeResult);
  TErrorCallback = procedure;

  JScreensize = class external 'Screensize'
  public
    procedure get(successCallback: TSuccessCallback; errorCallback: TErrorCallback);
  end;
  
var Screensize external 'window.plugins.screensize': JScreensize;

implementation

end.