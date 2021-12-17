clang++ -g0 -O3 -DNDEBUG=1 -march=native -std=c++17 interference/interference.cpp -lpthread || exit -1

# Seqential ram
echo "" > results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 10  0  | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 10  1  | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 10  5  | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 10  10  | tee -a results/interference_seq_ram.txt


# Seqential nvm
echo "" > results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 10  | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  1 10  | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  5 10  | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  10 10  | tee -a results/interference_seq_nvm.txt
