#!/bin/bash -x

isFullTime=2;
isPartTime=1;
max_hrs_in_month=100;
emp_rate_per_hr=20;
num_working_days=20;

totalEmpHr=0;
totalWorkingDays=0;

declare -A dailyWages
function getWorkHrs() {
	case $1 in
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
}

function getEmpWage() {
	echo $(($1*$emp_rate_per_hr))
}

while [[ $totalEmpHr -lt $max_hrs_in_month && $totalWorkingDays -lt $num_working_days ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))
	getWorkHrs $empCheck
	totalEmpHr=$(($totalEmpHr+$empHrs))
	dailyWages[$totalWorkingDays]=$(($empHrs*$emp_rate_per_hr))
done

totalsalary="$( getEmpWage $totalEmpHr )"

echo ${dailyWages[@]}	#Using Array

echo ${!dailyWages[@]}	#Using Dict
