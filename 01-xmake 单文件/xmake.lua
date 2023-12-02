-- 添加编程模式, debug 模式和 release 模式
add_rules("mode.debug", "mode.release")

target("test")
    -- 最终生成的目标类型, binary
    set_kind("binary")
    -- 生成该目标的源文件
    add_files("src/*.c")
