$User='Test@domain.com'
$attachments='attachment:"*.xia"'


#Get-Mailbox -Identitiy $user | Search-Mailbox -SearchQuery $attachments


Search-Mailbox -Identity $User -TargetMailbox test@domain.com -SearchQuery $attachments -LogLevel Full -LogOnly