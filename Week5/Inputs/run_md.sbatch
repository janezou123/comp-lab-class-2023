#!/bin/bash
#SBATCH -J MD_Simulation    
#SBATCH -o md_HW5.out    
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1 
#SBATCH --time=00:01:00           
#SBATCH --mem=2G            

module load gromacs/openmpi/intel/2018.3 

gmx_mpi grompp -f adp_T300.mdp -c adp.gro -p adp.top -o md.tpr
gmx_mpi mdrun -v -deffnm md



