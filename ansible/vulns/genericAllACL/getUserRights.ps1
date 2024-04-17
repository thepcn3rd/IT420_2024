# Check if Marisol.Mcfarland is in the IdentifyReference for Natalia.Foley

Import-Module ActiveDirectory
$domainUser = Get-ADUser -Identity "Marisol.Mcfarland"
$acl = Get-Acl -Path "AD:\$($domainUser.DistinguishedName)"
($acl.Access).IdentityReference
