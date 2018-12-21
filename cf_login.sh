#!/bin/bash  +x
# Author: Sudheer Veeravalli https://github.com/veersudhir83

declare api_url=https://api.system.aws-usw02-pr.ice.predix.io
declare selectedAccount=""

useProxy() {
    echo -n "Login via Proxy [y/n]: "
	read -r viaProxy
	if [[ "$viaProxy" == "y" ]] ;then
		export http_proxy=http://proxy-tvm.quest-global.com:8080
		export https_proxy=http://proxy-tvm.quest-global.com:8080
	fi
}

chooseAccount() {
	echo -n "Choose the number from below accounts: 
	1) Quest
	2) GE
	3) TechM
	0) Logout
	Your Selection: "
	read -r input	
	selectedAccount=$input	
	loginFunction
}

loginFunction() {
    if [[ $selectedAccount -gt 0 && $selectedAccount -lt 4 ]] ;then
        useProxy
    fi
	# For Quest Account
	if [[ "$selectedAccount" == "1" ]] ;then
		echo "Logging into Predix Account for Quest"
	    user_name=sudheer.veeravalli@quest-global.com
		password=XXXXXX
		login_command="cf login -a $api_url -u $user_name -p $password && cf a"
		eval $login_command
		exit 0;
		
	# For GE Account
	elif [[ "$selectedAccount" == "2" ]] ;then 
		echo "Logging into Predix Account for GE"
	    user_name=sudheer.veeravalli@ge.com
		password=XXXXXX
		login_command="cf login -a $api_url -u $user_name -p $password"
		eval $login_command
		exit 0;
		
	# For TechM Account
	elif [[ "$selectedAccount" == "3" ]] ;then 
		echo "Logging into Predix Account for TechM"
	    user_name=sudheer.veeravalli@techmahindra.com
		password=XXXXXX
		login_command="cf login -a $api_url -u $user_name -p $password"
		eval $login_command
		exit 0;
		
	# For EXIT
	elif [[ "$selectedAccount" == "0" ]] ;then 
		echo "You selected to logout"
		logout_command="cf logout"
		eval $logout_command
	fi
}

helpFunction() {
	echo "Usage : ./cf_login.sh [<option> - Optional]
options:
	-h / --help      : Displays help message
	No Options       : Allows to choose the required accounts
	Number <0 to 3>  : 0 = logout, 1 to 3 are the accounts to login"
	exit 1;
}

if [[ $# == 0 ]]; then
	chooseAccount
elif [[ $# == 1 ]]; then
	if [[ $1 == "-h" || $1 == "--help" ]]; then
		helpFunction	
		exit 1;
	elif [[ $1 -gt -1 && $1 -lt 4 ]]; then
		selectedAccount=$1
		loginFunction
	else 
		echo "Invalid arguments.. See the help below"
		helpFunction
		exit 1;
	fi
	
elif [[ $# -gt 1 ]]; then
    echo "Invalid arguments.. See the help below"
	helpFunction
	exit 1;
fi 
