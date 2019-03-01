package routers

import (
	"net/http"

	"github.com/gin-gonic/gin"

	_ "github.com/baturorkun/go-gin-app/docs"
	"github.com/swaggo/gin-swagger"
	"github.com/swaggo/gin-swagger/swaggerFiles"

	"github.com/baturorkun/go-gin-app/middleware/jwt"
	"github.com/baturorkun/go-gin-app/resources/export"
	"github.com/baturorkun/go-gin-app/resources/setting"
	"github.com/baturorkun/go-gin-app/resources/upload"
	"github.com/baturorkun/go-gin-app/routers/api"
	"github.com/baturorkun/go-gin-app/routers/api/v1"
)

func InitRouter() *gin.Engine {
	r := gin.New()

	r.Use(gin.Logger())

	r.Use(gin.Recovery())
	gin.SetMode(setting.ServerSetting.RunMode)

	r.StaticFS("/export", http.Dir(export.GetExcelFullPath()))
	r.StaticFS("/upload/images", http.Dir(upload.GetImageFullPath()))

	r.GET("/auth", api.GetAuth)
	r.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	r.POST("/upload", api.UploadImage)

	apiv1 := r.Group("/api/v1")
	apiv1.Use(jwt.JWT())
	{
		//
		apiv1.GET("/tags", v1.GetTags)
		//
		apiv1.POST("/tags", v1.AddTag)
		//
		apiv1.PUT("/tags/:id", v1.EditTag)
		//
		apiv1.DELETE("/tags/:id", v1.DeleteTag)
		//
		r.POST("/tags/export", v1.ExportTag)
		//
		r.POST("/tags/import", v1.ImportTag)

		//
		apiv1.GET("/articles", v1.GetArticles)
		//
		apiv1.GET("/articles/:id", v1.GetArticle)
		//
		apiv1.POST("/articles", v1.AddArticle)
		//
		apiv1.PUT("/articles/:id", v1.EditArticle)
		//
		apiv1.DELETE("/articles/:id", v1.DeleteArticle)

	}

	return r
}
