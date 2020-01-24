#! /bin/bash -x 

echo "Welcome to FlipCoinSimulator";
read -p "Enter the number of Coin flips: " num
heads=0;
tails=0;
declare -A singleCoinFace

function coinflip()
{
for (( i=0; i<$num; i++ ))
do
if [[ $((RANDOM%2)) -eq 0 ]]
then
	((heads++))
	singleCoinFace[Heads]=$heads
else
	((tails++))
	singleCoinFace[Tails]=$tails
fi
done
percentageOfHeads=$((${singleCoinFace[Heads]}*100/$num))
percentageOfTails=$((${singleCoinFace[Tails]}*100/$num))
}
coinflip
echo "Percentage of Heads: $percentageOfHeads"
echo "Percentage of Tails: $percentageOfTails"
