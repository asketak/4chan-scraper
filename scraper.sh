#!/usr/bin/env bash

wget -q -O - https://boards.4channel.org/biz/catalog | tr ":" "\n" | egrep -wE '},"[0-9]+"' | rev | cut -d "," -f1 | rev | tr -d "\"" | xargs -I % sh -c 'echo executing thread %; nohup thread-archiver https://boards.4channel.org/biz/thread/% --delay 5 &'

