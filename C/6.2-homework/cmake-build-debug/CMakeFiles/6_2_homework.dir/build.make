# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2021.1.3\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2021.1.3\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\16011\Desktop\CodeCache\C\6.2-homework

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\16011\Desktop\CodeCache\C\6.2-homework\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/6_2_homework.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/6_2_homework.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/6_2_homework.dir/flags.make

CMakeFiles/6_2_homework.dir/main.cpp.obj: CMakeFiles/6_2_homework.dir/flags.make
CMakeFiles/6_2_homework.dir/main.cpp.obj: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\16011\Desktop\CodeCache\C\6.2-homework\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/6_2_homework.dir/main.cpp.obj"
	C:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\6_2_homework.dir\main.cpp.obj -c C:\Users\16011\Desktop\CodeCache\C\6.2-homework\main.cpp

CMakeFiles/6_2_homework.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/6_2_homework.dir/main.cpp.i"
	C:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\16011\Desktop\CodeCache\C\6.2-homework\main.cpp > CMakeFiles\6_2_homework.dir\main.cpp.i

CMakeFiles/6_2_homework.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/6_2_homework.dir/main.cpp.s"
	C:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\16011\Desktop\CodeCache\C\6.2-homework\main.cpp -o CMakeFiles\6_2_homework.dir\main.cpp.s

# Object files for target 6_2_homework
6_2_homework_OBJECTS = \
"CMakeFiles/6_2_homework.dir/main.cpp.obj"

# External object files for target 6_2_homework
6_2_homework_EXTERNAL_OBJECTS =

6_2_homework.exe: CMakeFiles/6_2_homework.dir/main.cpp.obj
6_2_homework.exe: CMakeFiles/6_2_homework.dir/build.make
6_2_homework.exe: CMakeFiles/6_2_homework.dir/linklibs.rsp
6_2_homework.exe: CMakeFiles/6_2_homework.dir/objects1.rsp
6_2_homework.exe: CMakeFiles/6_2_homework.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\16011\Desktop\CodeCache\C\6.2-homework\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable 6_2_homework.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\6_2_homework.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/6_2_homework.dir/build: 6_2_homework.exe

.PHONY : CMakeFiles/6_2_homework.dir/build

CMakeFiles/6_2_homework.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\6_2_homework.dir\cmake_clean.cmake
.PHONY : CMakeFiles/6_2_homework.dir/clean

CMakeFiles/6_2_homework.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\16011\Desktop\CodeCache\C\6.2-homework C:\Users\16011\Desktop\CodeCache\C\6.2-homework C:\Users\16011\Desktop\CodeCache\C\6.2-homework\cmake-build-debug C:\Users\16011\Desktop\CodeCache\C\6.2-homework\cmake-build-debug C:\Users\16011\Desktop\CodeCache\C\6.2-homework\cmake-build-debug\CMakeFiles\6_2_homework.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/6_2_homework.dir/depend

