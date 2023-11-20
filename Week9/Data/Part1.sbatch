#!/bin/bash
#SBATCH --job-name=Part1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --time=24:00:00
#SBATCH --mem=4G
#SBATCH --array=0-9

source /scratch/work/courses/CHEM-GA-2671-2023fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

mpirun lmp -var configfile /home/hz2750/comp-lab-class/comp-lab-class-2023/Week9/Inputs/n360/kalj_n360_create.lmp -var id 1 -in /home/hz2750/comp-lab-class/comp-lab-class-2023/Week9/Inputs/create_3d_binary.lmp

temperatures=("1.5" "1.0" "0.9" "0.8" "0.7" "0.65" "0.6" "0.55" "0.5" "0.475")

for temp in "${temperatures[@]}"
do
    echo "Equilibrating at temperature $temp"
    mpirun lmp -var configfile "/home/hz2750/comp-lab-class/comp-lab-class-2023/Week9/Inputs/n360/kalj_n360_T$temp.lmp" -var id 1 -in /home/hz2750/comp-lab-class/comp-lab-class-2023/Week9/Inputs/anneal_3d_binary.lmp
done

