    #include <stdio.h>
    #include <iostream>
    #include <vector>
    #include <memory>
    #include <algorithm>
    #include "Arachne/Arachne.h"


    void numberPrinter(int n) {
        printf("NumberPrinter says %d\n", n);
    }

    class foo {
    public:
        void bar(int a) {
            for (auto i=0;i<5;++i) {
                std::cout << "Foo thread." << a << " n is " << n << '\n';
                ++n;
                Arachne::sleep(10);
            }
        }
        int n {0};
    };

    constexpr int c = 5;
    std::vector<std::unique_ptr<foo>> arr(5);
    std::vector<std::unique_ptr<Arachne::ThreadId>> threads(5);

    // This is where user code should start running.
    void AppMain(int argc, const char** argv) {
        printf("Arachne says hello world and creates 5 threads.\n");
        // for (auto i=0;i<5;++i) {
        //     foo f;
        //     // arr.emplace_back(f);
        //     // arr.emplace_back(std::move(f));
        //     auto tid = Arachne::createThread(&foo::bar, &f, i);
        //     Arachne::join(tid);
        //     arr.emplace_back(std::move(f));
        // }
        std::generate(arr.begin(), arr.end(), []() {
            return std::move(std::make_unique<foo>());
        });

        // for (auto i=0;i<5;i++) {
        //     auto tid = Arachne::createThread(&foo::bar, arr[i].get(), i);
        //     Arachne::join(tid);
        // }
              // all_threads.emplace_back(make_unique<thread>([&, tid]() {
      //    seq_ram_readers[tid]->Run();
      // }));
        for (auto i=0;i<5;++i) {
            auto tid = Arachne::createThread(&foo::bar, arr[i].get(), i);
            threads[i] = std::make_unique<Arachne::ThreadId>(tid);
        }
    }

    void joinall() {
        for (auto &&iter: threads) {
            Arachne::join(*iter.get());
        }
    }

    // The following bootstrapping code should be copied verbatim into most Arachne
    // applications.
    void AppMainWrapper(int argc, const char** argv) {
        AppMain(argc, argv);
        joinall();
        Arachne::shutDown();
    }
    int main(int argc, const char** argv){

        Arachne::init(&argc, argv);
        // Arachne::createThread(&AppMainWrapper, argc, argv);
        AppMainWrapper(argc, argv);
        Arachne::waitForTermination();
        for (const auto &iter: arr) {
            std::cout << iter->n << "\n";
        }
        return 0;
    }