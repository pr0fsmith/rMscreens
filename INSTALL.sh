#! /bin/bash
echo "**********************************************************************************"
echo "* This script makes it easier to change your rM screens.  Please plug in your rM *"
echo "* now via usb as a script needs to be installed there as well.  This script also *"
echo "* comes with a number of custom screens that will be copied to                   *"
echo "* ~/Pictures/rMscreens. Add additional png files there for this script to detect.*"
echo "**********************************************************************************"

MY_DIR=$(dirname $0) #Used so that script will work no matter where the script folder is put.

echo "Are you ready to continue?  Make sure your tablet is connect via USB, is on and not in sleep mode."
select CHOICE in Yes Quit
do
	case $CHOICE in
		Yes)
			break
		;;
		Quit)
			exit
		;;
	esac
done
echo "Copying script 'changescrn' to your reMarkable tablet."
scp changescrn root@10.11.99.1:/opt/bin
echo ""
echo "Creating directory for screens"
if [ -d ~/Pictures/rMscreens ]
then
	echo "~/Pictures/rMscreens exists. Copying screens..."
	sudo cp -R screens/* ~/Pictures/rMscreens
else
	sudo mkdir ~/Pictures/rMscreens
	sudo cp -R $MY_DIR/screens/* ~/Pictures/rMscreens	
fi
echo ""
echo "Copying rMscreen script to ~/.local/bin"
sudo cp rMscreen ~/.local/bin
echo ""
echo "All Done! run 'rMscreen' in terminal to launch"