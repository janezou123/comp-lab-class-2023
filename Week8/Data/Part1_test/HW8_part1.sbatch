#!/bin/bash
#SBATCH --job=HW8_part1
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=1:00:00
#SBATCH --mem=4G

source /scratch/work/courses/CHEM-GA-2671-2023fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

mpirun lmp -var density 0.5  -in /home/hz2750/comp-lab-class/comp-lab-class-2023/Week8/Inputs/2dWCA.in
