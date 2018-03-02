#!/bin/bash
COMMAND="$@"
if [ "$COMMAND" != "" ]; then
printf "\nDo you want to run \033[1;31m\"$COMMAND\"\033[0m y/N?\n"
        read a
                if [[ $a == "Y" || $a == "y" ]]; then
                   mkdir -p roles/$COMMAND/tasks
                   mkdir -p roles/$COMMAND/handlers
                   mkdir -p roles/$COMMAND/templates
                   mkdir -p roles/$COMMAND/files
                   mkdir -p roles/$COMMAND/vars
                   mkdir -p roles/$COMMAND/defaults
		   echo "---" > $COMMAND.yml
		   echo "- hosts: $COMMAND " >> $COMMAND.yml
		   echo "  remote_user:  root" >> $COMMAND.yml
		   echo "  roles:" >> $COMMAND.yml
		   echo "    - $COMMAND" >> $COMMAND.yml
		   echo "..." >> $COMMAND.yml
		   touch roles/$COMMAND/tasks/main.yml
		   touch roles/$COMMAND/defaults/main.yml
		   touch roles/$COMMAND/tasks/firewall.yml
		   touch roles/$COMMAND/tasks/ntp_slave.yml

	else 
		exit
	fi
else
	echo "zadej jmeno adresare";
fi
