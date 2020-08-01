# Makefile for Cycsi COSC2325 Single Cycle Virtual Machine

TARGET	:= cycsi
APPS 	:= $(TARGET) test-runner

CXX 	:= g++
CFLAGS 	:= -Wall
LDFLAGS :=

ifdef COVERAGE
	CFLAGS += --coverage
	LDFLAGS += --coverage
endif

INC_DIR := include
INCS := $(addprefix -I,$(INC_DIR))

SRC_DIR = src
TEST_DIR = test

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst %.cpp,%.o, $(SRCS))

TEST_SRCS = $(wildcard $(TEST_DIR)/*.cpp)
MACH_SRCS = $(filter-out $(SRC_DIR)/main.cpp,$(SRCS))
TEST_OBJS = $(patsubst %.cpp,%.o,$(TEST_SRCS))
MACH_OBJS = $(patsubst %.cpp,%.o,$(MACH_SRCS))
HEADERS   = $(patsubst %.cpp,%.h,$(MACH_SRCS))

DEPS = make.dep

all:	$(APPS)

$(TARGET): $(OBJS)
	$(CXX) $(LDFLAGS) $^  -o $@

test-runner:	$(TEST_OBJS) $(MACH_OBJS)
	$(CXX) $(LDFLAGS) $^  -o $@

$(DEPS):	$(MACH_SRCS) $(HEADERS)
	$(CXX) -M $(SRCS) > $(DEPS)

include $(DEPS)

%.o:	%.cpp  
	$(CXX) $(CFLAGS) $(INCS) -c $< -o $@

clean:
	rm $(APPS) $(OBJS) $(TEST_OBJS)

test:	$(APPS)
	./test-runner

run:	$(APPS)
	./$(TARGET) -d test.cal

html:
	sphinx-build -b html -d docs/_build/doctrees docs docs/_build/html

.PHONY:	all clean run test
