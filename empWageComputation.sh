#! /bin/bash -x

echo "Welcome to employee wage computation program on Master Branch"

IS_PRESENT=1
IS_ABSENT=0
randomValue=$((RANDOM%2))
if [ $randomValue -eq $IS_PRESENT ]
then
	echo "Employee is presnet."
else
	echo "Employee is absent."
fi
