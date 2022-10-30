#!/bin/bash
declare -a LIST=()
i=0
while true
do
        NUMBER=$(( RANDOM %10 + 1 ))
        AL=${#LIST[@]}
        c=0
        for (( f=0; f<=${AL}; f++ ));
        do
                if [[ ${LIST[$f]} -eq $NUMBER ]]
                then
                        ((c++))
                fi
        done
        if [[ $c -ne 0 ]];
        then
                ((i--))
        else
                LIST[$i]=$NUMBER
        fi
        ((i++))
        [[ $i -eq 10 ]] && break
done
for p in {0..9}
do
	echo "index: $p value: ${LIST[$p]}"
done