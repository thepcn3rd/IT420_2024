Function SetAclExtended($for, $to, $right, $extendedRightGUID, $inheritance)
{
    $forSID = New-Object System.Security.Principal.SecurityIdentifier (Get-ADUser $for).SID
    $objOU = ($to).DistinguishedName
    $objAcl = get-acl $objOU
    $adRight =  [System.DirectoryServices.ActiveDirectoryRights] $right 
    $type =  [System.Security.AccessControl.AccessControlType] "Allow" 
    $inheritanceType = [System.DirectoryServices.ActiveDirectorySecurityInheritance] $inheritance 

    $ace = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $forSID,$adRight,$type,$extendedRightGUID,$inheritanceType
    $objAcl.AddAccessRule($ace)
    Set-Acl -AclObject $objAcl -path $objOU
}

SetAclExtended (Get-ADUser "Natalia.Foley") (Get-ADUser "Marisol.Mcfarland") "ExtendedRight" "00299570-246d-11d0-a768-00aa006e0529" "None"
