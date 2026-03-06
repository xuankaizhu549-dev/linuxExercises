#!/bin/bash

if [ $# -lt 1 ] || [ $# -gt 2 ]
then
    echo "usage: $0 <column> [file.csv]" 1>&2
    exit 1
fi

column=$1

if [ $# -eq 2 ]
then
    file=$2
else
    file=/dev/stdin
fi

cut -d, -f"$column" "$file" |
tail -n +2 |
{
    sum=0
    count=0

    while read x
    do
        sum=$(echo "$sum + $x" | bc)
        count=$((count + 1))
    done

    echo "scale=6; $sum / $count" | bc
}
