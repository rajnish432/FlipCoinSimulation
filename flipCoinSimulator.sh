#! /bin/bash 

echo "Welcome to FlipCoinSimulator";

function coinflip()
{
	for (( i=0; i<$1; i++ ))
	do
		key=""
		for (( j=0; j<$2; j++ ))
		do
			if [[ $((RANDOM%2)) -eq 0 ]]
			then
				key+=H;
			else
				key+=T;
			fi
		done
		countUpdate $key
	done
}

function countUpdate()
{
	coinFace[$1]=$((${coinFace[$1]}+1))
}

function percentage()
{
	for i in ${!coinFace[@]}
	do
 		coinFace[$i]=$((coinFace[$i]*100/$num))
	done
}

function Sorting()
{
	echo "Winning Combination percentage: "
	for i in ${!coinFace[@]}
	do
		echo "$i ${coinFace[$i]}"
	done | sort -k2 -rn | head -1
}

read -p "Enter CoinFlip(y/n): " enter
while [[ $enter == "y" ]]
do
	read -p "Enter the number of Coin flips and Coins: " num coins
		declare -A coinFace
		case $coins in
			1)
				coinflip $num $coins;;
			2)
				coinflip $num $coins;;
			3)
				coinflip $num $coins;;
			*)
				echo "Invalid Input(please enter value between 1-3)"
		esac
	echo "Number of Keys: ${!coinFace[@]}"
	echo "Number of Coin flips: " ${coinFace[@]}
	percentage
	echo "Percentage: "${coinFace[@]}
	Sorting
	unset coinFace[@]
	read -p "Do you want to continue(y/n): " enter
done
