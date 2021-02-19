cmake_minimum_required(VERSION 3.8)
project(VulkanTest)

set(CMAKE_CXX_STANDARD 14)

set(SOURCE_FILES main.cpp )

find_package(Vulkan REQUIRED)
if (Vulkan_FOUND)
  message(STATUS "Vulkan found")
  include_directories(${Vulkan_INCLUDE_DIRS})
  link_libraries (${Vulkan_LIBRARIES})
endif (Vulkan_FOUND)

#set(OpenGL_GL_PREFERENCE GLVND) #LEGACY
#find_package(OpenGL REQUIRED)
#if (OpenGL_FOUND)
    #message(STATUS "OpenGL found")
    #include_directories(${OPENGL_INCLUDE_DIR})
#endif(OpenGL_FOUND)


find_package(glfw3 REQUIRED)
if (glfw3_FOUND)
  message(STATUS "glfw3 found")
  include_directories(${GLFW_INCLUDE_DIRS})
  link_libraries (${GLFW_LIBRARIES})
endif (glfw3_FOUND)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})
target_link_libraries(${PROJECT_NAME} glfw ${Vulkan_LIBRARIES})
#target_link_libraries(${PROJECT_NAME} GL GLU GLEW glfw ${Vulkan_LIBRARIES})
