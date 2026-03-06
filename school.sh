#!/bin/bash

cat Property_Tax_Roll.csv |
grep "MADISON SCHOOLS" |
cut -d, -f7 |
{
    sum=0
    count=0

    while read x
    do
        sum=$((sum + x))
        count=$((count + 1))
    done

    echo $((sum / count))
}
