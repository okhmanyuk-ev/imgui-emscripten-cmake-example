cmake_minimum_required(VERSION 3.10)
project(imgui-emscripten-cmake-example)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(${PROJECT_NAME} 
	imgui/examples/example_emscripten_opengl3/main.cpp
	imgui/backends/imgui_impl_sdl.cpp
	imgui/backends/imgui_impl_opengl3.cpp
)

target_include_directories(${PROJECT_NAME} PUBLIC
	imgui/backends
)

target_compile_definitions(${PROJECT_NAME} PUBLIC "IMGUI_DISABLE_FILE_FUNCTIONS")

# imgui

file(GLOB IMGUI_SRC 
	imgui/*.cpp 
	imgui/*.h
)
target_include_directories(${PROJECT_NAME} PUBLIC imgui)
add_library(imgui STATIC ${IMGUI_SRC})
target_link_libraries(${PROJECT_NAME} imgui)

if(${CMAKE_SYSTEM_NAME} MATCHES "Emscripten")
	set(USE_FLAGS "-s USE_SDL=2")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${USE_FLAGS}")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${USE_FLAGS}")
	set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${USE_FLAGS}")
	set(CMAKE_EXECUTABLE_SUFFIX .html)
endif()








