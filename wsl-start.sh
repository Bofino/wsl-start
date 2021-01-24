#!/bin/bash
#********************************************#
#                 WSL START                  #
#              author: Bofino                #
#               JANUARY,2021                 #
#                                            #
#        the WSL Ubuntu fast setup           #
#********************************************#
# DO NOT MODIFY THE CODE !!!
clear
#
# VARIABLES
## COLOR VARIABLES:
RECOLOR='\033[0m'
RED='\033[1;31m'
GREEN='\033[01;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'
# FUNCTIONS
## PAUSE
function pause
{
    read -p "$*"
    clear
}
## MUST HAVE SOFTWARE
function musthaveSoftware () {
        for package in software-properties-common apt-transport-https ca-certificates build-essential lsb-release lsb-core autoconf gnupg2 curl make gcc g++ mc; do
        dpkg -s "$package" >/dev/null 2>&1 && {
                echo -e "${RECOLOR}"
                echo -e "${PURPLE}| ${YELLOW}$package ${CYAN}— is ${GREEN}already ${CYAN}installed. ${PURPLE}|"
                echo -e "${RECOLOR}"
        } || {
                echo -e "${RECOLOR}"
                echo -e "${PURPLE}| ${YELLOW}$package ${CYAN}— ${RED}will be ${CYAN}install. ${PURPLE}|"
                echo -e "${RECOLOR}"
                sudo apt-get -y install $package
                echo -e "${RECOLOR}"
                echo -e "${PURPLE}| ${YELLOW}$package ${CYAN}— was ${GREEN}successfully ${CYAN}installed. ${PURPLE}|"
                echo -e "${RECOLOR}"
        }
done
}
## FUNCTION GIT INSTALL
function gitWare () {
        for package in git; do
        dpkg -s "$package" >/dev/null 2>&1 && {
                echo -e "${RECOLOR}"
                echo -e "${PURPLE}| ${YELLOW}$package ${CYAN}— is ${BLUE}already ${CYAN}installed. ${PURPLE}|"
                echo -e "${RECOLOR}"
        } || {
                echo -e "${RECOLOR}"
                echo -e "${PURPLE}| ${YELLOW}$package ${CYAN}— ${LIGHTGRAY}will be ${CYAN}install. ${PURPLE}|"
                echo -e "${RECOLOR}"
                sudo add-apt-repository -y ppa:git-core/ppa
                sudo apt-get -y update
                sudo apt-get install $package
                echo -e "${RECOLOR}"
                echo -e "${PURPLE}| ${YELLOW}$package ${CYAN}— was ${GREEN}successfully ${CYAN}installed. ${PURPLE}|"
                echo -e "${RECOLOR}"
        }
done
}
## FUNCTION NODEJS INSTALL
function nodejsWare () {
        for package in nodejs; do
        dpkg -s "$package" >/dev/null 2>&1 && {
                echo -e "${RECOLOR}"
                echo -e "${PURPLE}| ${YELLOW}$package ${CYAN}— is ${BLUE}already ${CYAN}installed. ${PURPLE}|"
                echo -e "${RECOLOR}"
        } || {
                echo -e "${RECOLOR}"
                echo -e "${PURPLE}| ${YELLOW}$package ${CYAN}— ${LIGHTGRAY}will be ${CYAN}install. ${PURPLE}|"
                echo -e "${RECOLOR}"
                curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
                sudo apt-get -y update
                sudo apt-get install $package
                echo -e "${RECOLOR}"
                echo -e "${PURPLE}| ${YELLOW}$package ${CYAN}— was ${GREEN}successfully ${CYAN}installed. ${PURPLE}|"
                echo -e "${RECOLOR}"
        }
done
}
## FUNCTION YARN INSTALL
function yarnWare () {
        for package in yarn; do
        dpkg -s "$package" >/dev/null 2>&1 && {
                echo -e "${RECOLOR}"
                echo -e "${PURPLE}| ${YELLOW}$package ${CYAN}— is ${BLUE}already ${CYAN}installed. ${PURPLE}|"
                echo -e "${RECOLOR}"
        } || {
                echo -e "${RECOLOR}"
                echo -e "${PURPLE}| ${YELLOW}$package ${CYAN}— ${LIGHTGRAY}will be ${CYAN}install. ${PURPLE}|"
                echo -e "${RECOLOR}"
                curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
                echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
                sudo apt-get -y update
                sudo apt-get install $package
                echo -e "${RECOLOR}"
                echo -e "${PURPLE}| ${YELLOW}$package ${CYAN}— was ${GREEN}successfully ${CYAN}installed. ${PURPLE}|"
                echo -e "${RECOLOR}"
        }
done
}
#
## FUNCTION DEVELOPMENT SOFTWARE INSTALL
function devWare () {
        PS3="Select the choice: "

printf "\n	${YELLOW}Please, select the number (${PURPLE} recommended ${GREEN}4 ${YELLOW}) and hit ${CYAN}ENTER ${YELLOW}.${RECOLOR}\n\n"

select electo in 'GIT INSTALLATION' 'NODEJS INSTALLATION' 'YARN INSTALLATION' 'ALL INSTALLATION' 'EXIT AND START ANOTHER INSTALLATION' 'EXIT AND CANCEL ANY INSTALLATION'; do

  case $electo in
    "GIT INSTALLATION")
      gitWare
      ;;
    "NODEJS INSTALLATION")
      nodejsWare
      ;;
    "YARN INSTALLATION")
      yarnWare
      ;;
    "ALL INSTALLATION")
      gitWare
      nodejsWare
      yarnWare
      break
      ;;
    "EXIT AND START ANOTHER INSTALLATION")
      echo -e "${RECOLOR}"
      echo -e "${YELLOW}        REALLY? ${RED}DON'T FORGET ${YELLOW}- YOU NEED ${GREEN}GIT ${YELLOW}AND ${GREEN}NODEJS ${YELLOW}FOR THE ${GREEN}DEVELOPMENT"
      echo -e "${RECOLOR}"
      replayDevware
      break
      ;;
    "EXIT AND CANCEL ANY INSTALLATION")
      echo -e "${RECOLOR}"
      echo -e "${YELLOW}        REALLY? ${RED}DON'T FORGET ${YELLOW}- YOU NEED ${GREEN}GIT ${YELLOW}AND ${GREEN}NODEJS ${YELLOW}FOR THE ${GREEN}DEVELOPMENT"
      echo -e "${RECOLOR}"
      replayDevware
      break
      ;;
    *)
      echo -e "${RED}Wrong NUMBER"
      echo -e "${RECOLOR}"
      ;;
  esac
done
}
## FUNCTION RETURN TO DEVELOPMENT SOFTWARE INSTALLATION
function replayDevware () {
        PS3="Select the choice: "

printf "        \n${YELLOW}Do you want ${GREEN}return ${YELLOW}to the ${GREEN}previous ${YELLOW}installation ${GREEN}MENU ${YELLOW}?${RECOLOR}\n\n"

select electotwo in 'RETURN TO PREVIOUS MENU' 'GO TO NEXT STEP' 'EXIT AND CANCEL ANY INSTALLATION'; do

  case $electotwo in
    "RETURN TO PREVIOUS MENU")
      devWare
      break
      ;;
    "GO TO NEXT STEP")
      break
      ;;
    "EXIT AND CANCEL ANY INSTALLATION")
      clear
      exit 0
      ;;
    *)
      echo -e "${RED}Wrong NUMBER"
      echo -e "${RECOLOR}"
      ;;
  esac
done
}
## CONTENT
## THE MESSAGE ONE
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}Hello ${YELLOW}$USER ${CYAN}!!! In first, the system must be updated and upgraded ${PURPLE}|"
echo -e "${RECOLOR}"
pause "Press enter to continue..."

cd

sudo apt-get -y update && sudo apt-get -y upgrade

clear

## THE MESSAGE TWO
echo -e "${RECOLOR}"
echo -e "	${PURPLE} --------------------------------------------------"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}The system was ${GREEN}successfully ${CYAN}updated and upgraded ${PURPLE}|"
echo -e "${RECOLOR}"
echo -e "	${PURPLE} --------------------------------------------------"
echo -e "${RECOLOR}"
pause "Press enter to continue..."

## THE MESSAGE THREE
echo -e "${RECOLOR}"
echo -e "	${PURPLE} ----------------------------------------------------"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${GREEN}UTF-8 ${CYAN}must be ${GREEN}set up ${CYAN}to avoid any ${GREEN}encoding ${CYAN}problem ${PURPLE}|"
echo -e "${RECOLOR}"
echo -e "	${PURPLE} ----------------------------------------------------"
echo -e "${RECOLOR}"
pause "Press enter to continue..."

sudo apt-get -y install language-pack-en-base

export LC_ALL=en_US.UTF-8

export LANG=en_US.UTF-8

clear

echo -e "${RECOLOR}"
echo -e "	${PURPLE} --------------"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${GREEN}SUCCESSFULLY ${PURPLE}|"
echo -e "${RECOLOR}"
echo -e "	${PURPLE} --------------"
echo -e "${RECOLOR}"

pause "Press enter to continue..."

echo -n ""
echo -e "${RECOLOR}"
echo -e "${PURPLE} 	 ---------------------------------------"
echo -e "${RECOLOR}"
echo -e "${PURPLE}	| ${CYAN}NEXT GREAT ${YELLOW}PACKAGES ${CYAN}WILL BE INSTALLED ${PURPLE}|"
echo -e "${RECOLOR}"
echo -e "${PURPLE} 	 ---------------------------------------"
echo -e "${RECOLOR}"
echo -n ""
echo -n ""
echo -e "	${PURPLE} ---------------------------------------"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}01. ${YELLOW}software-properties-common ${PURPLE}------ |"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}02. ${YELLOW}apt-transport-https ${PURPLE}------------- |"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}03. ${YELLOW}ca-certificates ${PURPLE}----------------- |"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}04. ${YELLOW}build-essential ${PURPLE}----------------- |"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}05. ${YELLOW}lsb-release ${PURPLE}--------------------- |"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}06. ${YELLOW}lsb-core ${PURPLE}------------------------ |"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}07. ${YELLOW}autoconf ${PURPLE}------------------------ |"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}09. ${YELLOW}curl ${PURPLE}---------------------------- |"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}10. ${YELLOW}make ${PURPLE}---------------------------- |"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}11. ${YELLOW}gcc ${PURPLE}----------------------------- |"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}12. ${YELLOW}g++ ${PURPLE}----------------------------- |"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}13. ${YELLOW}mc ${PURPLE}------------------------------ |"
echo -e "${RECOLOR}"
echo -e "	${PURPLE} ---------------------------------------"
echo -e "${RECOLOR}"
pause "Press enter to continue..."

musthaveSoftware

pause "Press enter to continue..."

echo -e "${RECOLOR}"
echo -e "	${PURPLE} -----------------------------------------------"
echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}The final step -  Install ${GREEN}Git${CYAN}, ${GREEN}Nodejs${CYAN}, ${GREEN}Yarn${CYAN} : ${PURPLE}|"
echo -e "${RECOLOR}"
echo -e "	${PURPLE} -----------------------------------------------"
echo -e "${RECOLOR}"

devWare

pause "Press enter to continue..."

echo -e "${RECOLOR}"
echo -e "	${PURPLE}| ${CYAN}Dear ${GREEN}$USER ${CYAN}!!! — THE SYSTEM IS UPDATED UNDER YOURS NEEDS. BYE!!! ${PURPLE}|"
echo -e "${RECOLOR}"
