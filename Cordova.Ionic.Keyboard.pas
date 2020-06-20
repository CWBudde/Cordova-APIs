unit Cordova.Ionic.Keyboard;

interface

uses
  W3C.HTML5, W3C.DOM4;

type
  JIonicKeyboard = class external 'Keyboard'
  public
    isVisible: Boolean;
    procedure hide;
    procedure show;
    procedure hideFormAccessoryBar(Value: Boolean);
    procedure disableScroll(Value: Boolean);
    procedure setResizeMode(Value: String);
    procedure setKeyboardStyle(Value: Boolean);
  end;
  
var Keyboard external 'Keyboard': JIonicKeyboard;

implementation

end.