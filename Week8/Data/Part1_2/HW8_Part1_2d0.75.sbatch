#!/bin/bash
#SBATCH --job=HW8_part1_2d0.75
#SBATCH --output=LOGFILE.log
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=1:00:00
#SBATCH --mem=4G

source /scratch/work/courses/CHEM-GA-2671-2023fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

densities=("0.75")

density="${densities[$SLURM_ARRAY_TASK_ID]}"

mpirun lmp -var density "$density" -in /home/hz2750/comp-lab-class/comp-lab-class-2023/Week8/Inputs/2dWCA.in > "density_${density}_LOGFILE.log"
