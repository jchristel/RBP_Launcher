#define AppName "RBP Launcher"
#define AppVersion "0.0.0"

[Setup]
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
PrivilegesRequired=admin
AppId={{3d37c781-7872-4160-9857-ecb0ba87bdcb}}
DisableDirPage=auto
DefaultDirName="C:\Program Files\RBP_Launcher"
SetupLogging=True
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x64
OutputBaseFilename=RBP_LauncherSetup_v{#AppVersion}
DirExistsWarning=no

[Files]
Source: "..\Launcher_Headless\bin\Release\net6.0\*"; DestDir: "{app}"; Flags: ignoreversion 



