# ./reproduce/validate.sh || exit -1

# Reproduces data for figure 4
# Interference


# Seqential ram
echo "" > results/interference_seq_ram.txt
bin/interference 4 0 | tee -a results/interference_seq_ram.txt
bin/interference 4 1 | tee -a results/interference_seq_ram.txt
bin/interference 4 2 | tee -a results/interference_seq_ram.txt
bin/interference 4 4 | tee -a results/interference_seq_ram.txt


# Random ram
echo "" > results/interference_rnd_ram.txt
bin/interference 0 4 | tee -a results/interference_rnd_ram.txt
bin/interference 1 4 | tee -a results/interference_rnd_ram.txt
bin/interference 2 4 | tee -a results/interference_rnd_ram.txt
bin/interference 4 4 | tee -a results/interference_rnd_ram.txt
