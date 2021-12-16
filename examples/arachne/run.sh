#!/usr/bin/env bash

 g++ -std=c++14 -g -O3 -Werror -o test example.cpp  -I../../arachne_all/Arachne/include -I../../arachne_all/CoreArbiter/include  -I../../arachne_all/PerfUtils/include -L../../arachne_all/Arachne/lib -lArachne -L../../arachne_all/CoreArbiter/lib -lCoreArbiter -L../../arachne_all/PerfUtils/lib/ -lPerfUtils  -lpcrecpp -pthread