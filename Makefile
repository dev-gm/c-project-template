CC := clang
CFLAGS := -Wall -Wextra -Wpedantic
LDLIBS :=

IDIR := ./include
SDIR := ./src

SRCS := $(wildcard $(SDIR)/**/*.c) $(wildcard $(SDIR)/*.c)
OBJS := $(patsubst $(SDIR)/%.c,$(ODIR)/%.o,$(SRCS))

BIN := bin
EXE := $(BIN)/out

.PHONY: all run test clean bear

all: $(EXE)

$(EXE): $(SRCS)
	$(CC) $(CFLAGS) $(LDLIBS) -I$(IDIR) $^ -o $@

run:
	$(EXE)

test:
	@make clean
	@make
	@make run

clean:
	@rm -f $(EXE)

bear:
	@bear -- make
