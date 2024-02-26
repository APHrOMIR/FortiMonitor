function Plugin-Configuration {
	$properties = @{}
	
	$properties.add("name", "Windows Resolve DNS Name")
	$properties.add("description", "Resolves DNS name to confirm DNS is working")
	$properties.add("textkey", "win_res_dns_name")
	$properties.add("author", "nhenderson@fortinet.com")

	return $properties
}

function Execute {
	param(
        [hashtable]$metadata
    )
	
	$get_dns_name = Resolve-DnsName fortinet.com | Out-String
	
	$returndata = @{}
	$output = @{}
	$returndata.add("return_code", "success")
	$output.add("format", "text")
	$output.add("output", $get_dns_name)
	$myarray = New-Object System.Collections.ArrayList
	$myarray.Add($output);
	$returndata.add("output", $myarray)
	return $returndata
}
