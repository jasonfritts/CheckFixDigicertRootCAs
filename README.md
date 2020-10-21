This script was created to assist in resolving Azure AD SSPR password writeback certificate trust issues to https://*.servicebus.windows.net endpoints.  Please reference https://docs.microsoft.com/en-us/azure/security/fundamentals/tls-certificate-changes for information on why certificate changes have occured, what has changed as well as a full list of certificates that need to be trusted for Azure services.

# Check DigiCert Root CAs

Download script @ https://github.com/jasonfritts/CheckFixDigicertRootCAs/blob/main/CheckFixDigicertRootCAs.ps1

This PowerShell script checks if the following two Digicert Root CA certificates are trusted by local machine and if not downloads and installs them from https://www.digicert.com/kb/digicert-root-certificates.htm

DigiCert Global Root CA - A8:98:5D:3A:65:E5:E5:C4:B2:D7:D6:6D:40:C6:DD:2F:B1:9C:54:36 <br>
DigiCert Global Root G2 - DF:3C:24:F9:BF:D6:66:76:1B:26:80:73:FE:06:D1:CC:8D:4F:82:A4

If these certificates are not found in your Trusted Root Certificate store as shown below:<br>
<img src="https://github.com/jasonfritts/CheckFixDigicertRootCAs/blob/main/DigiCert%20Global%20Root%20CAs.png">


The script will download and install them as shown:<br>
<img src="https://github.com/jasonfritts/CheckFixDigicertRootCAs/blob/main/Example_CAsInstalled.png">
