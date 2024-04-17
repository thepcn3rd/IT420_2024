foreach ($log in (Get-EventLog -List).Log) { Clear-EventLog -LogName $log }
