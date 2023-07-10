#Path to Logfiles
$logpath = 'C:\Program Files (x86)\Pfad\Pfad'

#Get ACL
$acl = Get-Acl -Path $logpath

#Disable inheritance convert permission to explicit permission 
$acl.SetAccessRuleProtection($True, $True)

#Write Changes
Set-Acl -Path $logpath -AclObject $acl


#Get ACL
$acl = Get-Acl -Path $logpath

#Get Every ACE Where the User is mapped to and remove it
$rules = $acl.Access | Where-Object { $_.IdentityReference -eq "BULTIN\USER"}
foreach($rule in $rules) {
    $acl.RemoveAccessRule($rule)
}

#Write Changes
Set-Acl -Path $logpath -AclObject $acl