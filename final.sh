#!/bin/bash
#decalre an array
declare -a LIST=()

#declare the counter for array elements.
i=0

while true
do
#create a random number between 1-10.
        NUMBER=$(( RANDOM %10 + 1 ))
#get the length of current array.
        AL=${#LIST[@]}
#declare the counter to check if the random number matches one of the array elements.
        c=0
#for loop to check if the random number matches one of the array elements.
        for (( f=0; f<=${AL}; f++ ));
        do
#if random number matches one of the elements in the array, increase the match counter by 1.
                if [[ ${LIST[$f]} -eq $NUMBER ]]
                then
                        ((c++))
                fi
        done
#if counter is not equal to 0, random number matches one of the elements thus "i" is reduced by 1.
        if [[ $c -ne 0 ]];
        then
                ((i--))
        else
#else counter is equal to 0 and random number doesn't match one of the elements thus it is added to array.
                LIST[$i]=$NUMBER
        fi
#"i" is increased by 1 whether it is reduced by 1 or not in previous if block. 
#if "i" is reduced and increased back, random number matched the array elements thus looping once more for the current "i".
#else random number is added to array and "i" is increased by 1 for the next element in the array.
        ((i++))
#if "i" is equal to 10, break out of while to end the loop.
        [[ $i -eq 10 ]] && break
done
#print array elements
for p in {0..9}
do
	echo "index: $p value: ${LIST[$p]}"
done