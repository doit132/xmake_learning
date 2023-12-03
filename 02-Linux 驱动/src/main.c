// 头文件
#include <linux/init.h>	  // 包含宏定义的头文件
#include <linux/module.h> // 包含初始化加载模块的头文件

// 功能实现
static int hello_init(void)
{
	printk("hello world !!!\n"); // 使用的是内核提供的打印函数,
				     // 在内核中是无法使用C语言的printf的
	return 0;
}
static void hello_exit(void)
{
	printk("bye bye !!!\n");
}

// 驱动模块的入口和出口
module_init(hello_init);
module_exit(hello_exit);

// 声明模块拥有开源许可证
MODULE_LICENSE("GPL");
MODULE_AUTHOR("doit");
MODULE_VERSION("v1.0");
