Import-Module ActiveDirectory
$domainAdminsGroup = Get-ADGroup -Identity "Students"
$domainAdminsMembers = Get-ADGroupMember -Identity $domainAdminsGroup
($domainAdminsMembers).SamAccountName
