-- ### 设置一些全局变量
-- 项目名称
g_ProjectName = "STM32MP157"

-- ### 设置一些局部变量
local ProjectName = g_ProjectName
local sdkdir = "/usr/local/arm/bin/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf"
local bindir = sdkdir.."/bin"
-- Linux 内核头文件目录, 这个头文件目录需要自己编译生成, 生成命令: make ARCH=arm INSTALL_HDR_PATH=./head_files/ headers_install
local KDIR = "/home/doit/STM32MP157_Linux/linux5.4.31/head_files/include"

-- ### 基本设置
-- 设置工程名
set_project(g_ProjectName)
-- 设置工程版本
set_version("1.0.0")

-- ### 添加规则
-- 生成 compile_commands.json 文件, 生成目录当前文件所在目录下
add_rules("plugin.compile_commands.autoupdate", {outputdir = "./"})
-- 添加编译模式, debug 模式和 release 模式
-- 参考: https://www.bookstack.cn/read/xmake/manual-custom_rule.md#mode.debug
-- add_rules("mode.debug", "mode.release", "mode.releasedbg", "mode.minsizerel")

-- ### 设置配置选项 xmake f --sdk="", 可以通过 xmake f --help 查看有哪些属性
-- set_defaultplat("cross")
-- set_defaultarchs("arm")
-- set_config("sdk", sdkdir)
-- set_config("bindir", bindir)
set_config("plat", "cross")
set_config("arch", "arm")

-- ### 自定义 toolchain
toolchain("arm-none-linux-gnueabihf")
    set_kind("standalone")
    set_sdkdir(sdkdir)
    set_bindir(bindir)
toolchain_end()
-- 设置工具链
set_toolchains("arm-none-linux-gnueabihf")

-- ### target
target(ProjectName)
    add_rules("platform.linux.driver")
    add_files("src/*.c")
    set_values("linux.driver.linux-headers", KDIR)
    set_license("GPL-2.0")
target_end()
