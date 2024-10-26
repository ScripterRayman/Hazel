#pragma once

#ifdef _WIN32
    #ifdef BUILD_DLL
        #define HAZEL_API __declspec(dllexport)
    #else
        #define HAZEL_API __declspec(dllimport)
    #endif
#else
    #ifdef HZ_BUILD_DLL
        #define HAZEL_API __attribute__((visibility("default")))
    #else
        #define HAZEL_API
    #endif
#endif