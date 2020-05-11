#!/bin/bash

topline="LIGAND_DIR = database_ligands"
dir=<DIRECTORY OF PHASE DATABASE>
sub=druglike_phase-cp.inp # subset of phase database already existing

n1=50000
n2=100000
n3=500000
n4=10000
tot=8018781
#need: X=2 Y=n1 (not inclusive), X=n1 Y=2n1, X=2n1 Y=3n1, until tot-n1<n1. 
#Then need X=$(((tot/n1)*n1)) and Y=tot+1

#n4
mkdir /scratch/users/<USERNAME>/schrodinger/druglike-10K
cd /scratch/users/<USERNAME>/schrodinger/druglike-10K
n1=n4
X=2
Y=${n1}
Yk=$((Y/1000))
echo -e  "$topline\r" > druglike_1-${Yk}K_phase.inp
tail -n "+$X" $dir/druglike_phase-cp.inp | head -n "$((Y-X))" >> druglike_1-${Yk}K_phase.inp

times=$((tot/n1))
for ((i=1;i<=times;i++))
do
	X=$((i*n1))
	Xk=$((i*n1/1000))
	Y=$(((i+1)*n1))
	Yk=$(((i+1)*n1/1000))
	echo $X $Y
	echo -e $topline"\r" > druglike_${Xk}K-${Yk}K_phase.inp
	tail -n "+$X" $dir/druglike_phase-cp.inp | head -n "$((Y-X))" >> druglike_${Xk}K-${Yk}K_phase.inp
	
done
