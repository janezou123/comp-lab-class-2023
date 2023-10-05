#!/bin/bash
#SBATCH --nodes=20
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=24:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=HW3
#SBATCH --output=HZ_HW3.out

module load gromacs/openmpi/intel/2020.4

gmx_mpi grompp -f md.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_50.tpr
gmx_mpi mdrun -deffnm md_0_50