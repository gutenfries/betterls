/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
core.h (c) 2022
Desc: description
Created:  2022-05-03T19:06:37.869Z
Modified:2022-05-03T19:06:40.400Z
*/

#pragma once

#define OOF_IMPL
// #define _HAS_CXX17 1

// #include <stdio.h>
// #include <string.h>
// #include <stdlib.h>
// #include <sys/types.h>
#include <iostream>
#include <string>

#ifdef _WIN32
#include "../lib/dirent-1.23.2/include/dirent.h"
#else
#include <dirent.h>
#endif

#include "../lib/termcolor-2.0.0/termcolor.hpp"

#include "../lib/yaml-cpp-yaml-cpp-0.7.0/include/yaml-cpp/yaml.h"
