#!/bin/bash

###This file makes input files for VSW based on subsets of a phase database

mkdir temp
dir=/scratch/users/<USERNAME>/schrodinger/<SUBFOLDER>/
orig=$dir/<INPUT_FILE_PREPARED_IN_MAESTRO>
n1=50000 				#number of compounds/subset
tot=8018781 				#total number of compounds in database
start=1 				#starting row
times=$((tot/n1))
search=druglike_1-50K 
for ((i=start; i<=times; i++))
do
	Xk=$((i*n1/1000))
	Yk=$(((i+1)*n1/1000))
	replace=druglike_${Xk}K-${Yk}K
	echo ${search} ${replace}
	sed "s/$search/$replace/" ${orig} >> $dir/temp/<PREFIX_OF_.inp_FILE>.${Xk}K-${Yk}K.inp
done
