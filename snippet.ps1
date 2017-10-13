$server = Read-Host 'Input your server name'
$user = Read-Host 'Input your host userid'
$password = Read-Host 'Input host password' 
$dnsip1 = Read-Host 'Input the primary dns IP'
$dnsip2 = Read-Host 'Input the secondary dns IP'
$domian_name = Read-Host 'Input the dns domain name'
$search_name = Read-Host 'Input the AD domain name'
$domain_user = Read-Host 'Input AD domain user name'
$domain_password = Read-Host 'Input AD domain password'
Connect-VIServer -Server $server -User $user -Password $password
Get-VMHost | Get-VMHostNetwork | Set-VMHostNetwork -DnsFromDhcp $false -DnsAddress $dnsip1, $dnsip2 -DomainName $domain_name -SearchDomain $search_name
Get-VMHostAuthentication| Set-VMHostAuthentication -JoinDomain -Domain $searchDomain -Username $domain_user -Password $domain_password -Confirm:$false 