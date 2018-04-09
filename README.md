# Removing Pictures Metadata from your Android phone

This simple script opens your Android camera folder and remove metadata from pictures and videos. However it will preserve the date taken, so you can use softwares to organize your pictures by the date they happened.

You'll need `exiftool` in your Linux. If you don't have it already, execute the command `sudo apt update && sudo apt -y install exiftool`

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
    
    # THIS PART IS OPTIONAL, IT JUST RENAMES THE FILE TO THE FORMAT Year-Month-Day_counter.extension,
    # SO INSTEAD OF IMG_20180701.JPG IT WILL RENAME TO 2018-07-01_01.JPG
    
    exiftool '-FileName<filemodifydate' -d %Y-%m-%d_%.2c.%%e .

If you want to delete everything, including the date of when the pictures were taken, replace the last 2 lines for these ones:

    exiftool -r -v0 -overwrite_original -all= -ext jpg .
    exiftool -r -v0 -overwrite_original -all= -ext mp4 .
    
Add more file extensions in case your mobile device uses different ones.
Save the file and open your terminal.
Go to the folder where you have this file and execute `chmod +x filename`, sou you can make it executable.

# How to use the script

1. Connect your Android device in your USB port and select the MTP File Transfer option in your notification area.
2. Open your terminal, go to the folder where the file is and type `./filename` and press [Enter]

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
