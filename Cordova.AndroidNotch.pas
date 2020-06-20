unit Cordova.AndroidNotch;

type
  JAndroidNotch = class external 'AndroidNotch'
    procedure hasCutout(Callback: procedure (cutout: Boolean)); overload;
    procedure hasCutout(Callback: procedure (cutout: Boolean); Error: procedure); overload;
    procedure getInsetTop(Callback: procedure (insetSize: Float)); overload;
    procedure getInsetTop(Callback: procedure (insetSize: Float); Error: procedure); overload;
    procedure getInsetRight(Callback: procedure (insetSize: Float)); overload;
    procedure getInsetRight(Callback: procedure (insetSize: Float); Error: procedure); overload;
    procedure getInsetBottom(Callback: procedure (insetSize: Float)); overload;
    procedure getInsetBottom(Callback: procedure (insetSize: Float); Error: procedure); overload;
    procedure getInsetLeft(Callback: procedure (insetSize: Float)); overload;
    procedure getInsetLeft(Callback: procedure (insetSize: Float); Error: procedure); overload;
(*
    procedure setLayout; overload;
    procedure setLayout(Success: procedure); overload;
    procedure setLayout(Success, Error: procedure); overload;
*)
  end;

var AndroidNotch external 'window.AndroidNotch': JAndroidNotch;
