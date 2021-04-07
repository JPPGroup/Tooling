param ($BaseOutputPath = $(throw "Base Output Path parameter is required."), 				
		$ProjectPath = $(throw "Project path parameter is required."))
		
$searchString = ($ProjectPath + '\' + $BaseOutputPath)
Write-Host "Searching for files to sign in" $searchString

$files = Get-ChildItem -Path $searchString -Include *.dll -Recurse
$count = 0;

foreach ($file in $files){	
	$companyName = $file.VersionInfo.CompanyName
	if($companyName.Contains("JPP"))
    {
		& ($PSScriptRoot + "\signtool.exe") sign /sm /a /tr "http://sha256timestamp.ws.symantec.com/sha256/timestamp" $file			
		$count++;
	}			
}

Write-Host $files.Count "processed," $count "signed."


