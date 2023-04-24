# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: srapin <srapin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/21 21:53:58 by therodri          #+#    #+#              #
#    Updated: 2022/11/22 05:06:34 by srapin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

CC = gcc
CFLAGS = -Wall -Wextra -Werror
AR = ar rcs

FILES= ft_max\
		ft_strnlen\
		ft_num_len\
		ft_parse\
		ft_print_args\
		ft_print_cs\
		ft_print_mod\
		ft_print_nbrs\
		ft_printf\
		ft_putnbr_base\
		ft_reset_struct\
		ft_strstr\
		ft_write

SRCS_DIR = ./
SRCS = $(addprefix $(SRCS_DIR), $(addsuffix .c, $(FILES)))

OBJS_DIR = ./
OBJS = $(addprefix $(SRCS_DIR), $(addsuffix .o, $(FILES)))

LIBFT_DIR = mylibft/
LIBFT_NAME = libft.a

$(NAME): $(OBJS)
	cp ${LIBFT_DIR}${LIBFT_NAME} $@
	${AR} $@ $^

$(OBJS): makelibft

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

makelibft:
	cd ${LIBFT_DIR} && make

fcleanlibft:
	cd ${LIBFT_DIR} && make fclean

all: $(NAME)

clean: fcleanlibft
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME) bonus

re: clean all

bonus: $(NAME)

.PHONY: all clean fclean re
