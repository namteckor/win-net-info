# win-net-info
A PowerShell script to collect network related information from a Windows host, such as public/private IPv4 addresses and reachable neighbors.  

Before using you may need:  
```powershell
powershell -ep bypass
```
Then:
```powershell
.\win-net-info.ps1
```

If there is no output returned in a given section, the command likely failed.  

Tested on PSVersion 5.1.19041.1645 Desktop edition.  

Sample output:  
![Alt text](../assets/win-net-info-sample-output.png?raw=true "win-net-info sample output")
