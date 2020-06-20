unit Cordova.BleCentral;

uses
  ECMA.TypedArray;

type
  JBleCentral = class external 'ble'
    procedure scan(services: array of String; seconds: Float; success, failure: procedure);
    procedure startScan(services, success, failure: procedure);
    procedure startScanWithOptions(services, options, success, failure: procedure);
    procedure stopScan(success, failure: procedure);
    procedure connect(device_id: String; connectCallback, disconnectCallback: procedure);
    procedure autoConnect(device_id: String; connectCallback, disconnectCallback: procedure);
    procedure disconnect(device_id: String); overload;
    procedure disconnect(device_id: String; connectCallback, disconnectCallback: procedure); overload;
    procedure requestMtu(device_id: String; mtu: String; success, failure: procedure);
    procedure refreshDeviceCache(device_id: String; timeoutMillis: Float; success, failure: procedure); overload;
    procedure refreshDeviceCache(device_id: String; timeoutMillis: Float); overload;
    procedure read(device_id: String; service_uuid, characteristic_uuid; success, failure: procedure);
    procedure write(device_id: String; service_uuid, characteristic_uuid; data: JArrayBuffer; success, failure: procedure);
    procedure writeWithoutResponse(device_id: String; service_uuid, characteristic_uuid; data: JArrayBuffer; success, failure: procedure);
    procedure startNotification(device_id: String; service_uuid, characteristic_uuid; data: JArrayBuffer; success, failure: procedure);
    procedure stopNotification(device_id: String; service_uuid, characteristic_uuid; data: JArrayBuffer; success, failure: procedure);
    procedure isEnabled(success, failure: procedure);
    procedure isConnected(device_id: String; success, failure: procedure);
    procedure startStateNotifications(success, failure: procedure);
    procedure stopStateNotifications(success, failure: procedure);
    procedure showBluetoothSettings(success, failure: procedure);
    procedure enable(success, failure: procedure);
    procedure readRSSI(device_id: String; success, failure: procedure);
    procedure connectedPeripheralsWithServices(services: array of String; success, failure: procedure);
    procedure peripheralsWithIdentifiers(uuids: array of String; success, failure: procedure);
    procedure bondedDevices(success, failure: procedure);
  end;

var ble external 'ble': JBleCentral;