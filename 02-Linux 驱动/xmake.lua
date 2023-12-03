-- 添加规则
add_rules("plugin.compile_commands.autoupdate", {outputdir = "./"})

-- 设置配置选项 xmake f --sdk=""
set_defaultplat("linux")
set_defaultarchs("arm")
set_config("sdk","/usr/local/arm/bin/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf")
set_config("bindir","/usr/local/arm/bin/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin")

--
set_group("proxy","http://127.0.0.1:7890")
set_group("proxy","https://127.0.0.1:7890")
set_group("proxy","socks5://127.0.0.1:7890")


KDIR = "/home/doit/STM32MP157_Linux/linux5.4.31"

add_requires("linux-headers", {configs = {driver_modules = true}})

target("hello")
    add_rules("platform.linux.driver")
    add_files("src/*.c")
    add_packages("linux-headers")
    set_license("GPL-2.0")
