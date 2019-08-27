include(FindPackageHandleStandardArgs)

find_path(OpenEXR_INCLUDE_DIRS OpenEXR/OpenEXRConfig.h)
find_path(OPENEXR_INCLUDE_PATHS NAMES ImfRgbaFile.h PATH_SUFFIXES OpenEXR)

file(STRINGS "${OpenEXR_INCLUDE_DIRS}/OpenEXR/OpenEXRConfig.h" OPENEXR_CONFIG_H)

string(REGEX REPLACE "^.*define OPENEXR_VERSION_MAJOR ([0-9]+).*$" "\\1" OpenEXR_VERSION_MAJOR "${OPENEXR_CONFIG_H}")
string(REGEX REPLACE "^.*define OPENEXR_VERSION_MINOR ([0-9]+).*$" "\\1" OpenEXR_VERSION_MINOR "${OPENEXR_CONFIG_H}")
set(OpenEXR_LIB_SUFFIX "${OpenEXR_VERSION_MAJOR}_${OpenEXR_VERSION_MINOR}")

include(SelectLibraryConfigurations)

if(NOT OpenEXR_BASE_LIBRARY)
  find_library(OpenEXR_BASE_LIBRARY_RELEASE NAMES IlmImf-${OpenEXR_LIB_SUFFIX})
  find_library(OpenEXR_BASE_LIBRARY_DEBUG NAMES IlmImf-${OpenEXR_LIB_SUFFIX}_d)
  select_library_configurations(OpenEXR_BASE)
endif()

if(NOT OpenEXR_UTIL_LIBRARY)
  find_library(OpenEXR_UTIL_LIBRARY_RELEASE NAMES IlmImfUtil-${OpenEXR_LIB_SUFFIX})
  find_library(OpenEXR_UTIL_LIBRARY_DEBUG NAMES IlmImfUtil-${OpenEXR_LIB_SUFFIX}_d)
  select_library_configurations(OpenEXR_UTIL)
endif()

if(NOT OpenEXR_HALF_LIBRARY)
  find_library(OpenEXR_HALF_LIBRARY_RELEASE NAMES Half-${OpenEXR_LIB_SUFFIX})
  find_library(OpenEXR_HALF_LIBRARY_DEBUG NAMES Half-${OpenEXR_LIB_SUFFIX}_d)
  select_library_configurations(OpenEXR_HALF)
endif()

if(NOT OpenEXR_IEX_LIBRARY)
  find_library(OpenEXR_IEX_LIBRARY_RELEASE NAMES Iex-${OpenEXR_LIB_SUFFIX})
  find_library(OpenEXR_IEX_LIBRARY_DEBUG NAMES Iex-${OpenEXR_LIB_SUFFIX}_d)
  select_library_configurations(OpenEXR_IEX)
endif()

if(NOT OpenEXR_MATH_LIBRARY)
  find_library(OpenEXR_MATH_LIBRARY_RELEASE NAMES Imath-${OpenEXR_LIB_SUFFIX})
  find_library(OpenEXR_MATH_LIBRARY_DEBUG NAMES Imath-${OpenEXR_LIB_SUFFIX}_d)
  select_library_configurations(OpenEXR_MATH)
endif()

if(NOT OpenEXR_THREAD_LIBRARY)
  find_library(OpenEXR_THREAD_LIBRARY_RELEASE NAMES IlmThread-${OpenEXR_LIB_SUFFIX})
  find_library(OpenEXR_THREAD_LIBRARY_DEBUG NAMES IlmThread-${OpenEXR_LIB_SUFFIX}_d)
  select_library_configurations(OpenEXR_THREAD)
endif()

if(NOT OpenEXR_IEXMATH_LIBRARY)
  find_library(OpenEXR_IEXMATH_LIBRARY_RELEASE NAMES IexMath-${OpenEXR_LIB_SUFFIX})
  find_library(OpenEXR_IEXMATH_LIBRARY_DEBUG NAMES IexMath-${OpenEXR_LIB_SUFFIX}d)
  select_library_configurations(OpenEXR_IEXMATH)
endif()

set(OPENEXR_HALF_LIBRARY "${OpenEXR_HALF_LIBRARY}")
set(OPENEXR_IEX_LIBRARY "${OpenEXR_IEX_LIBRARY}")
set(OPENEXR_IMATH_LIBRARY "${OpenEXR_MATH_LIBRARY}")
set(OPENEXR_ILMIMF_LIBRARY "${OpenEXR_BASE_LIBRARY}")
set(OPENEXR_ILMIMFUTIL_LIBRARY "${OpenEXR_UTIL_LIBRARY}")
set(OPENEXR_ILMTHREAD_LIBRARY "${OpenEXR_THREAD_LIBRARY}")

set(OpenEXR_LIBRARY "${OpenEXR_BASE_LIBRARY}")

set(OpenEXR_LIBRARIES
    ${OpenEXR_LIBRARY}
    ${OpenEXR_MATH_LIBRARY}
    ${OpenEXR_IEXMATH_LIBRARY}
    ${OpenEXR_UTIL_LIBRARY}
    ${OpenEXR_HALF_LIBRARY}
    ${OpenEXR_IEX_LIBRARY}
    ${OpenEXR_THREAD_LIBRARY}
)

set(OPENEXR_LIBRARIES
    ${OPENEXR_HALF_LIBRARY}
    ${OPENEXR_IEX_LIBRARY}
    ${OPENEXR_IMATH_LIBRARY}
    ${OPENEXR_ILMIMF_LIBRARY}
    ${OPENEXR_ILMTHREAD_LIBRARY}
)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(OpenEXR REQUIRED_VARS OpenEXR_LIBRARIES OpenEXR_INCLUDE_DIRS)

if(OpenEXR_FOUND)
    set(OPENEXR_FOUND 1)
endif()
