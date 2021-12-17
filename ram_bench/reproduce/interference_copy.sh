g++ -g0 -O3 -DNDEBUG=1 -march=native -std=c++17 interference/interference.cpp -lpthread || exit -1

# Seqential ram
echo "" > results/interference_seq_ram.txt
./a.out 20  0  | tee -a results/interference_seq_ram.txt
./a.out 20  1  | tee -a results/interference_seq_ram.txt
./a.out 20  10  | tee -a results/interference_seq_ram.txt
./a.out 20  20  | tee -a results/interference_seq_ram.txt


# Seqential nvm
echo "" > results/interference_seq_nvm.txt
./a.out  0 20  | tee -a results/interference_seq_nvm.txt
./a.out  1 20  | tee -a results/interference_seq_nvm.txt
./a.out  10 20  | tee -a results/interference_seq_nvm.txt
./a.out  20 20  | tee -a results/interference_seq_nvm.txt
