#!/bin/bash

up_line(){
        local chong=90
        local text="$1"
        local text_len=${#text}

        local num1=$((chong - text_len - 4))

        if [ $((num1 % 2)) -ne 0 ]; then
                text="$text "
                num1=$((num1 - 1))
        fi

        local num3=$((num1 / 2))

        local side_line=""
        if [ $num3 -gt 0 ]; then
                side_line=$(printf "%${num3}s" | tr ' ' '-')
        fi
        echo ""

        echo -e "\e[1;34m╭${side_line}[\e[1;37m${text}\e[1;34m]${side_line}╮\e[0m"

        echo ""
}

down_line(){
        echo -e "\e[1;34m╰────────────────────────────────────────────────────────────────────────────────────────╯\e[0m"
}


# 초록색(해커 색상)으로 배너 출력
echo -e "\e[1;31m"
cat << 'EOF'
    ____               __  __                      
   / __ \ ___   _____ / /_/ /_   ____ _ _   ______ 
  / /_/ // _ \ / ___// __/ __ \ / __ `/| | / / __ \
 / ____//  __// /__ / /_/ / / // /_/ / | |/ / /_/ /
/_/     \___/ \___/ \__/_/ /_/ \__,_/  |___/\__,_/ 

                [ Version 1.0.0 ]
EOF
echo -e "\e[0m" # 색상 초기화


up_line "sudo -l"
sudo -l | grep -v "Matching"
down_line

up_line "Cron Tab"
cat /etc/crontab
down_line

up_line "SUID FILE"
sudo find / -path /proc -prune -o -perm -4000 -type f 2>/dev/null
down_line
