NAME = a.out
CC = cc
CFLAGS = -Wall -Wextra -Werror
LIBS = -Lmlx -lmlx_Linux -L/usr/X11R6/lib -lXext -lX11
INLCUDE = -I ./include -I /usr/X11R6/inxlude
SRCS = main.c
OBJDIR = ./obj
OBJS = $(addprefix $(OBJDIR)/, $(SRCS:.c=.o))
LIBFT_PATH = ./libft
LIBFT = $(LIBFT_PATH)/libft.a
MINILIB_PATH = ./minilibx_mms_20200219
# MINILIB_PATH = ./minilibx_opengl_20191021
# MINILIB_PATH = ./minilibx-linux
MINILIB = $(MINILIB_PATH)/libmlx*

ifeq ($(shell uname),Darwin)
FRMEWORK = -framework OpenGL -framework Appkit
LIBS = -L$(MINILIB_PATH) -lmlx_Darwin -L/usr/X11R6/lib -lXext -lX11
endif

all : $(NAME)

$(NAME) : $(OBJDIR) $(LIBFT) $(MINILIB) $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LIBFT) $(LIBS) $(FRMEWORK) $(INLCUDE) -o $(NAME)

$(OBJDIR) :
	mkdir -p $(OBJDIR)

$(OBJDIR)/%.o: %.c
	$(CC) -c $< -o $@ $(CFLAGS) $(INLCUDE)

$(LIBFT) :
	make -C $(LIBFT_PATH)

$(MINILIB) :
	make -C $(MINILIB_PATH)

clean :
	make clean -C $(LIBFT_PATH)
	@$(RM) $(OBJS)

fclean : clean
	make fclean -C $(LIBFT_PATH)
	make clean -C $(MINILIB_PATH)
	@$(RM) $(NAME)

re : fclean all
