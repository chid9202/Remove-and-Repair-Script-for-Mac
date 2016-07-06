#Last update 2:52 1/8/2016 by Daehan Chi.
#-----------------------INSTRUCTION------------------------------------------
#The purpose of this script is to update and maintains perfect condition.
#This functions are followings:
#1.Delete all students account. They are mostly unnessesary and take storages.
#Each of them are quite small but if they are piled more than 2 quaters, it matters.
#2.Update Microsoft Office. Since Microsoft Office update is not available on terminal,
#you have to download the .dmg file manually **ON THE SAME DIRECTORY OF THE SCRIPT **
#3.Update all software in apple store. The computer needs to be restarted after the update.
#4.It run repair permissions on disk utility.


#!/bin/bash
OfficeDmg="Office2011-1459Update_EN-US"
OfficeUpdateVersion="2011\ 14.5.9\ "
FirefoxUpdateVersion="43.0.4" #http://www.macupdate.com/app/mac/10700/firefox
#Set system doesn't sleep.
#The reason is that the dafult sleeping time for our lab is 15 mins of display sleep time and 20 mins of system sleep time, and the script won't finish until the time. So if the script running over 20 mins it stops and goto sleep.
function prev_set()
{
echo 
echo "***********SET SYSTEMSLEEP TIME TO NEVER****"
echo 
echo
sudo pmset sleep 0                        

#Set display doesn't sleep.
echo 
echo "*********SET DISPLAY SLEEP TIME TO NEVER****"
echo 
echo 
sudo pmset displaysleep 0                 
}
#Delete all users including starting two zeros. 
function del_users()
{
echo 
echo "***********REMOVING USER DIRECTORY**********"
echo 
echo
sudo rm -rf /Users/00*
}
#Update microsoft office. the .dmg file must be with Desktop of admin
#Version of .dmg fle should be updated manually so far.
function mic_update()
{
echo 
echo "****************MICROSOFT UPDATE************"
echo 
echo
hdiutil mount Users/admin/Desktop/$OfficeDmg.dmg
#sudo installer -package /Volumes/Microsoft\ Office\ 2011\ 14.5.9\ Update/Office\ 2011\ 14.5.9\ Update.pkg -target "/Volumes/Macintosh HD"
sudo installer -package /Volumes/Microsoft\ Office\ $OfficeUpdateVersion Update/Office\ $OfficeUpdateVersion Update.pkg -target "/Volumes/Macintosh HD"
hdiutil unmount /Volumes/Microsoft\ Office\ $OfficeUpdateVersion Update/
}
#Update softwares in appstore
function app_update()
{
echo 
echo "***********UPDATING SOFTWARES***************"
echo 
echo
sudo softwareupdate -i -a
}
#Run repair Permissions. It makes computer run faster.
function repair_permission()
{
echo 
echo "***********REPAIRING PERMISSIONS************"
echo 
echo
sudo diskutil repairPermissions "Macintosh HD"
}
function firfox_update()
{
echo
echo "*******""***FIREFOX UPDATE******************"
echo
hdiutil mount /Users/admin/Desktop/Firefox\ $FirefoxUpdateVersion.dmg
cp -R /Volumes/Firefox/firefox.app /Application
}
#Change the power management setting to the default.
function aft_set()
{
echo 
echo "***********SET SYSTEMSLEEP TIME TO 15 MINS**"
echo 
echo
sudo pmset displaysleep 15

echo 
echo "***********SET SYSTEMSLEEP TIME TO 20 MINS**"
echo 
echo
sudo pmset sleep 20
}
#Turn power off.
function shutdown()
{
echo 
echo "***********SYSTEM SHUTING DOWN SOON*********"
echo 
sudo shutdown -h now
}

#               UI      

echo “Run the entire script? \(y/n\)”
read answer

echo "1.Restart after the script"
echo "2.Turn power off"
echo "3.leave it"
read power
#              SCRIPT
prev_set
if [ "$answer" == "y" ] ; then
{    
    del_users
    mic_update
    app_update
	firfox_update
    repair_permission
}
else [ "$answer" == "n" ]
{
    echo "1. Delete all students accounts"
	echo "2. Update Microsoft Office"
	echo "3. Execute Appstore Update"
	echo "4. Run repair Permission"
	echo "5. Update Firefox"
    read NUMBERS
    
    for number in $NUMBERS
    do
        if [ "$number" == "1" ] ; then
  	        del_users
		elif [ "$number" == "2" ] ; then
	        mic_update
      	elif [ "$number" == "3" ] ; then
   	        app_update
   	    elif [ "$number" == "4" ] ; then
   	        repair_permission
		elif [ "$number" == "5" ] ; then
			firfox_update
   	    fi
    done
}
fi
aft_set

say "Script is over"

if [ "$power" == "1" ] ; then
{
	sudo shutdown -r now
}
else [ "$power" == "2" ] ; then
{
	sudo shutdown -h now
}
fi