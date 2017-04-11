function prev_set()
{
echo 
echo "***********SET SYSTEMSLEEP TIME TO NEVER****"
echo 
echo
sudo pmset -a sleep 0                        

#Set display doesn't sleep.
echo 
echo "*********SET DISPLAY SLEEP TIME TO NEVER****"
echo 
echo 
sudo pmset -a displaysleep 0                 
}
#Change the power management setting to the default.
function aft_set()
{
echo 
echo "***********SET SYSTEMSLEEP TIME TO 15 MINS**"
echo 
echo
sudo pmset -a displaysleep 15

echo 
echo "***********SET SYSTEMSLEEP TIME TO 20 MINS**"
echo 
echo
sudo pmset -a sleep 20
}

function auto_logout()
{
idleTime=1200
echo
echo "Logout after $idleTime"
echo
sudo defaults write /Library/Preferences/.GlobalPreferences com.apple.securitypref.logoutvalue -int $idleTime
}