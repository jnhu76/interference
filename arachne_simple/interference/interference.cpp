#include "SequentialReader.hpp"
#include "RandomReader.hpp"
// -------------------------------------------------------------------------------------
using namespace std;
// -------------------------------------------------------------------------------------
ub8 SEQ_READER_BYTE_COUNT = 400;
ub8 RND_READER_BYTE_COUNT = 200;
// -------------------------------------------------------------------------------------
ub4 SEQ_RAM_THREADS = 0;
ub4 RND_RAM_THREADS = 0;
// -------------------------------------------------------------------------------------
vector<unique_ptr<SequentialReader>> seq_ram_readers;
vector<unique_ptr<RandomReader>> rnd_ram_readers;
vector<Worker *> all_workers;
// vector<unique_ptr<thread>> all_threads;
vector<Arachne::ThreadId> all_threads;
// -------------------------------------------------------------------------------------
// Common config
string CONFIG_STRING = "";
// -------------------------------------------------------------------------------------
void CreateAllThreads()
{
   std::cout << "Create All Threads.\n";
   // Sequential read ram
   for (ub4 tid = 0; tid<SEQ_RAM_THREADS; tid++) {
      seq_ram_readers.emplace_back(make_unique<SequentialReader>(SEQ_READER_BYTE_COUNT, tid + 10, CONFIG_STRING));
      // all_threads.emplace_back(make_unique<thread>([&, tid]() {
      //    seq_ram_readers[tid]->Run();
      // }));
      Arachne::ThreadId aid = Arachne::createThread(&SequentialReader::Run, seq_ram_readers[tid].get());
      all_threads.emplace_back(std::move(aid));
      all_workers.push_back(seq_ram_readers[tid].get());
   }

   // Random read ram
   for (ub4 tid = 0; tid<RND_RAM_THREADS; tid++) {
      rnd_ram_readers.emplace_back(make_unique<RandomReader>(RND_READER_BYTE_COUNT, tid + 20, CONFIG_STRING));
      // all_threads.emplace_back(make_unique<thread>([&, tid]() {
      //    rnd_ram_readers[tid]->Run();
      // }));
      Arachne::ThreadId aid = Arachne::createThread(&RandomReader::Run, rnd_ram_readers[tid].get());
      all_threads.emplace_back(std::move(aid));
      all_workers.push_back(rnd_ram_readers[tid].get());
   }
}
// -------------------------------------------------------------------------------------
void WaitForAllToGetReady()
{
   std::cout << "Wait for all to get ready.\n";
   for (auto iter : all_workers) {
      // Arachne::ConditionVariable::wait();
      // https://zh.cppreference.com/w/cpp/thread/condition_variable
      while (!iter->ready) {
         // usleep(1e6); // Check every second
         Arachne::sleep(1e6);
         std::cout << iter->tid << " is sleep.\n";
         // Arachne::block();
      }
   }
}
// -------------------------------------------------------------------------------------
void StartAll()
{
   std::cout << "start all \n";
   for (auto iter : all_workers) {
      iter->run = true;
   }
}
// -------------------------------------------------------------------------------------
void WaitForAllToPerformAtLeastInterations(ub4 iteration_count)
{
   std::cout << "wait for all to perform at least interations.\n";
   for (auto iter : all_workers) {
      while (iter->performed_iteration_count<iteration_count) {
         // usleep(1e6); // Check every second
         Arachne::sleep(1e6);
         std::cout << iter->tid << " is sleep in Running phase.\n";
         // Arachne::block();
      }
   }
}
// -------------------------------------------------------------------------------------
void StopAll()
{
   std::cout << "stop all.\n";
   for (auto iter : all_workers) {
      iter->stop = true;
   }
}
// -------------------------------------------------------------------------------------
void WaitForAllToDie()
{
   std::cout << "wait for all to die.\n";
   for (auto &iter : all_threads) {
      // iter->join();
      Arachne::join(iter);
   }
}
// -------------------------------------------------------------------------------------
void PrintAll(ub4 iteration)
{
   std::cout << "print all\n";
   for (auto iter : all_workers) {
      iter->PrintResultOfLastIteration(iteration);
   }
}
// -------------------------------------------------------------------------------------
void AppMainWrapper() {
   CreateAllThreads();
   WaitForAllToGetReady();
   StartAll();
   WaitForAllToPerformAtLeastInterations(3); // First one might be bad if not every one has started and last on might be bad because some body might finish earlier
   StopAll();
   WaitForAllToDie();
   PrintAll(1); // run id, zero-based
   Arachne::shutDown();
}
// -------------------------------------------------------------------------------------
int main(int argc, char **argv)
{
   if (argc != 3) {
      cout << "usage: " << argv[0] << " SEQ_RAM RND_RAM " << endl;
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

   // Arachne init.
   auto MIN_CORES = SEQ_RAM_THREADS + RND_RAM_THREADS;
   Arachne::minNumCores = MIN_CORES + 1;
   Arachne::disableLoadEstimation = true;
   Arachne::init(nullptr, nullptr);

   AppMainWrapper();
   // Arachne::createThread(AppMainWrapper);
   Arachne::waitForTermination();

   cout << "all good :)" << endl;
   return 0;
}
// -------------------------------------------------------------------------------------
