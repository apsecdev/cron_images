#Start a Transcript for debugging purposes if the script gives issues
Start-Transcript -Path "c:\YOURPATH\transcript.txt"
#Get current image info
$live_bg = Invoke-WebRequest -UseBasicParsing -Uri "http://YOUR_URL_HERE/bg_images/bg.jpg" 
$live_bg = $live_bg.headers.'content-length'
#set while trigger
$change_bg2 = $live_bg
#loop until image size chang
while ($live_bg -eq $change_bg2) {
Invoke-WebRequest -UseBasicParsing -Uri "http://YOUR_URL_HERE/cron.php"
$change_bg = Invoke-WebRequest -UseBasicParsing -Uri "http://YOUR_URL_HERE/bg_images/bg.jpg" 
$change_bg2 = $change_bg.headers.'content-length'
}
#display image change if manually ran
write-host $live_bg" is now "$change_bg2
#clean up variables if previous exit was not clean
Remove-Variable live_bg,change_bg2,change_bg -ErrorAction SilentlyContinue
Stop-Transcript
