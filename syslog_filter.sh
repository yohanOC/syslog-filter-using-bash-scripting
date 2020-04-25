#!/bin/bash

function_list_log() {
        echo -e "\n"
        echo "**********************LIST LOG SWITCH***********************"
        echo -e "\n"
        ls /var/log/ 
        echo -e "\n"
        echo "***************************FINISH***************************"
}

function_find_word_2variable() {   
        echo -e "\n"
        echo "                 TOOLS FIND LOG                         "
        echo -e "\n"
        echo "***********************START****************************"
        echo -e "\n"
        variable=0
        echo -e "Input number of variable used in numeric ( max 2 variable): \c"
        read variable

        if [ $variable == 1 -o $variable == 2 ] 
        then
                if [ $variable == 1 ] 
                then
                        echo "********************************************************"
                        echo -e "Input log file name be search (ex --> 192.168.2.1 *to find file list please chose option 1) press enter: \c"
                        read file
                        echo "********************************************************"
                        echo -e "Input key word (ex--> flap ) press enter: \c"
                        read word
                        echo "********************************************************"
                        echo -e "\n"
                        export GREP_OPTIONS='--color=auto' GREP_COLOR='100;8'
                        more /var/log/$file.log | grep -i "$word"
                        echo -e "\n"    
                        echo "***********************FINISH***************************"
                        echo -e "\n"
                else
                        echo "********************************************************"
                        echo -e "Chose 1 one for both of them equal, 2 for enqual: \c"
                        read opsi
                        if [ $opsi == 1 -o $opsi == 2 ]
                        then
                                echo "********************************************************"
                                echo -e "Input log file name be search (ex --> 192.168.2.1 *to find file list please chose option 1) press enter: \c"
                                read file
                                echo "********************************************************"
                                echo -e "Input first key word (ex--> Apr atau Apr 25 atau Apr 20 19: ) press enter: \c"
                                read word1 
                                echo "********************************************************"
                                echo -e "Input second key word (ex--> flap ) press enter: \c"
                                read word2
                                echo "********************************************************"
                                echo -e "\n"
                                if [ $opsi == 1 ]
                                then
                                        export GREP_OPTIONS='--color=auto' GREP_COLOR='100;8'
                                        more /var/log/$file.log | grep -i -E "$word1" | grep -i -E "$word2"
                                else
                                        export GREP_OPTIONS='--color=auto' GREP_COLOR='100;8'
                                        more /var/log/$file.log | grep -i -E "$word1" | grep -v -i "$word2"
                                fi
                                echo -e "\n"    
                                echo "***********************FINISH***************************"
                                echo -e "\n"
                        else
                                RED="\033[1;31m"
                                NOCOLOR="\033[0m"
                                echo -e "${RED}Wrong input variable, variable must be in numeric 1 or 2${NOCOLOR}" 
                        fi
                fi
        else
                RED="\033[1;31m"
                NOCOLOR="\033[0m"
                echo -e "${RED}Wrong input variable, variable must be in numeric and max 2${NOCOLOR}"
        fi
}

function_last_update() {
        echo -e "\n"
        echo "***********************START****************************"
        echo -e "\n"
        echo -e "Input log file name be search (ex --> 192.168.2.1 *to find file list please chose option 1) press enter: \c"
        read file
        echo "********************************************************"
        echo -e "\n"
        export GREP_OPTIONS='--color=auto' GREP_COLOR='100;8'
        ls -l /var/log/ | grep -i "$file.log"
        echo -e "\n"    
        echo "***********************FINISH***************************"
        echo -e "\n"
}


function_last_line(){   
        echo -e "\n"
        echo "***********************START****************************"
        echo -e "\n"
        echo -e "Input log file name be search (ex --> 192.168.2.1 *to find file list please chose option 1) press enter: \c"
        read file
        echo "********************************************************"
        echo -e "Input total line wanna to check (ex-->100 it's mean 100 from the last line ) press enter: \c"
        read number
        echo "********************************************************"
        echo -e "\n"
        tail -$number /var/log/$file.log
        echo -e "\n"    
        echo "***********************FINISH***************************"
        echo -e "\n"
}

while true
        do
                clear
                echo "=================================================="
                echo "               TOOLS FIND LOG                    "
                echo "            Created by Yohan N 2020               "
                echo "=================================================="
                echo -e "\n"
                echo "Enter the number and chose the option ex: close session chose 5"
                echo -e "\n"
                echo "1. List log files :"
                echo "2. Search specific word maximum 2 variable"
                echo "3. Last update files :"
                echo "4. Chek line in files :"
                echo "5. quit :"
                echo -e "\n"
                echo -e "Enter your selection : \c"
                read answer
                        case "$answer" in
                                1) function_list_log ;;
                                2) function_find_word_2variable ;;
                                3) function_last_update;;
                                4) function_last_line;;
                                5) exit;;
                        esac
                echo -e "Enter return to continue \c"
                read input
done

