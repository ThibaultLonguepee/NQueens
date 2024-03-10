##
## EPITECH PROJECT, 2024
## ImageCompressor
## File description:
## Makefile
##

NAME	=	nQueens
PROJECT		=	NQueens

all:
	@stack build --allow-different-user
	@cp $(shell stack path --local-install-root)/bin/$(PROJECT)-exe $(NAME)

clean:

fclean: clean
	@rm -rf $(NAME)

re: fclean all

# weewoo was here
