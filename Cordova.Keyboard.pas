unit Cordova.Keyboard;

interface

uses
  W3C.HTML5, W3C.DOM4;

type
  JKeyboard = class external 'Keyboard'
  public
    isVisible: Boolean;
    automaticScrollToTopOnHiding: Boolean;
    procedure shrinkView(Value: Boolean);
    procedure hideFormAccessoryBar(Value: Boolean);
    procedure disableScrollingInShrinkView(Value: Boolean);
    procedure hide;
    procedure show;
  end;
  
var Keyboard external 'Keyboard': JKeyboard;

implementation

end.