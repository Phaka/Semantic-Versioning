@echo off

set 

mkdir build
pushd build
mkdir win64
pushd win64 
pushd %VS140COMNTOOLS%
call vsdevcmd.bat /clean_env 
call vsdevcmd.bat amd64
popd
cmake -G "NMake Makefiles" ../.. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../../dist/win64/ -DCPACK_GENERATOR=WIX;ZIP;TGZ
nmake install
nmake package
popd

mkdir win32
pushd win32
pushd %VS140COMNTOOLS%
call vsdevcmd.bat /clean_env 
call vsdevcmd.bat amd64_x86
popd
cmake -G "NMake Makefiles" ../.. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../../dist/win32/ -DCPACK_GENERATOR=WIX;ZIP;TGZ
nmake install
nmake package
popd
popd

pushd %VS140COMNTOOLS%
call vsdevcmd.bat /clean_env 
popd

