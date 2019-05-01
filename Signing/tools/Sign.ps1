param ($BaseOutputPath = $(throw "Base Output Path parameter is required."), 				
		$ProjectPath = $(throw "Project path parameter is required."))
		
$searchString = ($ProjectPath + '\' + $BaseOutputPath)
$files = Get-ChildItem -Path $searchString -Include *.dll -Recurse

foreach ($file in $files){	
	& ($PSScriptRoot + "\signtool.exe") sign /sm /a /tr "http://sha256timestamp.ws.symantec.com/sha256/timestamp" $file		
}


