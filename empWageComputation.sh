#! /bin/bash -x

echo "Welcome to employee wage computation program on Master Branch"

IS_PRESENT=1
IS_ABSENT=0
IS_PART_TIME=2
randomValue=$((RANDOM%3))
totalSalary=0
TOTAL_WORKING_HOUR=8
AMOUNT_PAID_PER_HOUR=20
TOTAL_WORKING_HOUR_FOR_PART_TIME=8

function salaryFunction(){
	local totalWorkingHour=$1
	local amountPaidPerHour=$2
	local totalAmount=$(($totalWorkingHour*$amountPaidPerHour))
	echo $totalAmount
}

if [ $randomValue -eq $IS_PRESENT ]
then
	echo "Employee is presnet."
	echo "total amount " `salaryFunction TOTAL_WORKING_HOUR AMOUNT_PAID_PER_HOUR`
elif [ $randomValue -eq $IS_PART_TIME ]
	then
	echo "Employee is doing parttime."
	echo "total amount " `salaryFunction TOTAL_WORKING_HOUR_FOR_PART_TIME AMOUNT_PAID_PER_HOUR`
else
	echo "Employee is absent."
fi
