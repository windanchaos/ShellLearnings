#!/bin/bash

function DetectInput   		# 判断输入的数据，控制方向
{
	while [[ 1 ]]
	do
		c=""
		read -n 1 c 		# 读取输入的字母
		echo -ne "\r \r"  	# 清除输入的字母
		if [[ $c == "a" || $c == "j" || $c == "A" || $c == "J" ]]
		then
			kill -36 $pidShowSnake   # 改变贪吃蛇的运动轨迹
		elif [[ $c == "w" || $c == "i" || $c == "W" || $c == "I" ]]
		then
			kill -37 $pidShowSnake
		elif [[ $c == "d" || $c == "l" || $c == "D" || $c == "L" ]]
		then
			kill -38 $pidShowSnake
		elif [[ $c == "s" || $c == "k" || $c == "S" || $c == "K" ]]
		then
			kill -39 $pidShowSnake
		elif [[ $c == "q" || $c == "Q" ]]
		then
			echo Quit.
			kill -40 $pidShowSnake
			exit
		fi
	done
}

function info () {   			# 游戏结束时的提示信息
	title=$1
	content=$2
	greeting=$3
	printf "\033[31m"
	printf "\033[11;17H------------------------------------------"
	printf "\033[12;17H|       =======>>$title<<======       | "
	printf "\033[13;17H|       $content      |"
	printf "\033[14;17H|       =======>>$greeting<<=======      | "
	printf "\033[15;17H------------------------------------------"
	printf "\033[0m"
}

function AllExit  				# 退出程序
{
	kill -40 $pidShowSnake
	exit
}

if [[ $1 != "--showsnake" ]]   	# 判断脚本的执行参数
then
	eval $0" --showsnake "$$"&"
	trap "exit" TERM
	trap "AllExit" INT
	pidShowSnake=$!
	DetectInput
	exit
else
	pidCtlSnake=$2
fi
#echo sub
#(( iSpeed=500 - ${#iX[@]} * 10 )) #time interval in millisecond
iSpeed=800    					# 初始化一些参数
iDirection=0 #1-left, 2-up, 3-right, 4-down
iWidth=17
iHeight=16
iX=(6 7 8)
iY=(7 7 7)
iMap=()
iS=0 #Start pointer in iX
(( iTotalBox = iWidth * iHeight ))
for (( i = 0; i < iTotalBox; i++ ))
do
	(( iMap[$i] = 0 ))
done

function RandomHeader   	# 随机产生贪吃蛇要吃的果实位置
{
	(( iNew = RANDOM % ( iTotalBox - ${#iX[@]} ) ))
	for (( iNewP = 0, i = 0; iNewP < iTotalBox && i < iNew; iNewP++))
	do
		if (( ${iMap[$iNewP]} != 1 )); then (( i++ )); fi
	done
	while (( ${iMap[$iNewP]} == 1 )); do (( iNewP++ )); done
	(( iNewX = iNewP % iWidth ))
	(( iNewY = (iNewP - iNewX) / iWidth ))
	echo -ne "\033[1m\033[35m"
	(( pX = 2 * iNewX + iLeft + 1 ))
	(( pY = iNewY + iTop + 1 ))
	echo -ne "\033["$pY";"$pX"H[]"
	echo -ne "\033["$iCursor";1H"
	echo -ne "\033[0m"
}

function InitDraw  	# 初始化程序界面
{
	clear
	(( iTop = 6 ))
	(( iBottom = iTop + iHeight + 1 ))
	(( iLeft = 1 ))
	(( iRight = iLeft + iWidth + iWidth + 1 ))
	(( iCursor = iBottom + 1 ))
	echo -ne "\033[31m"
	echo -ne "\033[2;29H====ShowSnake===="
	echo -ne "\033[5;15HGame Area"
	echo -ne "\033[5;50HContent Area"
	echo -ne "\033[32m"
	for (( i = iLeft + 1; i < iWidth * 2 + iWidth * 2 + iLeft + 4; i++ ))
	do
		echo -ne "\033[1;"$i"H-"
		echo -ne "\033[4;"$i"H-"
		echo -ne "\033["$iTop";"$i"H-"
		echo -ne "\033["$iBottom";"$i"H-"
	done
	for (( i = 1; i < iHeight + iTop + 2; i++ ))
	do
		echo -ne "\033["$i";"$iLeft"H|"
		echo -ne "\033["$i";72H|"
		if (( i > 3 ))
		then
			echo -ne "\033["$i";"$iRight"H|"
		fi
		if (( i == 7 )); then echo -ne "\033["$i";40HSorce :00";
		elif (( i ==9 )); then echo -ne "\033["$i";40HSpeed :00s/m";
		elif (( i ==11 )); then echo -ne "\033["$i";40HLevel :01";
		elif (( i ==13 )); then echo -ne "\033["$i";40HAuthor:GTSC Hu Changwen";
		elif (( i ==15 )); then echo -ne "\033["$i";40HMail  :hucw@dne.com.cn";
		elif (( i ==17 )); then echo -ne "\033["$i";40HVer   :2.0";
		elif (( i ==19 )); then echo -ne "\033["$i";40HHelp  :[w]  up    [s]  down";
		elif (( i ==20 )); then echo -ne "\033["$i";40H       [a]  left  [d]  right"; fi;
	done
	echo -ne "\033["$iCursor";1H"
	echo -ne "\033[0m"
	echo -ne "\033[1m\033[33m"
	for (( i = 0; i < ${#iX[@]}; i++ ))
	do
		(( pX = 2 * ${iX[$i]} + iLeft + 1 ))
		(( pY = ${iY[$i]} + iTop + 1 ))
		(( pM = ${iY[$i]} * iWidth + ${iX[$i]} ))
		(( iMap[$pM] = 1 ))
		echo -ne "\033["$pY";"$pX"H[]"
		#echo ${iX[$i]}
	done
	echo -ne "\033["$iCursor";1H"
	echo -ne "\033[0m"
	RandomHeader
}

function ShiftSnake 		# 贪吃蛇移动时的效果函数
{
	(( iLastP = iS - 1 ))
	if (( iLastP < 0 )); then ((iLastP = ${#iX[@]} - 1 )); fi
	if (( iDir == 1 )) 		# left
	then
		(( iHX = ${iX[$iLastP]} - 1 ))
		(( iHY = ${iY[$iLastP]} ))
	elif (( iDir == 2 )) 	# up
	then
		(( iHX = ${iX[$iLastP]} ))
		(( iHY = ${iY[$iLastP]} - 1 ))
	elif (( iDir == 3 )) 	# right
	then
		(( iHX = ${iX[$iLastP]} + 1 ))
		(( iHY = ${iY[$iLastP]} ))
	elif (( iDir == 4 )) 	# down
	then
		(( iHX = ${iX[$iLastP]} ))
		(( iHY = ${iY[$iLastP]} + 1 ))
	fi
	bOver=0
	if (( iHX < 0 || iHY < 0 || iHX >= iWidth || iHY >= iHeight )); then bOver=1;fi
	if (( bOver == 0 )); then
		if (( ${iMap[iHY * iWidth + iHX]} == 1 )); then bOver=1; fi
	fi
	if (( bOver == 1 ))
	then
		kill $pidCtlSnake
		(( iBottom = iBottom + 1 ))
		#echo -e "\033["$iBottom";0HGame over! (Score: "${#iX[@]}"00)\033[0m"
		info "Game over" "You are a shit! Your Score: ${#iX[@]}00" "Thank You"
		echo -e "\033["$iBottom";0H\033[0m"
		exit 0;
	fi

	#check if catch the new box
	if (( iHX == iNewX && iHY == iNewY ))
	then
		for (( i = ${#iX[@]}; i > iS; i-- ))
		do
			(( iX[$i] = ${iX[$i - 1]} ))
			(( iY[$i] = ${iY[$i - 1]} ))
		done
		(( iX[$iS] = iHX ))
		(( iY[$iS] = iHY ))
		(( iNextP = iS + 1 ))
		if (( iNextP >= ${#iX[@]} )); then iNextP=0; fi
		echo -ne "\a"
		RandomHeader
		echo -ne "\033[7;40HSorce :${#iX[@]}00\033[0m"
		echo -ne "\033[9;40HSpeed :${speed}s/m     \033[0m"
		echo -ne "\033[11;40HLevel :${level} \033[0m"
	else
		(( iNextP = iS + 1 ))
		if (( iNextP >= ${#iX[@]} )); then iNextP=0; fi
		#clear snake tailer
		(( pX = 2 * ${iX[$iS]} + iLeft + 1 ))
		(( pY = ${iY[$iS]} + iTop + 1 ))
		(( pM = ${iY[$iS]} * iWidth + ${iX[$iS]} ))
		(( iMap[$pM] = 0 ))
		echo -ne "\033["$pY";"$pX"H  "
		(( iX[$iS] = iHX ))
		(( iY[$iS] = iHY ))
		#echo -e "\033["$iBottom";0HGame over! (Score: "${#iX[@]}"00)\033[0m"
	fi
	#draw snake header
	echo -ne "\033[1m\033[33m"
	(( pX = 2 * iHX + iLeft + 1 ))
	(( pY = iHY + iTop + 1 ))
	(( pM = iHY * iWidth + iHX ))
	(( iMap[$pM] = 1 ))
	echo -ne "\033["$pY";"$pX"H[]"
	echo -ne "\033["$iCursor";1H"
	echo -ne "\033[0m"
	(( iS = iNextP ))
}

trap "if (( iDir != 3 && iDir != 0 )); then iDirection=1; fi" 36
trap "if (( iDir != 4 )); then iDirection=2; fi" 37
trap "if (( iDir != 1 )); then iDirection=3; fi" 38
trap "if (( iDir != 2 )); then iDirection=4; fi" 39
trap "exit" 40
InitDraw
#iTime="1"`date +"%S%N"`
 
# 控制贪吃蛇的移动速度
while [[ 1 ]]
do
	(( iNanoSec = iSpeed * 1000000 - ${#iX[@]} * 100 * 1000000 ))
	if [ ${#iX[@]} -ge "3" ] & [ ${#iX[@]} -lt "10" ]; then
		sleep 1
		speed=1.0
		level="1"
	elif [ ${#iX[@]} -ge "10" ] & [ ${#iX[@]} -lt "20" ]; then
		sleep 0.9
		speed=0.9
		level="2"
	elif [ ${#iX[@]} -ge "20" ] & [ ${#iX[@]} -lt "30" ]; then
		sleep 0.8
		speed=0.8
		level="3"
	elif [ ${#iX[@]} -ge "30" ] & [ ${#iX[@]} -lt "40" ]; then
		sleep 0.7
		speed=0.7
		level="4"
	elif [ ${#iX[@]} -ge "40" ] & [ ${#iX[@]} -lt "50" ]; then
		sleep 0.6
		speed=0.6
		level="5"
	elif [ ${#iX[@]} -ge "50" ] & [ ${#iX[@]} -lt "60" ]; then
		sleep 0.5
		speed=0.5
		level="6"
	elif [ ${#iX[@]} -ge "60" ] & [ ${#iX[@]} -lt "70" ]; then
		sleep 0.4
		speed=0.4
		level="7"
	elif [ ${#iX[@]} -ge "70" ] & [ ${#iX[@]} -lt "80" ]; then
		sleep 0.3
		speed=0.3
		level="8"
	elif [ ${#iX[@]} -ge "90" ] & [ ${#iX[@]} -lt "100" ]; then
		sleep 0.2
		speed=0.2
		level="9"
		else [ ${#iX[@]} -ge "100" ]
		sleep 0.05
		level="10"
	fi
	#iTimeNew="1"`date +"%S%N"`
	#avoid iTimeNew < iTime when new minute comes
	#if (( iTimeNew < iTime ))
	#then
	#	(( iTime = iTime - 600000000 ))
	#fi
	#detect the time interval
	#if (( iTimeNew - iTime < iNanoSec )); then continue; fi
	#iTime=$iTimeNew
	iDir=$iDirection
	if (( iDir != 0 ))
	then
		ShiftSnake
	fi
done
