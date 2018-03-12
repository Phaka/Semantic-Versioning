@echo off

mkdir tmp
pushd tmp
pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\"
call vcvarsall.bat amd64 
popd
cmake -G "NMake Makefiles" .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../dist/win64/ -DCPACK_GENERATOR=WIX;ZIP;TGZ
nmake install
nmake package
popd
