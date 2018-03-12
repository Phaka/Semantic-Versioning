@echo off

set 

mkdir build
pushd build
mkdir win64
pushd win64 
pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build"
call vcvarsall.bat /clean_env
call vcvarsall.bat amd64 
popd
cmake -G "NMake Makefiles" ../.. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../../dist/win64/ -DCPACK_GENERATOR=WIX;ZIP;TGZ
nmake install
nmake package
popd

mkdir win32
pushd win32
pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build"
call vcvarsall.bat /clean_env
call vcvarsall.bat amd64_x86
popd
cmake -G "NMake Makefiles" ../.. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../../dist/win32/ -DCPACK_GENERATOR=WIX;ZIP;TGZ
nmake install
nmake package
popd
popd

pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build"
call vcvarsall.bat /clean_env
popd