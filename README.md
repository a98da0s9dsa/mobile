# Removing Pictures Metadata from your Android phone

This simple script opens your Android camera folder and remove metadata from pictures and videos. However it will preserve the date taken, so you can use softwares to organize your pictures by the date they happened.

Create a file in your Linux system with the following content:

    # GO TO MOBILE DIRECTORY
    
    cd /run/user/${UID}/gvfs/mtp*/Internal\ shared\ storage/
    MOBILE=$(pwd)
    
    # REMOVE METADATA CAMERA
    
    echo " "
    echo "======== Deleting Pictures Metadata ..."
    cd "$MOBILE"/DCIM/
    exiftool -r -v0 -overwrite_original -all= -tagsFromFile @ -*date* -ext jpg .
    exiftool -r -v0 -overwrite_original -all= -tagsFromFile @ -*date* -ext mp4 .

If you want to delete everything, including the date of when the pictures were taken, replace the last 2 lines for these ones:

    exiftool -r -v0 -overwrite_original -all= -ext jpg .
    exiftool -r -v0 -overwrite_original -all= -ext mp4 .
    
Add more file extensions in case your mobile device uses different ones.

# How to use the script

1. Save the file and open your terminal.
2. Go to the folder where you have this file and execute `chmod +x filename`, sou you can make it executable.
3. Connect your Android device in your USB port and select the MTP File Transfer option in your notification area.
4. Open your terminal, go to the folder where the file is and type `./filename` and press [Enter]

# Notes

Some Android devices have different folder names for the camera pictures. 
Check yours and update the script if needed :)

# Bonus

I also included in my script to remove all WhatsApp pictures, audio, videos etc. of my mobile device. I have some groups there and the amout of files that goes to my phone is insane.

    # WHATSAPP CLEAN
    
    cd "$MOBILE"/WhatsApp/Media/
    echo " "
    echo "======== Deleting Whatsapp Pictures ..."
    find . -name "*.jpg" -delete -print
    find . -name "*.jpeg" -delete -print
    find . -name "*.opus" -delete -print
    find . -name "*.gif" -delete -print
    echo " "
    echo "======== Deleting Whatsapp Videos ..."
    find . -name "*.mp4" -delete -print
    echo " "
    echo "======== Deleting Whatsapp Documents ..."
    find . -name "*.zip" -delete -print
    find . -name "*.pdf" -delete -print
