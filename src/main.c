#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <ctype.h>
#include <version.h>

#ifdef _DEBUG
#define CONFIG "Debug"
#else
#define CONFIG "Release"
#endif

#if defined(__LP64__) || defined(_WIN64) || (defined(__x86_64__) && !defined(__ILP32__) ) || defined(_M_X64) || defined(__ia64) || defined (_M_IA64) || defined(__aarch64__) || defined(__powerpc64__)
    #define ARCHITECTURE "x64"
#else
    #define ARCHITECTURE "x86"
#endif


int main(int argc, char *argv[])
{
    fprintf(stdout, "%s %d.%d.%d (%s %s)\n", argv[0], SEMVER_VERSION_MAJOR, SEMVER_VERSION_MINOR, SEMVER_VERSION_REVISION, CONFIG, ARCHITECTURE);
    return 0;
}