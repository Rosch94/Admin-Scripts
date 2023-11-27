<#https://4sysops.com/archives/find-the-source-of-account-lockouts-in-ad/

Logon Type	Title	Description
2	Interactive	An interactive logon to a local computer.
3	Network	A logon from the network to a local computer.
4	Batch	A batch logon type means a process is executed on behalf of a user account.
5	Service	A service was started by a service control manager.
7	Unlock	A local workstation is unlocked.
8	NetworkCleartext	A user logged on to a local computer from the network, and the password was passed in cleartext.
9	NewCredentials	A cloned token was used so the new session has the same user identity locally but uses a different credential for remote network connections. This logon type is recorded when you use RunAs with the /netonly switch.
10	RemoteInteractive	A user was logged on using Remote Desktop or Terminal Services.
11	CachedInteractive	A user was logged on using cached credentials without contacting the domain controller to verify credentials.


#>


# Creating filter criteria for events
$filterHash = @{LogName = "Security"; Id = 4625; StartTime = (Get-Date).AddDays(-10)}
# Getting lockout events from the source computer
$lockoutEvents = Get-WinEvent -ComputerName NE0048 -FilterHashTable $filterHash -MaxEvents 10 -ErrorAction 0
# Building output based on advanced properties
$lockoutEvents | Select @{Name = "LockedUserName"; Expression = {$_.Properties[5].Value}}, `
                        @{Name = "LogonType"; Expression = {$_.Properties[10].Value}}, `
                        @{Name = "LogonProcessName"; Expression = {$_.Properties[11].Value}}, `
                        @{Name = "ProcessName"; Expression = {$_.Properties[18].Value}}