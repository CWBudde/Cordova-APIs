unit Cordova.InAppBrowser;

interface

type
  JInAppBrowserOptions = String;

  JInAppBrowserEvent = class
    &type: String;
    url: String;
    code: Integer;
    message: Integer;
  end;
  
  JInAppBrowserInjectDetails = class
    file: String;
    code: String;
  end;

  JInAppBrowser = class external 'InAppBrowser'
  public
    procedure addEventListener(eventname: string; callback: procedure(Event: JInAppBrowserEvent));
    procedure removeEventListener(eventname: string; callback: procedure(Event: JInAppBrowserEvent));
    procedure close;
    procedure show;
    procedure executeScript(details: JInAppBrowserInjectDetails; callback: procedure);
    procedure insertCSS(details: JInAppBrowserInjectDetails; callback: procedure); 
  end;
  
function open(url: string): JInAppBrowser; overload;
  external 'cordova.InAppBrowser.open';
function open(url: string; target: string): JInAppBrowser; overload;
  external 'cordova.InAppBrowser.open';
function open(url, target: string; options: JInAppBrowserOptions): JInAppBrowser; overload;
  external 'cordova.InAppBrowser.open';

implementation

end.