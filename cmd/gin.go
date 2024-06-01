package cmd

import (
    "github.com/gin-gonic/gin"
)

func StartGin() {
    r := gin.Default()

    r.GET("/ping", func(c *gin.Context) {
        c.String(200, "pong  from gin server")
    })

    r.Run(":3001")
}
