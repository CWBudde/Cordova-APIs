unit Cordova.AndroidFullScreen;

interface

type
  TAndroidFullScreenSuccessCallback = procedure;
  TAndroidFullScreenErrorCallback = procedure(error: Variant);
  TAndroidFullScreenTraceCallback = procedure(Value: Variant);

  JAndroidFullScreen = class external 'AndroidFullScreen'
		const SYSTEM_UI_FLAG_VISIBLE = 0;
		const SYSTEM_UI_FLAG_LOW_PROFILE = 1;
		const SYSTEM_UI_FLAG_HIDE_NAVIGATION =  2;
    const SYSTEM_UI_FLAG_FULLSCREEN = 4;
    const SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR = 16;
		const SYSTEM_UI_FLAG_LAYOUT_STABLE = 256;
		const SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION = 512;
		const SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN = 1024;
    const SYSTEM_UI_LAYOUT_FLAGS = 1536;
		const SYSTEM_UI_FLAG_IMMERSIVE = 2048;
		const SYSTEM_UI_FLAG_IMMERSIVE_STICKY = 4096;
		const SYSTEM_UI_FLAG_LIGHT_STATUS_BAR = 8192;

    procedure isSupported(
      successFunction: TAndroidFullScreenSuccessCallback); overload;
    procedure isSupported(successFunction: TAndroidFullScreenSuccessCallback;
      errorFunction: TAndroidFullScreenErrorCallback); overload;

    procedure isImmersiveModeSupported(
      successFunction: TAndroidFullScreenSuccessCallback); overload;
    procedure isImmersiveModeSupported(
      successFunction: TAndroidFullScreenSuccessCallback;
      errorFunction: TAndroidFullScreenErrorCallback); overload;
    procedure immersiveWidth(trace: TAndroidFullScreenTraceCallback); overload;
    procedure immersiveWidth(trace: TAndroidFullScreenTraceCallback;
      errorFunction: TAndroidFullScreenErrorCallback); overload;
    procedure immersiveHeight(trace: TAndroidFullScreenTraceCallback); overload;
    procedure immersiveHeight(trace: TAndroidFullScreenTraceCallback;
      errorFunction: TAndroidFullScreenErrorCallback); overload;

    procedure leanMode(successFunction: TAndroidFullScreenSuccessCallback); overload;
    procedure leanMode(successFunction: TAndroidFullScreenSuccessCallback;
      errorFunction: TAndroidFullScreenErrorCallback); overload;

    procedure showSystemUI(successFunction: TAndroidFullScreenSuccessCallback); overload;
    procedure showSystemUI(successFunction: TAndroidFullScreenSuccessCallback;
      errorFunction: TAndroidFullScreenErrorCallback); overload;

    procedure showUnderStatusBar(successFunction: TAndroidFullScreenSuccessCallback); overload;
    procedure showUnderStatusBar(successFunction: TAndroidFullScreenSuccessCallback;
      errorFunction: TAndroidFullScreenErrorCallback); overload;

    procedure showUnderSystemUI(successFunction: TAndroidFullScreenSuccessCallback); overload;
    procedure showUnderSystemUI(successFunction: TAndroidFullScreenSuccessCallback;
      errorFunction: TAndroidFullScreenErrorCallback); overload;

    procedure immersiveMode(
      successFunction: TAndroidFullScreenSuccessCallback;
      errorFunction: TAndroidFullScreenErrorCallback); overload;
    procedure immersiveMode(
      successFunction: TAndroidFullScreenSuccessCallback); overload;

    procedure setSystemUiVisibility(Visibility: Integer;
      successFunction: TAndroidFullScreenSuccessCallback;
      errorFunction: TAndroidFullScreenErrorCallback);
  end;

var AndroidFullScreen external 'AndroidFullScreen': JAndroidFullScreen;
