#!/bin/bash

# GO TO MOBILE DIRECTORY

cd /run/user/${UID}/gvfs/mtp*/Internal\ shared\ storage/ || exit
MOBILE=$(pwd)

# REMOVE METADATA CAMERA

echo " "
echo "======== Deleting Pictures Metadata ..."
cd "$MOBILE"/DCIM/ || exit
exiftool -r -v0 -overwrite_original -all= -tagsFromFile @ -*date* -ext jpg .
exiftool -r -v0 -overwrite_original -all= -tagsFromFile @ -*date* -ext mp4 .

# This part is optional, it just renames the file to the format "Year-Month-Day_counter.extension",
# so instead of "IMG_20180701.JPG", it will rename to "2018-07-01_01.JPG", "2018-07-01_02.JPG", etc.
# Comment the below line if you do not want the renaming.

exiftool '-FileName<filemodifydate' -d %Y-%m-%d_%.2c.%%e .

# =============================================================================================================

# If you want to delete everything, including the date of when the pictures were taken,
# replace the first 2 exiftool lines in this code for these ones:

# exiftool -r -v0 -overwrite_original -all= -ext jpg .
# exiftool -r -v0 -overwrite_original -all= -ext mp4 .

# BONUS
# I also included in this script to remove all WhatsApp pictures, audio, videos etc. of my mobile device.
# I have some groups there and the amout of files that goes to my phone is insane.
# Just remove the # from the lines below to activate them.

# cd "$MOBILE"/WhatsApp/Media/ || exit
# echo " "
# echo "======== Deleting Whatsapp Pictures ..."
# find . -name "*.jpg" -delete -print
# find . -name "*.jpeg" -delete -print
# find . -name "*.opus" -delete -print
# find . -name "*.gif" -delete -print
# echo " "
# echo "======== Deleting Whatsapp Videos ..."
# find . -name "*.mp4" -delete -print
# echo " "
# echo "======== Deleting Whatsapp Documents ..."
# find . -name "*.zip" -delete -print
# find . -name "*.pdf" -delete -print

