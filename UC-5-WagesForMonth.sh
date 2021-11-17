#!/bin/bash -x

isPartTime=1
isFullTime=2
totalsalary=0
empRatePerHr=20
numOfworkingDays=20

for (( day=1; day<=$numOfworkingDays; day++ ))
do
	randomCheck=$((RANDOM%3));
		case $randomCheck in
			$isFullTime)
				empHrs=8
				;;
			$isPartTime)
				empHrs=4
				;;
			*)
			empHrs=0
				;;
		esac
	salary=$(($empHrs*$empRatePerHr));
	totalsalary=$(($totalsalary*$salary));
done

