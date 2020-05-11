#!/bin/bash


prefix="<PREFIX_OF_.inp_FILE>"
subsets=(1-50K 50K-100K 100K-150K 150K-200K 200K-250K 250K-300K 300K-350K 350K-400K 400K-450K 450K-500K)

for s in ${subsets[@]}
do
   inp=$prefix.${s}.inp
   sbatch -n 2 \
	--mail-user=<EMAIL> \
	--mail-type=ALL \
	-o ${s}-slurm.out \
	-e ${s}-slurm.out \
	-t 2-00:00:00 \
	--wrap="ml chemistry schrodinger && ${SCHRODINGER}/vsw ${inp} -OVERWRITE -WAIT -RESTART -LOCAL -HOST "localhost:2" -host_glide "localhost:2" -host_prime "localhost:1" -adjust -TMPLAUNCHDIR"
done
