@echo off
set GOPATH=%~dp0
cd %~dp0
go fmt ./src/...
set version=0.13.0

echo.
echo 开始编译Windows 32位系统的程序
set GOOS=windows
set GOARCH=386
echo.
echo 开始编译服务端...
go build -o bin/%GOOS%/%version%/frps.exe ./src/cmd/frps
echo 编译完成
echo.
echo 开始编译客户端...
go build -o bin/%GOOS%/%version%/frpc.exe ./src/cmd/frpc/main.go
echo 编译完成
echo.

echo 开始编译Linux 32位系统的程序
set GOOS=linux
set GOARCH=386
echo.
echo 开始编译服务端...
go build -o bin/%GOOS%/%version%/frps ./src/cmd/frps/main.go
echo 编译完成
echo.
echo 开始编译客户端...
go build -o bin/%GOOS%/%version%/frpc ./src/cmd/frpc/main.go
echo 编译完成
echo.

echo 开始编译Linux arm系统的程序
set GOOS=linux
set GOARCH=arm
echo.
echo 开始编译服务端...
go build -o bin/%GOOS%-%GOARCH%/%version%/frps ./src/cmd/frps/main.go
echo 编译完成
echo.
echo 开始编译客户端...
go build -o bin/%GOOS%-%GOARCH%/%version%/frpc ./src/cmd/frpc/main.go
echo 编译完成
echo.

echo 开始编译Linux arm系统的程序
set GOOS=linux
set GOARCH=mips
echo.
echo 开始编译服务端...
go build -o bin/%GOOS%-%GOARCH%/%version%/frps ./src/cmd/frps/main.go
echo 编译完成
echo.
echo 开始编译客户端...
go build -o bin/%GOOS%-%GOARCH%/%version%/frpc ./src/cmd/frpc/main.go
echo 编译完成
echo.

echo 开始编译Linux arm系统的程序
set GOOS=linux
set GOARCH=mipsle
echo.
echo 开始编译服务端...
go build -o bin/%GOOS%-%GOARCH%/%version%/frps ./src/cmd/frps/main.go
echo 编译完成
echo.
echo 开始编译客户端...
go build -o bin/%GOOS%-%GOARCH%/%version%/frpc ./src/cmd/frpc/main.go
echo 编译完成
echo.

echo 开始编译MAC 32位系统的程序
set GOOS=darwin
set GOARCH=386
echo.
echo 开始编译服务端...
go build -o bin/%GOOS%-%GOARCH%/%version%/frps ./src/cmd/frps/main.go
echo 编译完成
echo.
echo 开始编译客户端...
go build -o bin/%GOOS%-%GOARCH%/%version%/frpc ./src/cmd/frpc/main.go
echo 编译完成
echo.
echo 按任意退出
pause>nul
