# LIBWEBSOCKETS_FOUND - true if library and headers were found
# LIBWEBSOCKETS_INCLUDE_DIRS - include directories
# LIBWEBSOCKETS_LIBRARIES - library directories

find_package(PkgConfig)
pkg_check_modules(PC_LIBWEBSOCKETS QUIET libwebsockets)

find_path(LIBWEBSOCKETS_INCLUDE_DIR libwebsockets.h
	HINTS ${PC_LIBWEBSOCKETS_INCLUDEDIR} ${PC_LIBWEBSOCKETS_INCLUDE_DIRS} PATH_SUFFIXES libwebsockets)

find_library(LIBWEBSOCKETS_LIBRARY_libwebsockets NAMES websockets
	HINTS ${PC_LIBWEBSOCKETS_LIBDIR} ${PC_LIBWEBSOCKETS_LIBRARY_DIRS})

set(LIBWEBSOCKETS_LIBRARIES ${LIBWEBSOCKETS_LIBRARY_libwebsockets})
set(LIBWEBSOCKETS_INCLUDE_DIRS ${LIBWEBSOCKETS_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(LIBWEBSOCKETS DEFAULT_MSG LIBWEBSOCKETS_LIBRARY_libwebsockets LIBWEBSOCKETS_INCLUDE_DIR)

mark_as_advanced(LIBWEBSOCKETS_INCLUDE_DIR LIBWEBSOCKETS_LIBRARY)
