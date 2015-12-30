
CC = gcc

NASM = nasm -f elf64

RM = rm -f

CFLAGS += -Wextra -Wall -Werror

LDFLAGS =

NAME = libasm.so

SRCS = strlen.S

OBJS = $(SRCS:.S=.o)

all: $(NAME)

$(NAME): 
	$(NASM) $(SRCS)
	$(CC) -fpic -shared $(OBJS) -o $(NAME) $(LDFLAGS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all
