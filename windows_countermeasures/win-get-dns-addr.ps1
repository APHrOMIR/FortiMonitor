function Plugin-Configuration {
	$properties = @{}
	
	$properties.add("name", "Windows Get DNS Address")
	$properties.add("description", "Returns configured IPv4 DNS servers")
	$properties.add("textkey", "win_get_dns_addr")
	$properties.add("author", "nhenderson@fortinet.com")

	return $properties
}

function Execute {
	param(
        [hashtable]$metadata
    )
	
	$get_dns_addr = Get-DnsClientServerAddress -AddressFamily IPv4 -InterfaceAlias "Wi-Fi" | Out-String
	
	$returndata = @{}
	$output = @{}
	$returndata.add("return_code", "success")
	$output.add("format", "text")
	$output.add("output", $get_dns_addr)
	$myarray = New-Object System.Collections.ArrayList
	$myarray.Add($output);
	$returndata.add("output", $myarray)
	return $returndata
}
