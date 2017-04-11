
#Delete all users including starting two zeros. 
function del_users()
{
echo 
echo "***********REMOVING USER DIRECTORY**********"
echo 
echo
sudo rm -rf /Users/00*
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
