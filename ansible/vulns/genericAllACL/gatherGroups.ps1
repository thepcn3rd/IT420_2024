# Import the Active Directory module
Import-Module ActiveDirectory

# Get all groups
$groups = Get-ADGroup -Filter *

# Display group names
$groups | Select-Object -ExpandProperty Name
