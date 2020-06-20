unit Cordova.BluetoothSerial;

uses
  ECMA.TypedArray;

type
  JBluetoothSerial = class external 'bluetoothSerial'
    procedure connect(macAddress_or_uuid: String; connectSuccess, connectFailure: procedure);
    procedure connectInsecure(macAddress: String; connectSuccess, connectFailure: procedure);
    procedure disconnect(success, failure: procedure); overload;
    procedure disconnect; overload;
    procedure write(data: JArrayBuffer; success, failure: procedure);
    procedure available(success, failure: procedure);
    procedure read(success, failure: procedure);
    procedure readUntil(delimiter: String; success, failure: procedure);
    procedure subscribe(delimiter: String; success, failure: procedure);
    procedure unsubscribe(success, failure: procedure);
    procedure subscribeRawData(success, failure: procedure);
    procedure unsubscribeRawData(success, failure: procedure);
    procedure clear(success, failure: procedure);
    procedure list(success, failure: procedure);
    procedure isEnabled(success, failure: procedure);
    procedure isConnected(success, failure: procedure);
    procedure readRSSI(success, failure: procedure);
    procedure showBluetoothSettings(success, failure: procedure);
    procedure enable(success, failure: procedure);
    procedure discoverUnpaired(success, failure: procedure);
    procedure setDeviceDiscoveredListener(notify: procedure);
    procedure clearDeviceDiscoveredListener;
    procedure setName(newName: String);
    procedure setDiscoverable(discoverableDuration: Float);
  end;

var BluetoothSerial external 'bluetoothSerial': JBluetoothSerial;
