param ($ProjectPath = $(throw "Project path parameter is required."))
		
$searchString = ($ProjectPath + '\' + $BaseOutputPath)
cd /D $ProjectPath
& ($PSScriptRoot + "\DinkeyAddCmd.exe") ($ProjectPath + "Protection.dapfj") /a2


