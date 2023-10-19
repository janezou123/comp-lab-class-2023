#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=3
#SBATCH --time=1:00:00
#SBATCH --job-name=parallel_tempering
#SBATCH --cpus-per-task=1
#SBATCH --mem=8GB
#SBATCH -o run_parallel.out

gromacs/openmpi/intel/2018.3

mpirun -np 3 gmx_mpi mdrun -s adp -multidir /T300/ T363/ T440/ -deffnm adp_exchange3temps -replex 50

exit
