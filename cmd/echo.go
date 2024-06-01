package cmd

import (
    "net/http"
    "github.com/labstack/echo/v4"
)

func StartEcho() {
    e := echo.New()

    e.GET("/ping", func(c echo.Context) error {
        return c.String(http.StatusOK, "pong from echo server")
    })

    e.Start(":3000")
}
