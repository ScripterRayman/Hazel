#pragma once

#define YES 1

#ifdef HZ_PLATFORM_MACOS

extern Hazel::Application* Hazel::CreateApplication();

int main(int argc, char **argv)
{
    Hazel::Log::Init();
    HZ_CORE_WARN("Initialized Log!");
    int a = 10;
    HZ_INFO("Hello! Var={0}", a);

    auto app = Hazel::CreateApplication();
    app->Run();
    delete app;
}

#endif