$ErrorActionPreference = 'SilentlyContinue'
Write-Output ""
Write-Output "***** Public/WAN IP Address *****"
#(nslookup myip.opendns.com resolver1.opendns.com | Select-String "Address: ").ToString().Replace("Address: ","")
#(nslookup myip.opendns.com resolver1.opendns.com | Select-String "Address: " | Select-Object -Last 1).ToString().Replace("Address:","").Trim()
(Invoke-WebRequest https://ifconfig.me/ip).Content.Trim()
#https://ipinfo.io/ip
#https://ifconfig.me/ip
#https://icanhazip.com
#https://ident.me
#http://smart-ip.net/myip

Write-Output ""

Write-Output "***** Private/LAN IP Addresse(s) and Interface(s) *****"
Get-NetIPConfiguration | Get-NetIPAddress | Select-Object -Property InterfaceAlias,IPv4Address,PrefixLength | Where-Object {$_.IPv4Address -NotLike "*169.254*" -And $_.IPv4Address -NotLike $null} | ConvertTo-Json

Write-Output ""

Write-Output "***** Reachable Neighbors *****"
Get-NetNeighbor -AddressFamily IPv4 -State Reachable | Select-Object -Property IPAddress,LinkLayerAddress | ConvertTo-Json