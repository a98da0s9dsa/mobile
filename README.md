# Removing Pictures Metadata from your Android phone

This simple script opens your Android camera folder and remove metadata from pictures and videos. However it will preserve the date taken, so you can use softwares to organize your pictures by the date they happened.

You'll need `exiftool` in your Linux. If you don't have it already, execute the command `sudo apt update && sudo apt -y install exiftool`

1. Download the file **removeMetadata.sh** to your machine.
2. Open your terminal.
3. Go to the folder where you have this file and execute `chmod +x removeMetadata.sh`, sou you can make it executable.

# How to use the script

1. Connect your Android device in your USB port and select the MTP File Transfer option in your notification area.
2. Open your terminal, go to the folder where the file is and type `./removeMetadata.sh` and press [Enter]

# Notes

Some Android devices have different folder names for the camera pictures. 
Check yours and update the script if needed :)
