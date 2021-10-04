#!/bin/sh
echo "JetBrainsMono, Meslo, FiraMono FONTS"

font_dir="/usr/share/fonts/truetype/NerdFonts"
jetbrains="$font_dir/JetBrainsMono"
fira="$font_dir/FiraMono"
meslo="$font_dir/Meslo"

if [ ! -d "${font_dir}" ]; then
mkdir -p $font_dir

    if [ ! -d "${jetbrains}" ]; then
    mkdir -p $jetbrains
    cd $jetbrains
    wget -P $jetbrains "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip" && unzip *.zip -x \*\Compatible\.ttf && rm -fr *.zip
    fi
    if [ ! -d "${fira}" ]; then
    mkdir -p $fira
    cd $fira
    wget -P $fira "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip" && unzip *.zip -x \*\Compatible\.otf && rm -fr *.zip
    fi       
    if [ ! -d "${meslo}" ]; then
    mkdir -p $meslo
    cd $meslo
    wget -P $meslo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip" && unzip *.zip -x \*\Compatible\.ttf && rm -fr *.zip
    fi

fc-cache -vf $font_dir
else
echo "Fonts alredy install!" && exit
fi
exit