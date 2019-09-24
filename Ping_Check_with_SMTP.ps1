$fullread=Test-Connection IPADDRESSHERE -Count 5 | Out-String
$readerr=Test-Connection IPADDRESSHERE -Count 5 -Quiet
if($readerr -eq $false) {

    function sendMail{

         Write-Host "Sending Email"

        $EmailFrom = “FROMEMAIL”

        $EmailTo = “TOEMAIL”

        $Subject = “Ping Failure”

        $Body = “Ping test of HOSTNAME $fullread”

        $SMTPServer = “SMTPSERVERADDRESS”

        $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 2525)

        $SMTPClient.EnableSsl = $true

        $SMTPClient.Credentials = New-Object System.Net.NetworkCredential(“USERNAME”, “PASSWORD”);

        $SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
 
    }
    
    #Calling function
    sendMail
}