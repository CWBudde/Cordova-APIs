unit Cordova.PushNotifications;

interface

uses
  W3C.DOM4, W3C.Html5;

type
  JCategoryArray = class external
    // property Item[name: String]: JCategoryAction;
  end;

  JCategoryActionData = class external
    callback: String;
    title: String;
    foreground: Boolean;
    destructive: Boolean;
  end;

  JCategoryAction = class external
    yes: JCategoryActionData; // nullable
    no: JCategoryActionData; // nullable
    maybe: JCategoryActionData; // nullable
  end;

  JRegistrationEventResponse = class external
    // The registration ID provided by the 3rd party remote push service.
    registrationId: String;
  end;

  JNotificationEventAdditionalData = class external
  private
    function GetItems(name: String): Variant; external array;
  public
    foreground: Boolean; // Whether the notification was received while the app was in the foreground
    coldstart: Boolean; // Will be true if the application is started by clicking on the push notification, false if the app is already started. (Android/iOS only)
    collapse_key: String;
    from: String;
    notId: String;

    property Items[name: String]: Variant read GetItems; default;
  end;

  JNotificationEventResponse = class external
    message: String; // The text of the push message sent from the 3rd party service.
    title: String; // The optional title of the push message sent from the 3rd party service.
    count: String; // The number of messages to be displayed in the badge iOS or message count in the notification shade in Android.
    sound: String; // The name of the sound file to be played upon receipt of the notification.
    image: String; // The path of the image file to be displayed in the notification.
    additionalData: JNotificationEventAdditionalData; // An optional collection of data sent by the 3rd party push service that does not fit in the above properties.
  end;

  // platform specific initialization options.
  JInitOptions = class external
    android: record
      // Android specific initialization options.
      senderID: String; // Maps to the project number in the Google Developer Console.
      icon: String; // The name of a drawable resource to use as the small-icon. The name should not include the extension.
      iconColor: String; // Sets the background color of the small icon on Android 5.0 and greater.
      sound: Boolean; // If true it plays the sound specified in the push data or the default system sound. Default is true.
      vibrate: Boolean; // If true the device vibrates on receipt of notification. Default is true.
      clearNotifications: Boolean; // If true the app clears all pending notifications when it is closed. Default is true.
      forceShow: Boolean; // If true will always show a notification, even when the app is on the foreground. Default is false.
      topics: array of String; // If the array contains one or more strings each string will be used to subscribe to a GcmPubSub topic.
    end; // nullable
    ios: record
      // iOS specific initialization options.

      (*
       * If true|"true" the device sets the badge number on receipt of notification.
       * Default is false|"false".
       * Note: the value you set this option to the first time you call the init method will be how the application always acts.
       * Once this is set programmatically in the init method it can only be changed manually by the user in Settings>Notifications>App Name.
       * This is normal iOS behaviour.
       *)
      badge: Variant {Boolean or String}; // nullable
      (*
       * If true|"true" the device plays a sound on receipt of notification.
       * Default is false|"false".
       * Note: the value you set this option to the first time you call the init method will be how the application always acts.
       * Once this is set programmatically in the init method it can only be changed manually by the user in Settings>Notifications>App Name.
       * This is normal iOS behaviour.
       *)
      sound: Variant {Boolean or String}; // nullable
      (*
       * If true|"true" the device shows an alert on receipt of notification.
       * Default is false|"false".
       * Note: the value you set this option to the first time you call the init method will be how the application always acts.
       * Once this is set programmatically in the init method it can only be changed manually by the user in Settings>Notifications>App Name.
       * This is normal iOS behaviour.
       *)
      alert: Variant {Boolean or String}; // nullable
      (*
       * If true|"true" the badge will be cleared on app startup. Default is false|"false".
       *)
      clearBadge: Variant {Boolean or String}; // nullable

      // The data required in order to enable Action Buttons for iOS.
      categories: JCategoryArray; // nullable

      // Maps to the project number in the Google Developer Console. Setting
      // this uses GCM for notifications instead of native
      senderID: String; // nullable

      // Whether to use prod or sandbox GCM setting. Defaults to false.
      gcmSandbox: Boolean; // nullable

      // If the array contains one or more strings each string will be used to
      // subscribe to a GcmPubSub topic. Note: only usable in conjunction with
      // senderID
      topics: array of String; // nullable
    end;

    windows: JObject;
  end;

  JPushNotification = class external
    (*
     * The event registration will be triggered on each successful registration with the 3rd party push service.
     * @param event
     * @param callback
     *)
    procedure on(event: String; callback: function(response: JEvent): Variant); overload; // registration, notification, error

    (*
     * As stated in the example, you will have to store your event handler if you are planning to remove it.
     * @param event Name of the event type. The possible event names are the same as for the push.on function.
     * @param callback handle to the function to get removed.
     * @param event
     * @param callback
     *)
    procedure off(event: String; callback: function(response: JEvent): Variant); overload;

    (*
     * The unregister method is used when the application no longer wants to
     * receive push notifications.
     * Beware that this cleans up all event handlers previously registered,
     * so you will need to re-register them if you want them to function again
     * without an application reload.
     * @param successHandler
     * @param errorHandler
     * @param topics
     *)
    procedure unregister(successHandler: function: Variant); overload;
    procedure unregister(successHandler: function: Variant; errorHandler: function: Variant); overload;
    procedure unregister(successHandler: function: Variant; errorHandler: function: Variant; topics: array of String); overload;

    (*
     * Set the badge count visible when the app is not running
     *
     * The count is an integer indicating what number should show up in the badge.
     * Passing 0 will clear the badge.
     * Each notification event contains a data.count value which can be used to set the badge to correct number.
     * @param successHandler
     * @param errorHandler
     * @param count
     *)
    procedure setApplicationIconBadgeNumber(successHandler: function: Variant; errorHandler: function: Variant; count: Integer);

    (*
     * Get the current badge count visible when the app is not running
     * successHandler gets called with an integer which is the current badge count
     * @param successHandler
     * @param errorHandler
     *)
    procedure getApplicationIconBadgeNumber(successHandler: function(count: Integer): Variant; errorHandler: function: Variant);

    (*
     * iOS only
     * Tells the OS that you are done processing a background push notification.
     * successHandler gets called when background push processing is successfully completed.
     * @param successHandler
     * @param errorHandler
     * @param id
     *)
    procedure finish; overload;
    procedure finish(successHandler: function: Variant); overload;
    procedure finish(successHandler: function: Variant; errorHandler: function: Variant); overload;
    procedure finish(successHandler: function: Variant; errorHandler: function: Variant; id: String); overload;
  end;

  JPushNotificationStatic = class external 'PushNotification'
  public
    class function init(options: JInitOptions): JPushNotification;
  end;

  JWindow = partial class external
    PushNotification: JPushNotificationStatic;
  end;

var
  PushNotification external 'PushNotification' : JPushNotificationStatic;