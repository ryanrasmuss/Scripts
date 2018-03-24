#!/bin/bash
#  https://misc.flogisoft.com/bash/tip_colors_and_formatting

echo "Needed escape sequences: \e \033 \x1B"
echo "You can replace esc seq in vim like: :%s/\\\\033/\\\\e"

echo -e "Default \033[39mDefault"
echo -e "Default \033[30mBlack"
echo -e "Default \033[31mRed"
echo -e "Default \033[32mGreen"
echo -e "Default \033[33mYellow"
echo -e "Default \033[34mBlue"
echo -e "Default \033[35mMagenta"
echo -e "Default \033[36mCyan"
echo -e "Default \033[37mLight gray"
echo -e "Default \033[90mDark gray"
echo -e "Default \033[91mLight red"
echo -e "Default \033[92mLight green"
echo -e "Default \033[93mLight yellow"
echo -e "Default \033[94mLight blue"
echo -e "Default \033[95mLight magenta"
echo -e "Default \033[96mLight cyan"
echo -e "Default \033[97mWhite"
echo -e "Normal \033[5mBlink \033[25mNormal"
echo -e "\033[5;31mBlink w/ Color\033[0m"
echo "\e[0m Fixes the output to reg"

for i in {0..256}; do
    #echo -e "\033[38;5;${i}m${i}"
    printf "\033[38;5;${i}m${i}\t"
    remainder=$((${i}%5))
    if [ $remainder -eq 0 ]; then
        echo ""
    fi
done
echo ""
echo "\e[0m Fixes the output to reg"
