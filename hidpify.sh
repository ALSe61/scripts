#!/usr/bin/env bash
#                         hidpify.sh                        #
## This script will automate DPI settings for a KDE system ##
#####                        cscs                       #####


# You are powerless. Explain yourself.
#if [ "$EUID" -ne 0 ]
#  then echo "Please run using sudo";
#  exit;
#fi

if [ "$EUID" != 0 ]; then
    sudo "$0" "$@" ;
    exit $? ;
fi

# Cat got your tongue?  
if [ $# -eq 0 ]; then
    echo "No arguments provided";
    echo -e "Options:\n -i for install\n -r for remove";
    exit;
fi

# Who are you anyways
YOU=$(who -am | awk '{print $1}')
# And what do you want?
 read -p "Enter Your DPI: "  DPI
# Generate a "fractional value" (FV) from a 96dpi default (ie: 120 = 1.25)
FV=$(bc <<< "scale = 2;  $DPI / 96")
# And where are your firefox and thunderbird profiles?
FFPRO=$(find /home/$YOU/.mozilla/firefox -name "*.default" -print)
TBPRO=$(find /home/$YOU/.thunderbird/ -name "*.default" -print)
MPPP=$(printf 'user_pref("layout.css.devPixelsPerPx", "'"$FV"'");')

#while getopts 'i:r:' opt ; do

case "$1" in

-i)if

 echo "Thats $DPI DPI and a fractional value of $FV";

# Apply KDE DPI through system settings
 sudo -H -u $YOU kwriteconfig5 --file /home/$YOU/.config/kcmfonts --group "General" --key "forceFontDPI" "$DPI" ;

# Apply SDDM DPI
 echo -e '[X11]\nServerArguments=-nolisten tcp -dpi '"$DPI"'\nEnableHiDPI=true' | tee -a /etc/sddm.conf.d/hidpi.conf ;

# Apply GTK scaling using the FV
 sed -i '$a\' /etc/environment ;
 printf "GDK_SCALE=$FV" >> /etc/environment ;

# Apply Automatic QT scaling which *should* force screen DPI
 sed -i '$a\' /etc/environment ;
 printf "QT_AUTO_SCREEN_SCALE_FACTOR=1" >> /etc/environment ;

# Apply Firefox pixelsperpx using FV
 sudo -H -u $YOU touch -a $FFPRO/user.js ;
 sudo -H -u $YOU sed -i '$a\' $FFPRO/user.js ;
 sudo -H -u $YOU printf "$MPPP" >> $FFPRO/user.js ;

# Apply Thunderbird pixelsperpx using FV
 sudo -H -u $YOU touch -a $TBPRO/user.js ;
 sudo -H -u $YOU sed -i '$a\' $TBPRO/user.js ;
 sudo -H -u $YOU printf "$MPPP" >> $TBPRO/user.js ;

 then echo -e "The following files were modified:\n~/.config/kcmfonts\n/etc/sddm.conf\n/etc/environment\n$FFPRO/user.js\n$TBPRO/user.js" ;
 else echo "Something went wrong! Yell at cscs!" ;
 exit;
 fi;; # install steps

-r) if
 sed -i -e "/$MPPP/d" $TBPRO/user.js ;
 sed -i -e "/$MPPP/d" $FFPRO/user.js ;
 sed -i -e "/GDK_SCALE=$FV/d" /etc/environment ;
 sed -i -e "/QT_AUTO_SCREEN_SCALE_FACTOR=1/d" /etc/environment ;
 rm /etc/sddm.conf.d/hidpi.conf ;
 sudo -H -u $YOU kwriteconfig5 --file /home/$YOU/.config/kcmfonts --group "General" --key "forceFontDPI" "96" ; 
 then echo "Changes reversed" ;
 else echo "Something went wrong! Yell at cscs!" ;
 exit;
 fi ;; # remove steps

#-h) echo -e "Options:\n -i for install\n -r for remove\n -h for these options";;

esac

exit