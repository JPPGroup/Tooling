param ($BaseOutputPath = $(throw "Base Output Path parameter is required."), 		
		$Configuration = $(throw "Configuration parameter is required."))
		
$files = Get-ChildItem -Include '%$BaseOutputPath\$Configuration\*.dll'

foreach ($file in $files){
	& "signtool.exe" sign /a /tr "http://sha256timestamp.ws.symantec.com/sha256/timestamp" "%file"		
}

