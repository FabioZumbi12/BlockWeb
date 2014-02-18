; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "BlockWeb"
#define MyAppVersion "1.0.4738.561"
#define MyAppPublisher "Doze Softwares"
#define MyAppURL "http://blockweb.fretsonfire.net.br"
#define MyAppExeName "svchost.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{FB46369D-1C84-4B32-A4D5-D400C6CBC2E6}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
CreateAppDir=no
OutputBaseFilename=BW{#MyAppVersion}OCTx64
SetupIconFile=C:\Projetos Delphi\BlockWeb\icone01.ico
Compression=lzma
SolidCompression=yes
AppContact=zumbi12doze@gmail.com
UninstallDisplayIcon={uninstallexe}
ArchitecturesInstallIn64BitMode=x64 ia64
AppComments=Bloqueia sites e programas nos hor�rios escolhidos
UninstallFilesDir={pf}\{#MyAppPublisher}\{#MyAppName}
UninstallDisplayName={#MyAppName}
DisableWelcomePage=True
DisableReadyPage=True
DisableReadyMemo=True
DisableFinishedPage=True
UsePreviousTasks=False
UsePreviousLanguage=False
FlatComponentsList=False
AlwaysShowComponentsList=False
ShowComponentSizes=False
AllowCancelDuringInstall=False
ShowLanguageDialog=no

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\Projetos Delphi\BlockWeb\svchost.exe"; DestDir: "{win}"; Flags: ignoreversion; Attribs: system
Source: "C:\Projetos Delphi\BlockWeb\update.exe"; DestDir: "{win}"; Flags: ignoreversion; Attribs: system
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Run]
Filename: "{win}\svchost.exe"; WorkingDir: "{app}"; Flags: nowait postinstall 64bit; Description: "Executar o {#MyAppName} {#MyAppVersion}"
