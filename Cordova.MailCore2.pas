unit Cordova.MailCore2;

interface

type
  JMailSettings = class external
    fromEmail: String;
    toName: String;
    toEmail: String;
    smtpServer: String;
    smtpPort: Integer;
    smtpUserName: String;
    smtpPassword: String;
    textAttachment: String;
    textSubject: String;
    textBody: String;
  end;

  TSuccess = procedure;
  TFail = procedure(Error: Variant);

  JMailCore2 = class external 'MailCore2'
    procedure sendMail(mailSettings: JMailSettings; success: TSuccess;
      failure: TFail);
  end;

var
  MailCore2 external 'mailcore2': JMailCore2;