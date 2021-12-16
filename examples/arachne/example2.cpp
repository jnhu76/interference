#include <iostream>
#include <vector>

std::vector<int> arr1;

class bar {
public:
    int n=0;
    void b(int x) {
        std::cout << "I am bar::b()";
        n = x;
    }
};

void foo() {
    for (auto i=0;i<5;i++) {
        arr1.push_back(i+1);
    }
}

std::vector<bar> arr2;

void foo2() {
    for (auto i=0;i<5;i++) {
        bar b;
        b.b(i+2);
        arr2.emplace_back(b);
    }
}

int main() {
    foo2();
    for (const auto &iter: arr2) {
        std::cout << iter.n << '\n';
    }
    return 0;
}