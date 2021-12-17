# CXXFLAGS=-g0 -O3 -DNDEBUG=1 -march=native -std=c++17 -Wall -Wformat=2 -Wextra -Wwrite-strings -Wno-unused-parameter -Wmissing-format-attribute -Wno-unsupported-friend -Woverloaded-virtual -Wcast-qual -Wcast-align -Wconversion -fomit-frame-pointer

CXXFLAGS=-g -O3 -DNDEBUG=1 -march=native -std=c++17 -Wall -Wformat=2 -Wextra -Wwrite-strings -Wno-unused-parameter -Wmissing-format-attribute -Wno-unsupported-friend -Woverloaded-virtual -Wcast-qual -Wcast-align -fomit-frame-pointer
# Output directories
SRC_DIR = interference
BIN_DIR = bin

PMDK=/home/aim/hjn/pmdk

LIBS=-lpcrecpp -pthread -I$(PMDK)/src/include/ $(PMDK)/src/nondebug/libpmem.a $(PMDK)/src/nondebug/libpmemlog.a -lndctl -ldaxctl

BINS=interference

FULL_BINS = $(patsubst %,$(BIN_DIR)/%,$(BINS))

all: $(FULL_BINS)

$(BIN_DIR)/% : $(SRC_DIR)/%.cpp | $(BIN_DIR)
	g++  $(CXXFLAGS)  $< $(LIBS) -o $@

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

clean:
	rm -rf $(BIN_DIR)
