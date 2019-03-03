package main

import (
	"fmt"
	"github.com/baturorkun/go-gin-app/models"
	"github.com/baturorkun/go-gin-app/resources/logging"
	"log"
	"net/http"

	"github.com/baturorkun/go-gin-app/resources/gredis"
	"github.com/baturorkun/go-gin-app/resources/setting"
	"github.com/baturorkun/go-gin-app/routers"
)

func init() {
	logging.Setup()
	setting.Setup()
	models.Setup()
	gredis.Setup()
}

// @title Golang Gin API
// @version 1.0
// @description An example of gin
// @termsOfService https://github.com/baturorkun/go-gin-app
// @license.name MIT
// @license.url https://github.com/baturorkun/go-gin-app/blob/master/LICENSE
func main() {
	routersInit := routers.InitRouter()
	readTimeout := setting.ServerSetting.ReadTimeout
	writeTimeout := setting.ServerSetting.WriteTimeout
	endPoint := fmt.Sprintf(":%d", setting.ServerSetting.HttpPort)
	maxHeaderBytes := 1 << 20

	server := &http.Server{
		Addr:           endPoint,
		Handler:        routersInit,
		ReadTimeout:    readTimeout,
		WriteTimeout:   writeTimeout,
		MaxHeaderBytes: maxHeaderBytes,
	}

	log.Printf("[info] start http server listening %s", endPoint)

	server.ListenAndServe()

	// If you want Graceful Restart, you need a Unix system and download github.com/fvbock/endless
	//endless.DefaultReadTimeOut = readTimeout
	//endless.DefaultWriteTimeOut = writeTimeout
	//endless.DefaultMaxHeaderBytes = maxHeaderBytes
	//server := endless.NewServer(endPoint, routersInit)
	//server.BeforeBegin = func(add string) {
	//	log.Printf("Actual pid is %d", syscall.Getpid())
	//}
	//
	//err := server.ListenAndServe()
	//if err != nil {
	//	log.Printf("Server err: %v", err)
	//}
}
