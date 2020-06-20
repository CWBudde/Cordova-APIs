unit Cordova.LocalModifications;

interface

uses
  ECMA.Date, W3C.DOM4, W3C.Html5;

type
  JScheduleArguments = class external
    skipPermission: Boolean;
  end;

  JNotification = class external
    id: Integer;
    title: String;
    text: String;
    every: String;
    everyAsInteger: Integer; external 'every';
    at: JDate;
    firtAt: JDate;
    badge: Integer;
    sound: String;
    data: String;

    // android only
    icon: String;
    smallIcon: String;
    ongoing: Boolean;
    autoClear: Boolean;
    led: String;
    ledOnTime: String;
    ledOffTime: String;
    color: String;
  end;

  TPresentCallback = procedure(present: Boolean);
  TGetIDsCallback = procedure(ids: array of Integer);
  TGetSingleCallback = procedure(notification: JNotification);
  TGetCallback = procedure(notifications: array of JNotification);

  JLocalNotification = class external 'cordova.plugins.notification.local'
    procedure schedule(notifications: JNotification); overload;
    procedure schedule(notifications: JNotification; callback: procedure); overload;
    procedure schedule(notifications: JNotification; callback: procedure;
      scope: Variant); overload;
    procedure schedule(notifications: array of JNotification; callback: procedure;
      scope: Variant; args: JScheduleArguments); overload;

    procedure update(notifications: JNotification; callback: procedure); overload;
    procedure update(notifications: JNotification; callback: procedure;
      scope: Variant); overload;
    procedure update(notifications: JNotification; callback: procedure;
      scope: Variant; args: JScheduleArguments); overload;

    procedure setDetaults(defaults: Variant);
    function getDetaults: Variant;

    procedure clear(id: array of String; callback: procedure; Scope: Variant); overload;
    procedure clear(id: array of String; callback: procedure); overload;

    procedure clearAll(callback: procedure; Scope: Variant); overload;
    procedure clearAll(callback: procedure); overload;

    procedure cancel(id: array of String; callback: procedure; Scope: Variant); overload;
    procedure cancel(id: array of String; callback: procedure); overload;

    procedure cancelAll(callback: procedure; Scope: Variant); overload;
    procedure cancelAll(callback: procedure); overload;

    procedure isPresent(id: String; callback: TPresentCallback; Scope: Variant); overload;
    procedure isPresent(id: String; callback: TPresentCallback); overload;

    procedure isScheduled(id: String; callback: TPresentCallback; Scope: Variant); overload;
    procedure isScheduled(id: String; callback: TPresentCallback); overload;

    procedure isTriggered(id: String; callback: TPresentCallback; Scope: Variant); overload;
    procedure isTriggered(id: String; callback: TPresentCallback); overload;

    procedure getAllIds(callback: TGetIDsCallback); overload;
    procedure getAllIds(callback: TGetIDsCallback; Scope: Variant); overload;
    procedure getIds(callback: TGetIDsCallback); overload;
    procedure getIds(callback: TGetIDsCallback; Scope: Variant); overload;
    procedure getScheduledIds(callback: TGetIDsCallback); overload;
    procedure getScheduledIds(callback: TGetIDsCallback; Scope: Variant); overload;

    procedure get(id: Integer; callback: TGetSingleCallback); overload;
    procedure get(id: Integer; callback: TGetSingleCallback; Scope: Variant); overload;
    procedure get(ids: array of Integer; callback: TGetCallback); overload;
    procedure get(ids: array of Integer; callback: TGetCallback; Scope: Variant); overload;
    procedure get(callback: TGetCallback); overload;
    procedure get(callback: TGetCallback; Scope: Variant); overload;
    procedure getAll(callback: TGetCallback); overload;
    procedure getAll(callback: TGetCallback; Scope: Variant); overload;

    procedure getScheduled(ids: array of Integer; callback: TGetCallback; Scope: Variant); overload;
    procedure getScheduled(ids: array of Integer; callback: TGetCallback); overload;
    procedure getScheduled(callback: TGetCallback; Scope: Variant); overload;
    procedure getScheduled(callback: TGetCallback); overload;
    procedure getAllScheduled(callback: TGetCallback; Scope: Variant); overload;
    procedure getAllScheduled(callback: TGetCallback); overload;

    procedure getTriggered(ids: array of Integer; callback: TGetCallback); overload;
    procedure getTriggered(ids: array of Integer; callback: TGetCallback; Scope: Variant); overload;
    procedure getTriggered(callback: TGetCallback); overload;
    procedure getTriggered(callback: TGetCallback; Scope: Variant); overload;
    procedure getAllTriggered(callback: TGetCallback); overload;
    procedure getAllTriggered(callback: TGetCallback; Scope: Variant); overload;

    procedure hasPermission(callback: procedure); overload;
    procedure hasPermission(callback: procedure; Scope: Variant); overload;
    procedure registerPermission(callback: procedure); overload;
    procedure registerPermission(callback: procedure; Scope: Variant); overload;

    procedure on(event: String; callback: TEventHandler); overload;
    procedure on(event: String; callback: TEventHandler; Scope: Variant); overload;
    procedure un(event: String; callback: TEventHandler);
  end;

var
  LocalNotification external 'cordova.plugins.notification.local': JLocalNotification;