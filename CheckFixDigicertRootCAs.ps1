# Verify "DigiCert Global Root CA" exists
$rootCA = Get-ChildItem -path 'Cert:\*A8985D3A65E5E5C4B2D7D66D40C6DD2FB19C5436' -Recurse

# Verify "DigiCert Global Root G2" exists
$rootG2CA = Get-ChildItem -Path 'Cert:\*df3c24f9bfd666761b268073fe06d1cc8d4f82a4' -Recurse


################################################
# Download and trust DigiCert Global Root CA   #
################################################

if($rootCA){Write-Host -ForegroundColor Green "DigiCert Global Root CA with thumbprint A8985D3A65E5E5C4B2D7D66D40C6DD2FB19C5436 found"}
if(!$rootCA){

Write-Host -ForegroundColor Yellow "DigiCert Global Root CA with thumbprint A8985D3A65E5E5C4B2D7D66D40C6DD2FB19C5436 not found"

## Set up variables and objects
$url = "https://cacerts.digicert.com/DigiCertGlobalRootCA.crt"
$filename = [System.IO.Path]::GetTempFileName() #get a temporary file reference
$pfx = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2
$store = new-object System.Security.Cryptography.X509Certificates.X509Store(“AuthRoot”,”LocalMachine”)

## Download the cert file
Invoke-WebRequest -Uri $url -OutFile $filename
$pfx.Import($filename)
$store.Open(“MaxAllowed”)
$store.Add($pfx)
$store.Close()

## clean up
Remove-Item $filename

Write-Host -ForegroundColor Green "DigiCert Global Root CA with thumbprint A8985D3A65E5E5C4B2D7D66D40C6DD2FB19C5436 installed. You may need to restart AAD Connect Server, or 'Microsoft Azure AD Sync' service manually to correct service bus issues once installed."
}


################################################
# Download and trust DigiCert Global Root G2   #
################################################

if($rootG2CA){Write-Host -ForegroundColor Green "DigiCert Global Root G2 CA with thumbprint df3c24f9bfd666761b268073fe06d1cc8d4f82a4 found"}
if(!$rootG2CA){

Write-Host -ForegroundColor Yellow "DigiCert Global Root G2 CA with thumbprint df3c24f9bfd666761b268073fe06d1cc8d4f82a4 not found"



## Set up variables and objects
$url = "https://cacerts.digicert.com/DigiCertGlobalRootG2.crt"
$filename = [System.IO.Path]::GetTempFileName() #get a temporary file reference
$pfx = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2
$store = new-object System.Security.Cryptography.X509Certificates.X509Store(“AuthRoot”,”LocalMachine”)

## Download the cert file
Invoke-WebRequest -Uri $url -OutFile $filename
$pfx.Import($filename)
$store.Open(“MaxAllowed”)
$store.Add($pfx)
$store.Close()

## clean up
Remove-Item $filename

Write-Host -ForegroundColor Green "DigiCert Global Root G2 CA with thumbprint df3c24f9bfd666761b268073fe06d1cc8d4f82a4 installed. You may need to restart AAD Connect Server, or 'Microsoft Azure AD Sync' service manually to correct service bus issues once installed."


}

Read-Host "Press any key to quit"
