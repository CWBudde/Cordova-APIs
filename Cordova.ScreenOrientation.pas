unit Cordova.ScreenOrientation;

interface

type
  TScreenOrientation = string;
  TScreenOrientationHelper = strict helper for TScreenOrientation
    const PortraitPrimary = 'portrait-primary';
    const PortraitSecondary = 'portrait-secondary';
    const LandscapePrimary = 'landscape-primary';
    const LandscapeSecondary = 'landscape-secondary';
    const Portrait = 'portrait';
    const Landscape = 'landscape';
    const Any = 'any';
  end;

  JScreenOrientation = class external 'screen.orientation'
  public
    &type: TScreenOrientation;
    procedure lock(ScreenOrientation: TScreenOrientation);
    procedure unlock;
  end;
  
var ScreenOrientation external 'screen.orientation': JScreenOrientation;

implementation

end.