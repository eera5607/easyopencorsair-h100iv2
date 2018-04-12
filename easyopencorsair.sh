#! /bin/bash
#cd to the folder where you compiled it
cd /opt/ocl
echo "Choose an option: 1. Pump mode 2. Temps vs Fan speeds"
read OPCION 
COLOR1='\033[1;32m'
COLOR2='\033[1;31m'
NC='\033[0m' 
if [ $OPCION = 1 ]
then
	echo "Choose a mode: 1. Silent - 2. Performance"
	read PMODE 
	if [ $PMODE = 1 ] 
	then
	sudo ./OpenCorsairLink.elf --device 0 --pump-mode 3 && echo -e "${COLOR1}Silent mode active${NC}"
	sleep 5
	PSPEED=$(sudo ./OpenCorsairLink.elf --device 0  | grep "Pump Speed")
	echo -e "${COLOR2}$PSPEED${NC}"
	elif [ $PMODE = 2 ]
	then
	sudo ./OpenCorsairLink.elf --device 0 --pump-mode 5 && echo -e "${COLOR1}Performance mode active${NC}"
	sleep 5
	PSPEED=$(sudo ./OpenCorsairLink.elf --device 0  | grep "Pump Speed")
	echo -e "${COLOR2}${PSPEED}${NC}"
	else
	echo "Elija una opcion correcta"
	exit 1
	fi
elif [ $OPCION = 2 ]
	then
	echo "Choose the profile: 1. Silent- 2. Balanced - 3. Performance."
	read CMODE
	if [ $CMODE = 1 ]
	then
	sudo ./OpenCorsairLink.elf --device 0 --fan-temps 20,25,29,33,37,40 --fan-speeds 25,25,30,40,50,60 && echo -e "${COLOR1}Silent profile active${NC}"
	sleep 5
	FSPEED=$(sudo ./OpenCorsairLink.elf --device 0  | grep "Fan Speed" | sed 's/ 0//')
	echo -e "${COLOR2}${FSPEED}${NC}"
	elif [ $CMODE = 2 ]
	then
	sudo ./OpenCorsairLink.elf --device 0 --fan-temps 20,25,29,33,37,40 --fan-speeds 30,40,50,60,70,80 && echo -e "${COLOR1}Balanced profile active${NC}"
	sleep 5
	FSPEED=$(sudo ./OpenCorsairLink.elf --device 0  | grep "Fan Speed" | sed 's/ 0//')
	echo -e "${COLOR2}${FSPEED}${NC}"
	elif [ $CMODE = 3 ]
	then
	sudo ./OpenCorsairLink.elf --device 0 --fan-temps 20,25,29,33,37,40 --fan-speeds 40,50,60,70,80,100 && echo -e "${COLOR1}Performance profile active${NC}"
	sleep 5
	FSPEED=$(sudo ./OpenCorsairLink.elf --device 0  | grep "Fan Speed" | sed 's/ 0//')
	echo -e "${COLOR2}${FSPEED}${NC}"
	else
	echo "Choose a correct option"
	exit 2
	fi
else
echo "Choose a correct option"
exit 3
fi
/bin/bash
