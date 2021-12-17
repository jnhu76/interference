#include "SequentialReader.hpp"
#include "RandomReader.hpp"
// -------------------------------------------------------------------------------------
using namespace std;
// -------------------------------------------------------------------------------------
ub8 PAGE_FLUSH_PAGE_COUNT = 62055;
ub8 LOG_BYTE_COUNT = 2.6e8;
ub8 SEQ_READER_BYTE_COUNT = 2.6e9;
ub8 RND_READER_BYTE_COUNT = 2.6e8;
// -------------------------------------------------------------------------------------
ub4 SEQ_RAM_THREADS = 0;
ub4 RND_RAM_THREADS = 0;
// -------------------------------------------------------------------------------------
vector<unique_ptr<SequentialReader>> seq_ram_readers;
vector<unique_ptr<RandomReader>> rnd_ram_readers;
vector<Worker *> all_workers;
vector<unique_ptr<thread>> all_threads;
// -------------------------------------------------------------------------------------
// Common config
string CONFIG_STRING = "";
// -------------------------------------------------------------------------------------
void CreateAllThreads()
{
   // Sequential read ram
   for (ub4 tid = 0; tid<SEQ_RAM_THREADS; tid++) {
      seq_ram_readers.emplace_back(make_unique<SequentialReader>(SEQ_READER_BYTE_COUNT, tid, CONFIG_STRING));
      all_threads.emplace_back(make_unique<thread>([&, tid]() {
         seq_ram_readers[tid]->Run();
      }));
      all_workers.push_back(seq_ram_readers[tid].get());
   }

   // Random read ram
   for (ub4 tid = 0; tid<RND_RAM_THREADS; tid++) {
      rnd_ram_readers.emplace_back(make_unique<RandomReader>(RND_READER_BYTE_COUNT, tid, CONFIG_STRING));
      all_threads.emplace_back(make_unique<thread>([&, tid]() {
         rnd_ram_readers[tid]->Run();
      }));
      all_workers.push_back(rnd_ram_readers[tid].get());
   }
}
// -------------------------------------------------------------------------------------
void WaitForAllToGetReady()
{
   for (auto iter : all_workers) {
      while (!iter->ready) {
         usleep(1e6); // Check every second
      }
   }
}
// -------------------------------------------------------------------------------------
void StartAll()
{
   for (auto iter : all_workers) {
      iter->run = true;
   }
}
// -------------------------------------------------------------------------------------
void WaitForAllToPerformAtLeastInterations(ub4 iteration_count)
{
   for (auto iter : all_workers) {
      while (iter->performed_iteration_count<iteration_count) {
         usleep(1e6); // Check every second
      }
   }
}
// -------------------------------------------------------------------------------------
void StopAll()
{
   for (auto iter : all_workers) {
      iter->stop = true;
   }
}
// -------------------------------------------------------------------------------------
void WaitForAllToDie()
{
   for (auto &iter : all_threads) {
      iter->join();
   }
}
// -------------------------------------------------------------------------------------
void PrintAll(ub4 iteration)
{
   for (auto iter : all_workers) {
      iter->PrintResultOfLastIteration(iteration);
   }
}
// -------------------------------------------------------------------------------------
int main(int argc, char **argv)
{
   if (argc != 3) {
      cout << "usage: " << argv[0] << " SEQ_RAM RND_RAM" << endl;
      throw;
   }

   SEQ_RAM_THREADS = stof(argv[1]);
   RND_RAM_THREADS = stof(argv[2]);



   //@formatter:off
   CONFIG_STRING = to_string(SEQ_RAM_THREADS) + "_"
                 + to_string(RND_RAM_THREADS);
   //@formatter:on

   cout << "Config:" << endl;
   cout << "----------------------------" << endl;
   cout << "SEQ_READER_BYTE_COUNT: " << SEQ_READER_BYTE_COUNT << endl;
   cout << "RND_READER_BYTE_COUNT: " << RND_READER_BYTE_COUNT << endl;
   cout << "SEQ_RAM_THREADS:       " << SEQ_RAM_THREADS << endl;
   cout << "RND_RAM_THREADS:       " << RND_RAM_THREADS << endl;
   cout << "CONFIG_STRING:         " << CONFIG_STRING << endl;

#ifdef STREAMING
   cout << "STREAMING:             " << "yes" << endl;
#else
   cout << "STREAMING:             " << "no" << endl;
#endif

   CreateAllThreads();
   WaitForAllToGetReady();
   StartAll();
   WaitForAllToPerformAtLeastInterations(3); // First one might be bad if not every one has started and last on might be bad because some body might finish earlier
   StopAll();
   WaitForAllToDie();
   PrintAll(1); // run id, zero-based

   cout << "all good :)" << endl;
   return 0;
}
// -------------------------------------------------------------------------------------
