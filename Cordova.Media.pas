unit Cordova.Media;

interface

uses
  W3C.HTML5, W3C.DOM4;

type
  JMediaError = class external 'mediaError'
    const MEDIA_ERR_ABORTED = 1;
    const MEDIA_ERR_NETWORK = 2;
    const MEDIA_ERR_DECODE = 3;
    const MEDIA_ERR_NONE_SUPPORTED = 4;

    code: Integer;
    message: String;
  end;

  TMediaSuccess = procedure;
  TMediaSuccessAmplitude = procedure(Amplitude: Float);
  TMediaSuccessPosition = procedure(Position: Float);
  TMediaSuccessStatus = procedure(Position: Float);
  TMediaError = procedure(MediaError: JMediaError);

  JMedia = class external 'Media'
  public
    const MEDIA_NONE = 0;
    const MEDIA_STARTING = 1;
    const MEDIA_RUNNING = 2;
    const MEDIA_PAUSED = 3;
    const MEDIA_STOPPED = 4;
    
    constructor Create(src: String); overload;
    constructor Create(src: String; mediaSuccess: TMediaSuccess); overload;
    constructor Create(src: String; mediaSuccess: TMediaSuccess; mediaError: TMediaError); overload;
    constructor Create(src: String; mediaSuccess: TMediaSuccess; mediaError: TMediaError; mediaStatus: TMediaSuccessStatus); overload;
  
    procedure getCurrentAmplitude(mediaSuccess: TMediaSuccessAmplitude); overload;
    procedure getCurrentAmplitude(mediaSuccess: TMediaSuccessAmplitude; mediaError: TMediaError); overload;
    procedure getCurrentPosition(mediaSuccess: TMediaSuccessPosition); overload;
    procedure getCurrentPosition(mediaSuccess: TMediaSuccessPosition; mediaError: TMediaError); overload;
    function getDuration: Float;
    procedure play;
    procedure pause;
    procedure pauseRecord;
    procedure release;
    procedure resumeRecord;
    procedure seekTo(MilliSeconds: Float);
    procedure setVolume(Volume: Float);
    procedure startRecord;
    procedure stopRecord;
    procedure stop;
    procedure setRate(rate: Float);
  end;
  
implementation

end.