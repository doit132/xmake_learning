add_rules("mode.debug", "mode.release")

target("foo")
    -- 生成的目标类型, static 表示静态库文件
    set_kind("static")
    -- 生成静态库文件需要的源文件
    add_files("src/foo.c")

target("test")
    set_kind("binary")
    -- 添加依赖, 将上面生成的静态库文件包含进去
    add_deps("foo")
    add_files("src/main.c")
