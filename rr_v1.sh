#Last update 9/19/2016 by Daehan Chi.
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
OfficeDmg="Office2011-1459Update_EN-US.dmg"
OfficeUpdateVersion="2011\ 14.5.9\ "
FirefoxUpdateVersion="43.0.4" #http://www.macupdate.com/app/mac/10700/firefox
FlashDmg="AdobeFlashPlayer_23au_a_install.dmg"

#Set system doesn't sleep.
#The reason is that the dafult sleeping time for our lab is 15 mins of display sleep time and 20 mins of system sleep time, and the script won't finish until the time. So if the script running over 20 mins it stops and goto sleep.

source ./functions/functions.sh
source ./functions/update.sh
source ./functions/setup.sh
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
    app_update
	firefox_update
    chrome_update
    flashPlayer_update
    msOffice_update
    repair_permission
}
else [ "$answer" == "n" ]
{
    echo "1. Delete all students accounts"
	echo "2. Update Microsoft Office"
    echo "3. Update Firefox"
    echo "4. Update Chrome"
    echo "5. Update Flash Player"
	echo "6. Execute Appstore Update"
	echo "7. Run repair Permission"
	
    read NUMBERS
    
    for number in $NUMBERS
    do
        if [ "$number" == "1" ] ; then
  	        del_users
		elif [ "$number" == "2" ] ; then
	        msOffice_update
        elif [ "$number" == "3" ] ; then
            firefox_update
        elif [ "$number" == "4" ] ; then
            chrome_update
        elif [ "$number" == "5" ] ; then
            flashPlayer_update
      	elif [ "$number" == "6" ] ; then
   	        app_update
   	    elif [ "$number" == "7" ] ; then
   	        repair_permission
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
elif [ "$power" == "2" ] ; then
{
	sudo shutdown -h now
}
fi