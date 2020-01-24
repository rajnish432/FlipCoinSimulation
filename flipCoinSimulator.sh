#! /bin/bash

echo "Welcome to FlipCoinSimulator";
singletCoinFlip=$((RANDOM%2))
if [[ $singletCoinFlip -eq 0 ]]
then
	echo "It's a head";
else
	echo "It's a tail";
fi
