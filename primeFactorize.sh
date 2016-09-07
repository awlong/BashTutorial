#!/bin/bash
# awlong2@illinois.edu 9/5/16
# Idea came from:
#		https://github.com/spurdo-sparde/all/blob/master/coding-problems-solved/projects-solutions/pf.sh
# Examples of functions, loops, and recursion to find the prime factors of a number


# check if a number isPrime
#	0 = True
#	1 = False
isPrime()
{
	local N=$1
	# loop through numbers from 2 to sqrt(N)
	local i
	for ((i = 2; $((i*i)) <= $N; i++))
	do
		# if remainder(N/i) == 0, number is NOT prime
		if [[ $((N%i)) == 0 ]]
		then
			return 1
		fi
	done
	return 0
}

# $1=Number to check
# $2=Prime to start checking with
findPrimeFactor()
{
	local N=$1
	START=$2
	# if $1 is prime, we're done!
	if isPrime $N
	then
		printf "%d" $N
		return
	fi

	# loop through numbers from $START to sqrt($1)
	local p
	for ((p = $START; $((p*p)) <= $N; p++))
	do
		# check if prime is a factor of the number
		if isPrime $p
		then
			if [[ $((N%p)) == 0 ]]
			then
				N=$((N/p))
				printf "%dx" $p
				findPrimeFactor $N $p
				return
			fi
		fi
	done
}

# Actual script: loop over all command line arguments
for i in $@
do
	printf "Prime Factors of %d:" $i
	findPrimeFactor $i 2
	printf "\n"    
done

