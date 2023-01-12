// #include "./minilibx_mms_20200219/mlx.h"
// #include "./minilibx_opengl_20191021/mlx.h"
// #include "./minilibx-linux/mlx.h"

#include <stdio.h>

int	main(void)
{
	void *mlx = mlx_init();
	printf("%p\n", mlx);

	return 0;
}
