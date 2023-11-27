#!/bin/bash

#Variables:
#set these before each run

FILETYPE=mp3
#set as "mp3" for conversion or "copy" for straight copy of audio .wav files

ARTIST="Simon & Garfunkel"
#Artist label to be applied to whole album

ALBUM="The Best of Simon & Garfunkel"
#Album label to be applied to whole album

tracks=("The Sound of Silence" "Homeward Bound" "I Am A Rock" "The Dangling Conversation" "Scarborough Fair--Canticle" "The 59th Street Bridge Song--Feelin' Groovy" "A Hazy Shade of Winter" "At the Zoo" "Fakin' It" "Mrs. Robinson" "Old Friends--Bookends" "The Boxer" "Bridge Over Troubled Water" "Cecilia" "The Only Living Boy in New York" "Song for the Asking" "El Condor Pasa--If I Could" "For Emily, Whenever I May Find Her--Live" "America" "My Little Town")
#Enter song titles in order. (Important!)
#These titles will be applied individually.
#put quotes around each entry
#put a space between each quoted entry; no commas

num=( $(seq 1 1 50) )
#this array makes it possible to start at a track other than 1

RDATE="1999"
#Release Date - this date will be added to whole album

LOCATION="/home/$USER/Music"
#location of output; modify to suit

M_FOLDERS="$LOCATION/$ARTIST/$ALBUM/"

INPUT=sr0
#makes it possible to use different devices
#on my computer, sr0 is integrated CD drive; sr1 is external

gio mount cdda://$INPUT/

mkdir "$LOCATION/$ARTIST/"
mkdir "$LOCATION/$ARTIST/$ALBUM/"
#preparing destination (m_folders) for output

i=1; for file in /run/user/1000/gvfs/cdda:host=$INPUT/*; do ffmpeg -i "/run/user/1000/gvfs/cdda:host=$INPUT/Track ${num[(($i-1))]}.wav" -codec $FILETYPE -metadata TRACK="$i" -metadata TITLE="${tracks[(($i-1))]}" -metadata ALBUM="$ALBUM" -metadata DATE=$RDATE -metadata ARTIST="$ARTIST" "$M_FOLDERS/$(printf %02d $i) ${tracks[(($i-1))]}.mp3"; ((i++)); done
#Define i as the starting track number;
#if starting at a track other than 1, edit all three "$i-1" statements, replacing 1 with the starting track number
