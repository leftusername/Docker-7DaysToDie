#!/bin/sh

echo "Current User:"
whoami

wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh sdtdserver

# Install
if [ "$START_MODE" = "0" ]; then
    # Start to create default files
    ./sdtdserver
    ./sdtdserver auto-install
	
	echo "
	
	IMPORTANT:
	
	The server have been installed, now switch between "START_MODE", more info: https://github.com/vinanrra/Docker-7DaysToDie#start-modes
	
	"
fi

# Start server
if [ "$START_MODE" = "1" ]; then
    ./home/stdserver/sdtdserver start
	
	echo "
	
	Starting server...
	Soon you will see all the info
	"
	
    sleep 2m
    ./sdtdserver details
    tail -f /dev/null
fi

# Update to stable
if [ "$START_MODE" = "2" ]; then
    cp -v sdtdserver.cfg.stable lgsm/config-lgsm/sdtdserver/sdtdserver.cfg
	
    ./sdtdserver update
	
	echo "
	IMPORTANT:
	
	The server have been updated, now switch between "START_MODE", more info: https://github.com/vinanrra/Docker-7DaysToDie#start-modes"
	
	exit
fi

# Update to stable and start
if [ "$START_MODE" = "3" ]; then
    cp -v sdtdserver.cfg.stable lgsm/config-lgsm/sdtdserver/sdtdserver.cfg
    ./sdtdserver update
	
	echo "Server updated."
	
    ./sdtdserver start
	
	echo "
	
	Starting server...
	Soon you will see all the info
	"
    sleep 2m
    ./sdtdserver details
    tail -f /dev/null
	
fi

# Update to experimental
if [ "$START_MODE" = "4" ]; then
    cp -v sdtdserver.cfg lgsm/config-lgsm/sdtdserver/sdtdserver.cfg
    ./sdtdserver update
    cp -v serverfiles/serverconfig.xml serverfiles/sdtdserver.xml
	
    echo "
	IMPORTANT:
	
	The server have been updated to EXPERIMENTAL, now switch between "START_MODE", more info: https://github.com/vinanrra/Docker-7DaysToDie#start-modes"
fi

# Update to experimental and start
if [ "$START_MODE" = "5" ]; then
    cp -v sdtdserver.cfg lgsm/config-lgsm/sdtdserver/sdtdserver.cfg
    ./sdtdserver update
    cp -v serverfiles/serverconfig.xml serverfiles/sdtdserver.xml
	
	echo "Server updated."
	
    ./sdtdserver start
	
	echo "
	
	Starting server...
	Soon you will see all the info
	"
	
    sleep 2m
    ./sdtdserver details
    tail -f /dev/null
fi
