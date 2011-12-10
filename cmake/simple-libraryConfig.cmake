# Author: Félix C. Morency
# 2011.10

#Set the following variable
# simple-library_FOUND: True if the library has been found
# simple-library_include_dir: Path to header files

#Assure that the library has not already been found
if(NOT simple-library_FOUND)
    set(lib_name simple-library)

    #Find the include directory
    find_path(${lib_name}_include_dir NAMES ${lib_name}.cmake.hpp
        PATHS ${${lib_name}_DIR}
        PATH_SUFFIXES /../include)

    #Standard work to make sure the different variables have been set. This
    # command will set the simple-library_FOUND variable.
    include(FindPackageHandleStandardArgs)
    find_package_handle_standard_args(${lib_name} DEFAULT_MSG
        ${lib_name}_include_dir)

    #If the target have not already been added and if the project calling this
    # file is not the simple-library CMakeLists.txt, add the library to the
    # build chain.
    if(NOT TARGET ${lib_name} AND
        NOT ${PROJECT_NAME} STREQUAL ${lib_name})
        add_subdirectory(${${lib_name}_DIR}/../
            ${CMAKE_CURRENT_BINARY_DIR}/lib/${lib_name})
    endif()
endif()

