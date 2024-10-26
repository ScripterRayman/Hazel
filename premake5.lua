workspace "Hazel"
    architecture "x64"
    if _ACTION == "gmake2" and os.host() == "macosx" then
        architecture "ARM64" -- macOS M1 architecture
    end

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Hazel"
    location "Hazel"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/vendor/spdlog/include"
    }

    filter "system:macosx"
        architecture "ARM64"
        cppdialect "C++17"
        staticruntime "On"

        defines
        {
            "HZ_PLATFORM_MACOS",
            "HZ_BUILD_DLL"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }



    filter "configurations:Debug"
        defines "HZ_DEBUG"
        symbols "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Hazel/vendor/spdlog/include",
        "Hazel/src"
    }

    links
    {
        "Hazel"
    }

    filter "system:macosx"
        architecture "ARM64"
        cppdialect "C++17"
        staticruntime "On"

        defines
        {
            "HZ_PLATFORM_MACOS"
        }

    filter "configurations:Debug"
        defines "HZ_DEBUG"
        symbols "On"
