:: This script will find and sign any NuGet packages with a provided PFX certificate

:: Requirements:
:: - NuGet is installed on the machine and is accessible everywhere (added to PATH)

@ECHO OFF

:: Parse command line arguments
SET certFile=%1

:: Sign all NuGet packages found
@ECHO:
@ECHO Signing NuGet package with %certFile%...
:: Should only be one .nupkg file at this point, since we deleted the old ones
FOR /R %%F IN (*.nupkg) DO (
    nuget sign "%%F" -Timestamper http://timestamp.digicert.com -CertificatePath "%certFile%" || GOTO :commandFailed
)

EXIT /B 0

:commandFailed
@ECHO Command failed.
GOTO :exitWithError

:exitWithError
@ECHO Exiting...
EXIT /B 1
