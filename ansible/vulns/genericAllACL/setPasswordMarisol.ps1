# Set the password for a user
# Marisol.Mcfarland
#
#
# evil-winrm -i 10.27.20.142 -u Natalia.Foley -p AveryL0ngString! -s scripts
#
Import-Module ActiveDirectory

$username = "Marisol.Mcfarland"
$passwordString = "AveryL0ngString!"
$securePassword = ConvertTo-SecureString -String $passwordString -AsPlainText -Force
Set-ADAccountPassword -Identity $username -NewPassword $securePassword -Reset
