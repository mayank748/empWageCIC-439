#! /bin/bash -x

echo "Welcome to employee wage computation program on Master Branch"

IS_PRESENT=1
IS_ABSENT=0
IS_PART_TIME=2
TOTAL_WORKING_HOUR=8
AMOUNT_PAID_PER_HOUR=20
TOTAL_WORKING_HOUR_FOR_PART_TIME=8
TOTAL_WORKING_DAYS=20
toatalMonthSalary=0
TOTAL_HOURS=100

function salaryFunction(){
	local totalWorkingHour=$1
	local amountPaidPerHour=$2
	local totalAmount=$(($totalWorkingHour*$amountPaidPerHour))
	echo $totalAmount
}

function totalHoursLeft(){
	local totalHours=$1
	local totalWorkingHours=$2
	if [ $totalHours -lt 8 ]
	then
		echo $totalHours
	else
		echo $(($totalHours-$totalWorkingHours))
	fi
}

while [ $TOTAL_WORKING_DAYS -gt 0 ] && [ $TOTAL_HOURS -gt 0 ]
do

randomValue=$((RANDOM%3))
totalSalary=0

case $randomValue in 
	$IS_PRESENT)
	echo "Employee is presnet."
	TOTAL_HOURS=`totalHoursLeft $TOTAL_HOURS $TOTAL_WORKING_HOUR`
	if [ $TOTAL_HOURS -lt 8 ] && [ $TOTAL_HOURS -gt 0 ]
	then
		totalSalary=`salaryFunction $TOTAL_HOURS $AMOUNT_PAID_PER_HOUR`
	else
		totalSalary=`salaryFunction $TOTAL_WORKING_HOUR $AMOUNT_PAID_PER_HOUR`
	fi
	;;
	
	$IS_PART_TIME)
	echo "Employee is doing parttime."
	TOTAL_HOURS=`totalHoursLeft $TOTAL_HOURS $TOTAL_WORKING_HOUR_FOR_PART_TIME`
	if [ $TOTAL_HOURS -lt 8 ] && [ $TOTAL_HOURS -gt 0 ]
	then
	totalSalary=`salaryFunction $TOTAL_HOURS $AMOUNT_PAID_PER_HOUR`
	else
	totalSalary=`salaryFunction $TOTAL_WORKING_HOUR_FOR_PART_TIME $AMOUNT_PAID_PER_HOUR`
	fi	
	;;

	*)
	echo "Employee is absent."
esac

toatalMonthSalary=$(($toatalMonthSalary+$totalSalary))
((TOTAL_WORKING_DAYS--))
done

echo "Total month salary "$toatalMonthSalary
