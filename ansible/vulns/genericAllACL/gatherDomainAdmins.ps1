Import-Module ActiveDirectory
$domainAdminsGroup = Get-ADGroup -Identity "Domain Admins"
$domainAdminsMembers = Get-ADGroupMember -Identity $domainAdminsGroup
($domainAdminsMembers).SamAccountName
