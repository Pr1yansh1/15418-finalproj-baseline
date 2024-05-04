# CXX = /opt/homebrew/opt/llvm/bin/clang++
# CXXFLAGS = -std=c++17 -Wall -pipe $(EXTRACXXFLAGS) -I/usr/local/opt/llvm/include -fopenmp
# LDFLAGS = -pthread $(CXXFLAGS) $(EXTRALDFLAGS) -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib -lomp

CXX = g++
# CXXFLAGS = -std=c++17 -Wall -pipe $(EXTRACXXFLAGS) -I/opt/homebrew/opt/libomp/include -Xclang -fopenmp
CXXFLAGS = -std=c++17 -Wall -pipe $(EXTRACXXFLAGS) -I/opt/homebrew/opt/libomp/include -Xclang
LDFLAGS = -pthread $(CXXFLAGS) $(EXTRALDFLAGS) -L/opt/homebrew/opt/libomp/lib -lomp

OBJS = main.o search.o evaluation.o
TEST_OBJS = timing-tests.o search.o evaluation.o

BINDIR = /usr/local/bin

EXE = engine
TEST_EXE = timing-tests

ifeq ($(BUILD),debug)
	CXXFLAGS += -O0 -g -fno-omit-frame-pointer
else
	CXXFLAGS += -O3 -DNDEBUG
endif

all: $(EXE) $(TEST_EXE)

$(EXE): $(OBJS)
	$(CXX) -o $@ $(OBJS) $(LDFLAGS)

$(TEST_EXE): $(TEST_OBJS)
	$(CXX) -o $@ $(TEST_OBJS) $(LDFLAGS)

install:
	-cp $(EXE) $(BINDIR)
	-strip $(BINDIR)/$(EXE)

uninstall:
	-rm -f $(BINDIR)/$(EXE)

clean:
	-rm -f $(OBJS) $(EXE) $(TEST_OBJS) $(TEST_EXE)
