function Plugin-Configuration {
	$properties = @{}
	
	$properties.add("name", "Windows Get Fortinet Process")
	$properties.add("description", "Get Fortinet process information")
	$properties.add("textkey", "win_get_ftnt_process")
	$properties.add("author", "nhenderson@fortinet.com")

	return $properties
}

function Execute {
	param(
        [hashtable]$metadata
    )
	
	$get_ftnt_proc = Get-process | Where Path -match 'Teams' | Select Name,Id,StartTime,Path | Sort StartTime | Format-Table -AutoSize | Out-String
	
	$returndata = @{}
	$output = @{}
	$returndata.add("return_code", "success")
	$output.add("format", "text")
	$output.add("output", $get_ftnt_proc)
	$myarray = New-Object System.Collections.ArrayList
	$myarray.Add($output);
	$returndata.add("output", $myarray)
	return $returndata
}
