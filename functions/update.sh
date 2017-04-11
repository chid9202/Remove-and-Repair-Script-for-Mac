#Update Flash Player
function flashPlayer_update()
{
echo "Updating Flash Player..."
hdiutil mount ./installers/AdobeFlashPlayer_23au_a_install.dmg
cd /Volumes/Adobe\ Flash\ Player\ Installer/Install\ Adobe\ Flash\ Player.app/Contents/MacOS/
./Install\ Adobe\ Flash\ Player -install
hdiutil unmount /Volumes/Adobe\ Flash\ Player\ Installer
}

#Update softwares in appstore
function app_update()
{
echo 
echo "Updating apple software..."
echo 
softwareupdate -i -a
}
function msOffice_update()
{
echo 
echo "Updating Microsoft Office..."
echo 
hdiutil mount ./installers/$OfficeDmg.dmg
installer -package /Volumes/Microsoft\ Office\ $OfficeUpdateVersion Update/Office\ $OfficeUpdateVersion Update.pkg -target "/Volumes/Macintosh HD"
hdiutil unmount /Volumes/Microsoft\ Office\
}
function firefox_update()
{
echo
echo "Updating Firefox..."
echo
hdiutil mount /Users/admin/Desktop/Firefox\ $FirefoxUpdateVersion.dmg
cp -R /Volumes/Firefox/firefox.app /Application
hdiutil unmount /Volumes/Firefox
}
function chrome_update()
{
echo
echo "Updating Chrome..."
echo
hdiutil mount ../installers/googlechrome.dmg
cp -R /Volumes/Google\ Chrome/Google\ Chrome.app /Application
hdiutil unmount /Volumes/Google\ Chrome/
}