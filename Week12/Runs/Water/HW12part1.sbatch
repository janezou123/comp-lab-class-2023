#!/bin/bash
#SBATCH --job-name=HW12Part1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --cpus-per-task=1
#SBATCH --mem=20GB
#SBATCH --time=6:00:00

module purge
module load cp2k/openmpi/intel/20201212

mpirun -np 12 cp2k.popt -i water.inp -o water_output.log
