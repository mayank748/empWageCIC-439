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


function salaryFunction(){
	local totalWorkingHour=$1
	local amountPaidPerHour=$2
	local totalAmount=$(($totalWorkingHour*$amountPaidPerHour))
	echo $totalAmount
}

while [ $TOTAL_WORKING_DAYS -gt 0 ]
do

randomValue=$((RANDOM%3))
totalSalary=0

case $randomValue in 
	$IS_PRESENT)
	echo "Employee is presnet."
	totalSalary=`salaryFunction TOTAL_WORKING_HOUR AMOUNT_PAID_PER_HOUR`;;
	$IS_PART_TIME)
	echo "Employee is doing parttime."
	totalSalary=`salaryFunction TOTAL_WORKING_HOUR_FOR_PART_TIME AMOUNT_PAID_PER_HOUR`;;
	*)
	echo "Employee is absent."
esac

toatalMonthSalary=$(($toatalMonthSalary+$totalSalary))
((TOTAL_WORKING_DAYS--))
done

echo "Total month salary "$toatalMonthSalary
