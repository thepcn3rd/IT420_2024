

# Allow Natalia.Foley to have GenericAll rights on Marisol.Mcfarlands account to be able to change her password to anything at any time

# Allow for the user Marisol.Mcfarland to have GenericAll rights to the domain admins group.  This allows Marisol.Mcfarland to add any user to the domain admin group
#


Function SetAcl($for, $to, $right, $inheritance)
{
    $forSID = New-Object System.Security.Principal.SecurityIdentifier (Get-ADUser $for).SID
    $objOU = ($to).DistinguishedName
    $objAcl = get-acl $objOU
    $adRight =  [System.DirectoryServices.ActiveDirectoryRights] $right 
    $type =  [System.Security.AccessControl.AccessControlType] "Allow" 
    $inheritanceType = [System.DirectoryServices.ActiveDirectorySecurityInheritance] $inheritance 
    $ace = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $forSID,$adRight,$type,$inheritanceType
    $objAcl.AddAccessRule($ace)
    Set-Acl -AclObject $objAcl -path $objOU
}

Import-Module ActiveDirectory
Set-Location AD:

# Set the permission of GenericAll on Natalia.Foley for Marisol.Mcfarland
SetAcl (Get-ADUser "Natalia.Foley") (Get-AdUser "Marisol.Mcfarland") "GenericAll" "None"
SetAcl (Get-ADUser "Natalia.Foley") (Get-ADGroup "Domain Admins") "GenericAll" "None"
SetAcl (Get-ADUser "Marisol.Mcfarland") (Get-ADGroup "Domain Admins") "GenericAll" "None"
