#!/bin/bash

#go to the right directory - MAKE SURE NAS IS MOUNTED
cd /home/deleven/NAS/_Private/GAMING/Pen_and_Paper/

#Download the the D&D 5e Stuff from "thetrove.is"
wget -m -np -c -w 3 --no-check-certificate -R "index.html*" "https://thetrove.is/Books/Dungeons%20%26%20Dragons/5th%20Edition%20%285e%29/"
