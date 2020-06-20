unit Cordova.SecureStorage;

type
  JSecureStorage = class external 'cordova.plugins.SecureStorage'
    constructor Create(OnSuccess: procedure; OnError: procedure(Error: string); Name: String); external 'cordova.plugins.SecureStorage';
    
    procedure set(OnSuccess: procedure(Key: String); OnError: procedure(Error: string); Key, Value: String);
    procedure get(OnSuccess: procedure(Value: String); OnError: procedure(Error: string); Key: String);
    procedure remove(OnSuccess: procedure(Key: String); OnError: procedure(Error: string); Key: String);
    procedure keys(OnSuccess: procedure(Keys: array of String); OnError: procedure(Error: string));
    procedure clear(OnSuccess: procedure; OnError: procedure(Error: string));

    procedure secureDevice(OnSuccess, OnError: procedure);
  end; 
