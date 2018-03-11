cmake_minimum_required(VERSION 3.10. FATAL_ERROR)

project("semver-command-line")

set (SEMVER_VERSION_MAJOR       1)
set (SEMVER_VERSION_MINOR       0)
set (SEMVER_VERSION_REVISION    53)

configure_file (
  "${PROJECT_SOURCE_DIR}/version.h.in"
  "${PROJECT_BINARY_DIR}/version.h"
)

# target_compile_options(tgt PRIVATE "/MD$<$<CONFIG:Debug>:d>")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /MD")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MDd")

include_directories("${PROJECT_BINARY_DIR}")

add_executable(semver main.c)

install(TARGETS semver RUNTIME DESTINATION bin)


set(CPACK_WIX_UPGRADE_GUID "570bb36f-66d6-4498-801a-3b068b7e32b3")

include (InstallRequiredSystemLibraries)
set (CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/../setup/License.rtf")
set (CPACK_PACKAGE_VERSION_MAJOR "${SEMVER_VERSION_MAJOR}")
set (CPACK_PACKAGE_VERSION_MINOR "${SEMVER_VERSION_MINOR}")
set (CPACK_PACKAGE_VERSION_PATCH "${SEMVER_VERSION_REVISION}")
# set (CPACK_PACKAGE_NAME "Semantic Versioning")
set (CPACK_PACKAGE_VENDOR "Phaka")
set (CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/../setup/description.txt")
set (CPACK_PACKAGE_DESCRIPTION_SUMMARY "semantic versioning tool")
# set (CPACK_PACKAGE_FILE_NAME "semver-${CPACK_PACKAGE_VERSION}-${CPACK_SYSTEM_NAME}.")
set (CPACK_PACKAGE_INSTALL_DIRECTORY "Phaka/Semantic Versioning")

include (CPack)