# virtual-screening-workflow
## Code to set up a structure-based virtual screen of a receptor using Schrodinger Glide on a slurm-based cluster (Sherlock at Stanford)
"vsw-notes-cleaned-up.txt" has more details and notes on job control and submission. 
You have to make sure to get access to Schrodinger (e.g. at Stanford, here: https://library.stanford.edu/science/software/schrodinger)

## Workflow of scripts:
* Make sure to go through each one and change directories and usernames as needed. 

1. __subset_phase.sh__ subsets a phase database into _n_ compounds/subset. 
* Stanford has access to millipore_sigma.phdb (Phase database of pre-prepared compounds). Instructions to obtain it are here: https://library.stanford.edu/science/software/schrodinger/oak-storage-server-instructions-get-copy-aldrich-market-direct-database 
* I used 50K ligands/subset 

2. Then, with one of those subsets, you have to prepare a receptor grid and an input file for VSW using Maestro (look up tutorial to do this on Google, one is here http://content.schrodinger.com/Training+Material/Glide/Structure-Based_Virtual_Screening_with_Glide_2016-3.pdf) 

3. __subset_inp.sh__ duplicates input files for each subset of the phase database made. 

4. __1-500K.sh__ submits jobs for the first 10 jobs (500K/50K = 10) as a test run to see if you need to submit smaller subsets to be done within the max job time of 48 hrs. 

5. __500K-4000K.sh__ and __4000K-8050K.sh__ submits the rest of the tranches of jobs. Copy/paste these files if you have more compounds to screen. 

