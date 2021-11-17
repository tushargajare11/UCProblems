#!/bin/bash -x

#constants
IS_PART_TIME=1;
IS_FULL_TIME=2;
MAX_HRS_IN_MONTH=100;
EMP_RATE_PER_HR=20;
NUM_WORKING_DAYS=20;

#variables
totalEmpHr=0;
totalWorkingDays=0;

function getWorkHrs() {
	case $1 in
		$IS_FUL_TIME)
			empHrs=8
			;;
		$IS_PART_TIME)
			empHrs=4
			;;
		*)
			empHrs=0
			;;
	esac
}

function getEmpWage() {
	echo $(($1*$EMP_RATE_PER_HR))
}

while [[ $totalEmpHr -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))
	getWorkHrs $empCheck
	totalEmpHr=$(($totalEmpHr+$empHrs))
	dailyWages[$totalWorkingDays]=$(($empHrs*$EMP_RATE_PER_HR))
done

totalsalary="$( getEmpWage $totalEmpHr )"
