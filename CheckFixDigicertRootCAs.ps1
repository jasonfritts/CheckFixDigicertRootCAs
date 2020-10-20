# Verify "DigiCert Global Root CA" exists
Get-ChildItem -path 'Cert:\*A8985D3A65E5E5C4B2D7D66D40C6DD2FB19C5436' -Recurse

# Verify "DigiCert Global Root G2" exists
Get-ChildItem -Path 'Cert:\*df3c24f9bfd666761b268073fe06d1cc8d4f82a4' -Recurse


################################################
# Download and trust DigiCert Global Root CA   #
################################################

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


################################################
# Download and trust DigiCert Global Root G2   #
################################################

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
