unit Cordova.StreamingMedia;

interface

uses
  W3C.HTML5, W3C.DOM4;

type
  TMediaError = procedure(MediaError: JMediaError);

  JVideoOptions = class external
    successCallback: procedure;
    errorCallback: procedure(errMsg: String);
    orientation: String;
    shouldAutoClose: Boolean;
    controls: Boolean; 
  end; 
  
  JAudioOptions = class external
    bgColor: String;
    bgImage: String;
    bgImageScale: String;
    initFullscreen: Boolean;
    keepAwake: Boolean;
    successCallback: procedure;
    errorCallback: procedure(errMsg: String);
  end; 

  JStreamingMedia = class external 'streamingMedia'
  public
    procedure playVideo(url: String); overload;
    procedure playVideo(url: String; options: JVideoOptions); overload;
    procedure playAudio(url: String); overload;
    procedure playAudio(url: String; options: JAudioOptions); overload;
    procedure stopAudio; overload;
    procedure pauseAudio; overload;
    procedure resumeAudio; overload;
  end;
  
var StreamingMedia external 'window.plugins.streamingMedia': JStreamingMedia;

implementation

end.