@echo off
set GOPATH=%~dp0
cd %~dp0
go fmt ./src/...
set version=0.13.0
echo.
echo 开始编译Windows 32位系统的程序
set GOOS=windows
set GOARCH=386
mkdir %GOOS% 1>nul 2>nul
mkdir %version% 1>nul 2>nul
move %version% %GOOS% 1>nul 2>nul
echo.
echo 开始编译服务端...
go build -o %GOOS%/%version%/frps.exe src/cmd/frps/main.go
echo 编译完成
echo.
echo 开始编译客户端...
go build -o %GOOS%/%version%/frpc.exe src/cmd/frpc/main.go
echo 编译完成
echo.

echo 开始编译Linux 32位系统的程序
set GOOS=linux
set GOARCH=386
mkdir %GOOS% 1>nul 2>nul
mkdir %version% 1>nul 2>nul
move %version% %GOOS% 1>nul 2>nul
echo.
echo 开始编译服务端...
go build -o %GOOS%/%version%/frps src/cmd/frps/main.go
echo 编译完成
echo.
echo 开始编译客户端...
go build -o %GOOS%/%version%/frpc src/cmd/frpc/main.go
echo 编译完成
echo.

echo 开始编译Linux arm系统的程序
set GOOS=linux
set GOARCH=arm
mkdir %GOOS%-%GOARCH% 1>nul 2>nul
mkdir %version% 1>nul 2>nul
move %version% %GOOS%-%GOARCH% 1>nul 2>nul
echo.
echo 开始编译服务端...
go build -o %GOOS%-%GOARCH%/%version%/frps src/cmd/frps/main.go
echo 编译完成
echo.
echo 开始编译客户端...
go build -o %GOOS%-%GOARCH%/%version%/frpc src/cmd/frpc/main.go
echo 编译完成
echo.

echo 开始编译Linux mips系统的程序
set GOOS=linux
set GOARCH=mips
mkdir %GOOS%-%GOARCH% 1>nul 2>nul
mkdir %version% 1>nul 2>nul
move %version% %GOOS%-%GOARCH% 1>nul 2>nul
echo.
echo 开始编译服务端...
go build -o %GOOS%-%GOARCH%/%version%/frps src/cmd/frps/main.go
echo 编译完成
echo.
echo 开始编译客户端...
go build -o %GOOS%-%GOARCH%/%version%/frpc src/cmd/frpc/main.go
echo 编译完成
echo.

echo 开始编译Linux mipsle系统的程序
set GOOS=linux
set GOARCH=mipsle
mkdir %GOOS%-%GOARCH% 1>nul 2>nul
mkdir %version% 1>nul 2>nul
move %version% %GOOS%-%GOARCH% 1>nul 2>nul
echo.
echo 开始编译服务端...
go build -o %GOOS%-%GOARCH%/%version%/frps src/cmd/frps/main.go
echo 编译完成
echo.
echo 开始编译客户端...
go build -o %GOOS%-%GOARCH%/%version%/frpc src/cmd/frpc/main.go
echo 编译完成
echo.

echo 开始编译MAC 32位系统的程序
set GOOS=darwin
set GOARCH=386
mkdir %GOOS% 1>nul 2>nul
mkdir %version% 1>nul 2>nul
move %version% %GOOS% 1>nul 2>nul
echo.
echo 开始编译服务端...
go build -o %GOOS%/%version%/frps src/cmd/frps/main.go
echo 编译完成
echo.
echo 开始编译客户端...
go build -o %GOOS%/%version%/frpc src/cmd/frpc/main.go
echo 编译完成
echo.
echo 按任意退出
pause>nul
