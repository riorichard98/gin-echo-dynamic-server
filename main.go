package main

import (
    "flag"
    "fmt"
    "os"
    "dynamic-app/cmd"
)

func main() {
    // Define the flags
    serverType := flag.String("server", "", "Specify the server to run: gin or echo")
    flag.Parse()

    // Check the server type and start the appropriate server
    switch *serverType {
    case "gin":
        fmt.Println("Starting Gin server...")
        cmd.StartGin()
    case "echo":
        fmt.Println("Starting Echo server...")
        cmd.StartEcho()
    default:
        fmt.Println("Usage: go run main.go -server [gin|echo]")
        os.Exit(1)
    }
}