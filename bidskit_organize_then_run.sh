#!/usr/bin/bash
#
#SBATCH -A p30954
#SBATCH -p normal
#SBATCH -t 16:00:00
#SBATCH --mem=64G
#SBATCH -J georgia_bidskit


cd /projects/b1108/data/Georgia/globus_test/sourcedata

for dir in */; do
mkdir $dir/1
mv $dir/s*/* $dir/1
mv $dir/3D/* $dir/1
mv $dir/DTI/MR/* $dir/1
mv $dir/REST*/MR/* $dir/1
mv $dir/MID*/MR/* $dir/1
mv $dir/FMAP*/MR/* $dir/1

rm -r FMAP/ DTI/ REST* MID* 3D
rm -r $dir/s*
done

cd /projects/b1108/data/Georgia/globus_test

bidskit
