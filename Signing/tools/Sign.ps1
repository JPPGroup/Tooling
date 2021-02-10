param ($BaseOutputPath = $(throw "Base Output Path parameter is required."), 				
		$ProjectPath = $(throw "Project path parameter is required."))

Write-Host "Searching for files to sign"
		
$searchString = ($ProjectPath + '\' + $BaseOutputPath)
$files = Get-ChildItem -Path $searchString -Include *.dll -Recurse

foreach ($file in $files){	
	$companyName = $file.VersionInfo.CompanyName
	if($companyName.Contains("JPP"))
    {
		& ($PSScriptRoot + "\signtool.exe") sign /sm /a /tr "http://sha256timestamp.ws.symantec.com/sha256/timestamp" $file			
	}		
}


