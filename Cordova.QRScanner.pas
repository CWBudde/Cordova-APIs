unit Cordova.QRScanner;

interface

uses
  W3C.HTML5, W3C.DOM4;

type
  JQRScannerStatus = class external
    authorized: Boolean;
    denied: Boolean;
    restricted: Boolean;
    prepared: Boolean;
    scanning: Boolean;
    previewing: Boolean;
    showing: Boolean;
    lightEnabled: Boolean;
    canOpenSettings: Boolean;
    canEnableLight: Boolean;
    canChangeCamera: Boolean;
    currentCamera: Integer;
  end;

  JQRScannerError = class external
    const UNEXPECTED_ERROR = 0;
    const CAMERA_ACCESS_DENIED = 1;
    const CAMERA_ACCESS_RESTRICTED = 2;
    const BACK_CAMERA_UNAVAILABLE = 3;
    const FRONT_CAMERA_UNAVAILABLE = 4;
    const CAMERA_UNAVAILABLE = 5;
    const SCAN_CANCELED = 6;
    const LIGHT_UNAVAILABLE = 7;
    const OPEN_SETTINGS_UNAVAILABLE = 8;

    name: String;
    code: Integer;
    _message: String;
  end;

  TDoneCallback = procedure(const Error: JQRScannerError; const Status: JQRScannerStatus);
  TDisplayContentsCallback = procedure(const Error: JQRScannerError; const Text: String);
  TStatusCallback = procedure(const Status: JQRScannerStatus);

  JQRScanner = class external 'QRScanner'
  public
    procedure prepare(onDone: TDoneCallback);
    procedure scan(displayContents: TDisplayContentsCallback);
    procedure cancelScan(callback: TStatusCallback = nil);
    procedure show(callback: TStatusCallback = nil);
    procedure hide(callback: TStatusCallback = nil);
    procedure enableLight(callback: TDoneCallback = nil);
    procedure disableLight(callback: TDoneCallback = nil);
    procedure useFrontCamera(callback: TDoneCallback = nil);
    procedure useBackCamera(callback: TDoneCallback = nil);
    procedure useCamera(front: Boolean; callback: TDoneCallback = nil);
    procedure pausePreview(callback: TStatusCallback = nil);
    procedure resumePreview(callback: TStatusCallback = nil);
    procedure getStatus(callback: TStatusCallback);
    procedure openSettings;
    procedure destroy(callback: TStatusCallback = nil);
  end;
  
var QRScanner external 'QRScanner': JQRScanner;

implementation

end.