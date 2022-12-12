mkdir build

emcmake cmake -S . -B build
cmake --build build
#emrun build/imgui-emscripten-cmake-example.html