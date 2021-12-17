# ./reproduce/validate.sh || exit -1

# Reproduces data for figure 4
# Interference

# Seqential ram
echo "" > results/interference_seq_ram.txt
bin/interference 10  0  0  0  0  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  1  0  0  0  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  5  0  0  0  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  10  0  0  0  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  0  1  0  0  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  0  5  0  0  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  0  10  0  0  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  0  0  1  0  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  0  0  5  0  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  0  0  10  0  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  0  0  0  1  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  0  0  0  5  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  0  0  0  10  0 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  0  0  0  0  1 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  0  0  0  0  5 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt
bin/interference 10  0  0  0  0  10 /mnt/pmem/renen 0 | tee -a results/interference_seq_ram.txt

# Seqential nvm
echo "" > results/interference_seq_nvm.txt
bin/interference  0 10  0  0  0  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  1 10  0  0  0  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  5 10  0  0  0  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  10 10  0  0  0  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  0 10  1  0  0  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  0 10  5  0  0  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  0 10  10  0  0  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  0 10  0  1  0  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  0 10  0  5  0  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  0 10  0  10  0  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  0 10  0  0  1  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  0 10  0  0  5  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  0 10  0  0  10  0 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  0 10  0  0  0  1 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  0 10  0  0  0  5 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt
bin/interference  0 10  0  0  0  10 /mnt/pmem/renen 1 | tee -a results/interference_seq_nvm.txt

# Random ram
echo "" > results/interference_rnd_ram.txt
bin/interference  0  0 10  0  0  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  1  0 10  0  0  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  5  0 10  0  0  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  10  0 10  0  0  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  0  1 10  0  0  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  0  5 10  0  0  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  0  10 10  0  0  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  0  0 10  1  0  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  0  0 10  5  0  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  0  0 10  10  0  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  0  0 10  0  1  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  0  0 10  0  5  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  0  0 10  0  10  0 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  0  0 10  0  0  1 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  0  0 10  0  0  5 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt
bin/interference  0  0 10  0  0  10 /mnt/pmem/renen 2 | tee -a results/interference_rnd_ram.txt

# Random nvm
echo "" > results/interference_rnd_nvm.txt
bin/interference  0  0  0 10  0  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  1  0  0 10  0  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  5  0  0 10  0  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  10  0  0 10  0  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  0  1  0 10  0  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  0  5  0 10  0  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  0  10  0 10  0  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  0  0  1 10  0  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  0  0  5 10  0  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  0  0  10 10  0  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  0  0  0 10  1  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  0  0  0 10  5  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  0  0  0 10  10  0 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  0  0  0 10  0  1 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  0  0  0 10  0  5 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt
bin/interference  0  0  0 10  0  10 /mnt/pmem/renen 3 | tee -a results/interference_rnd_nvm.txt

## Log nvm
#./a.out  0  0  0  0 10  0 /mnt/pmem/renen
#./a.out  1  0  0  0 10  0 /mnt/pmem/renen
#./a.out  5  0  0  0 10  0 /mnt/pmem/renen
#./a.out 10  0  0  0 10  0 /mnt/pmem/renen
#./a.out  0  1  0  0 10  0 /mnt/pmem/renen
#./a.out  0  5  0  0 10  0 /mnt/pmem/renen
#./a.out  0 10  0  0 10  0 /mnt/pmem/renen
#./a.out  0  0  1  0 10  0 /mnt/pmem/renen
#./a.out  0  0  5  0 10  0 /mnt/pmem/renen
#./a.out  0  0 10  0 10  0 /mnt/pmem/renen
#./a.out  0  0  0  1 10  0 /mnt/pmem/renen
#./a.out  0  0  0  5 10  0 /mnt/pmem/renen
#./a.out  0  0  0 10 10  0 /mnt/pmem/renen
#./a.out  0  0  0  0 10  1 /mnt/pmem/renen
#./a.out  0  0  0  0 10  5 /mnt/pmem/renen
#./a.out  0  0  0  0 10 10 /mnt/pmem/renen
#
## Page nvm
# ./a.out  0  0  0  0  0 10 /mnt/pmem/renen
# ./a.out  1  0  0  0  0 10 /mnt/pmem/renen
# ./a.out  5  0  0  0  0 10 /mnt/pmem/renen
# ./a.out 10  0  0  0  0 10 /mnt/pmem/renen
# ./a.out  0  1  0  0  0 10 /mnt/pmem/renen
# ./a.out  0  5  0  0  0 10 /mnt/pmem/renen
# ./a.out  0 10  0  0  0 10 /mnt/pmem/renen
# ./a.out  0  0  1  0  0 10 /mnt/pmem/renen
# ./a.out  0  0  5  0  0 10 /mnt/pmem/renen
# ./a.out  0  0 10  0  0 10 /mnt/pmem/renen
# ./a.out  0  0  0  1  0 10 /mnt/pmem/renen
# ./a.out  0  0  0  5  0 10 /mnt/pmem/renen
# ./a.out  0  0  0 10  0 10 /mnt/pmem/renen
# ./a.out  0  0  0  0  1 10 /mnt/pmem/renen
# ./a.out  0  0  0  0  5 10 /mnt/pmem/renen
# ./a.out  0  0  0  0 10 10 /mnt/pmem/renen
