$fullread=Get-PhysicalDisk | Sort Size | FT FriendlyName, Size, MediaType, HealthStatus, OperationalStatus -AutoSize | Out-String
$readerr=Get-PhysicalDisk | Sort Size | Select-Object HealthStatus
if($readerr.HealthStatus -like 'Unhealthy' -Or $readerr.HealthStatus -like 'Warning') {

    function sendMail{

         Write-Host "Sending Email"

        $EmailFrom = "FROMEMAIL”

        $EmailTo = “TOEMAIL”

        $Subject = “DRIVE HEALTH ALERT”

        $Body = “DRIVE HEALTH WARNING $fullread”

        $SMTPServer = “SMTPSERVER”

        $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 2525)

        $SMTPClient.EnableSsl = $true

        $SMTPClient.Credentials = New-Object System.Net.NetworkCredential(“USERNAME”, “PASSWORD”);

        $SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
 
    }
    
    #Calling function
    sendMail
}