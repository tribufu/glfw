--- @diagnostic disable: undefined-global, undefined-field, lowercase-global

project "Glfw"
    targetname "glfw"
    location "."
    kind "StaticLib"
    language "C"
    warnings "Off"

    removeplatforms { "Any CPU" }

    files
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/context.c",
        "src/glfw_config.h",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/null_init.c",
        "src/null_joystick.c",
        "src/null_monitor.c",
        "src/null_window.c",
        "src/platform.c",
        "src/vulkan.c",
        "src/window.c",
    }

    includedirs
    {
        "include"
    }

    filter "system:windows"
        files
        {
            "src/egl_context.c",
            "src/osmesa_context.c",
            "src/wgl_context.c",
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_module.c",
            "src/win32_monitor.c",
            "src/win32_thread.c",
            "src/win32_time.c",
            "src/win32_window.c",
        }

        defines
        {
            "_CRT_SECURE_NO_WARNINGS",
            "_GLFW_WIN32",
        }

    filter "system:macosx"
        pic "On"

        files
        {
            "src/cocoa_*.h",
            "src/cocoa_*.m",
            "src/egl_context.c",
            "src/macos_*.c",
            "src/macos_*.h",
            "src/nsgl_context.m",
            "src/osmesa_context.c",
            "src/posix_*.c",
        }

        defines
        {
            "_GLFW_COCOA",
        }

    filter "system:linux"
        pic "On"

        systemversion "latest"

        files
        {
            "src/egl_context.c",
            "src/glx_context.c",
            "src/linux_joystick.c",
            "src/osmesa_context.c",
            "src/posix_*.c",
            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/xkb_unicode.c",
        }

        defines
        {
            "_GLFW_X11",
        }
