# Check if Marisol.Mcfarland is in the IdentifyReference for the ActiveDirectoryRights

Import-Module ActiveDirectory
$domainAdminsGroup = Get-ADGroup -Identity "Domain Admins"
$acl = Get-Acl -Path "AD:\$($domainAdminsGroup.DistinguishedName)"
($acl.Access).IdentityReference
