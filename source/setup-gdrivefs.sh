#!/bin/bash
echo ""
echo "   How to mount your web based google drive onto your raspberry pi"
echo "   ==============================================================="
echo "         Written by Claude Pageau email: pageauc@gmail.com"
echo "    For more details see https://github.com/dsoprea/GDriveFS"
echo ""
echo "These GDriveFS install instructions can be found at"
echo "https://www.raspberrypi.org/forums/viewtopic.php?p=753018#p753018"
echo ""
echo "This is the simplest way I have found to connect your google drive to the RPI"
echo "Login to your raspberry pi using putty ssh or desktop terminal session"
cd ~
echo "make sure your RPI is up to date.  Note you may not need upgrade."
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python-pip
echo "Note the command below will take a while to install so be patient"
sudo pip install gdrivefs
sudo mkdir /mnt/gdrivefs
sudo ln -s /usr/local/bin/gdfs /sbin/mount.gdfs
echo "Once install complete We need to create authorization credentials"
echo "with your google account on the web"
echo "This will allow you mount your google drive onto your RPI."
echo "This will require cutting and pasting to/from a browser session on your PC."
echo "You may also be able to do this from a RPI desktop browser as long as"
echo "you can login to your gmail account, eg gmail."
echo "The command below will return a long web url."
gdfstool auth -u
echo "1 - In PC putty terminal use mouse to highlight the url text (do not hit enter)"
echo "2 - On the PC open chrome browser and make sure you are logged"
echo "    into your google account.  Eg gmail"
echo "3 - On the PC in chrome browser url box at top of browser"
echo "    right click and paste url into the browser url box then press Enter."
echo "4 - This should give you a web page that asks you to accept the permissions."
echo "5 - Accept the permissions to get a screen with a security token."
echo "    Right click in the box and copy the security token"
echo "6 - On the raspberry pi putty or terminal session"
echo "    execute the following command to create a credential file"
echo 'gdfstool auth -a /home/pi/gdfs.creds "paste-token-here-with-quotes"'
echo "7 - paste (right click) the token inside the quotes in command above"
echo "    leave the double quotes but remove the place holder texts."
echo "    This will create a /home/pi/gdfs.creds file"
echo "    if that went OK it is now time to mount your google drive"
echo "    to your raspberry pi. Execute the command below"
echo "sudo gdfs -o allow_other /home/pi/gdfs.creds /mnt/gdrivefs"
echo "    list your google drive files with the command below"
echo "ls /mnt/gdrivefs"
echo "    If you wish create a symlink in your /home/pi folder to make"
echo "    it easier to access the /mnt/gdrivefs folder"
echo "ln -s /mnt/gdrivefs /home/pi/gdrivefs"
echo "    list files in the /home/pi/gdrivefs symlink folder"
echo "ls gdrivefs"
echo "    Create a permanent mount that gets connected on boot."
echo "sudo cp /etc/fstab /etc/fstab.bak"
echo "sudo nano /etc/fstab"
echo "    add the following text at the bottom of the /etc/fstab using the"
echo "    nano editor then ctrl-x and y to save"
echo "/home/pi/gdfs.creds /mnt/gdrivefs gdfs allow_other 0 0"
echo "    Reboot to test that it works"
echo "    You can use the new mounted google drive just like a regular RPI folder"
echo "    but there will be a little lag since itis connected via the internet."

