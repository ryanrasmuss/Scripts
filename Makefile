srcs = example.c example2.c

bins = $(srcs:.c=)

CC = gcc
CFLAGS = -Wall

all: $(bins)

%:%.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -v $(bins)

