#pragma once

#define YES 1

#ifdef YES

extern Hazel::Application* Hazel::CreateApplication();

int main(int argc, char **argv)
{
    std::cout << "Hazel Engine!" << std::endl;
    auto app = Hazel::CreateApplication();
    app->Run();
    delete app;
}

#endif