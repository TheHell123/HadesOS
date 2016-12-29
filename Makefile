SRCS = $(shell find -name '*.[cS]')
OBJS = $(addsuffix .o, $(basename $(SRCS)))

CC = gcc
LD = ld

ASFLAGS = -m32
CFLAGS = -m32 -Wall -g -fno-stack-protector -nostdinc
LDFLAGS = -melf_i386 -Tkernel.ld

kernel: $(OBJS)
	$(LD) $(LDFLAGS) -o bin/$@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^
	git add $^

%.o: %.S
	$(CC) $(ASFLAGS) -c -o $@ $^
	git add $^

clean:
	rm $(OBJS)
	clear

.PHONY: clean all
