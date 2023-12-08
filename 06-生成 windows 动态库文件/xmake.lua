
set_config("plat","windows")
target("foo")
    set_kind("shared")
    add_files("src/foo.c")
    if is_kind("shared") and is_plat("windows") then
        add_rules("utils.symbols.export_all", {export_classes = true})
    end

target("test")
    set_kind("binary")
    add_deps("foo")
    add_files("src/main.c")
