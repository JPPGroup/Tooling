param ($ProjectPath = $(throw "Project path parameter is required."))
		
$escapedPath = "`"$ProjectPath`""
& ($PSScriptRoot + "\DinkeyAddCmd.exe") ($escapedPath + "\Protection.dapfj") /a2

