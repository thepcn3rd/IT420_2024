# Set the password for a user
# Natalia.Foley
# Marisol.Mcfarland
#
Import-Module ActiveDirectory

$username = "Natalia.Foley"
$passwordString = "AveryL0ngString!"
$securePassword = ConvertTo-SecureString -String $passwordString -AsPlainText -Force
Set-ADAccountPassword -Identity $username -NewPassword $securePassword -Reset

# Create a credentials object for connecting to the server
# Convert plaintext password to a secure string
$securePassword = ConvertTo-SecureString "Seven1sabignumber!" -AsPlainText -Force

# Create a credential object using the plain text username and the secure password
$credentials = New-Object System.Management.Automation.PSCredential("thepcn3rd", $securePassword)

# Add the user to the remote management users group on the computer
# 
# Add user to the Remote Management Users group
$serverName = $env:USERDOMAIN + "-SRV"
$memberName = "Natalia.Foley"
Invoke-Command -ComputerName $serverName -Credential $credentials -ScriptBlock { Add-LocalGroupMember -Group "Remote Management Users" -Member $memberName }
Invoke-Command -ComputerName $serverName -Credential $credentials -ScriptBlock { Add-LocalGroupMember -Group "Remote Desktop Users" -Member $memberName }
$memberName = "Marisol.Mcfarland"
Invoke-Command -ComputerName $serverName -Credential $credentials -ScriptBlock { Add-LocalGroupMember -Group "Remote Management Users" -Member $memberName }
Invoke-Command -ComputerName $serverName -Credential $credentials -ScriptBlock { Add-LocalGroupMember -Group "Remote Desktop Users" -Member $memberName }

$serverName = $env:USERDOMAIN + "-DC"
$memberName = "Natalia.Foley"
Invoke-Command -ComputerName $serverName -Credential $credentials -ScriptBlock { Add-ADGroupMember -Identity "Remote Desktop Users" -Members $memberName }
Invoke-Command -ComputerName $serverName -Credential $credentials -ScriptBlock { Add-ADGroupMember -Identity "Remote Management Users" -Members $memberName }
$memberName = "Marisol.Mcfarland"
Invoke-Command -ComputerName $serverName -Credential $credentials -ScriptBlock { Add-ADGroupMember -Identity "Remote Desktop Users" -Members $memberName }
Invoke-Command -ComputerName $serverName -Credential $credentials -ScriptBlock { Add-ADGroupMember -Identity "Remote Management Users" -Members $memberName }


