# Go Gin App Example Skeleton

An example of gin contains many useful features


## Installation
```
$ go get github.com/baturorkun/go-gin-app
```

## How to run

### Required

- Mysql
- Redis

### Ready

Create a **blog database** and import ( /docs/sql/db.sql )

### Conf

You should modify `conf/app.ini`

```
[database]
Type = mysql
User = root
Password =
Host = 127.0.0.1:3306
Name = blog
TablePrefix = blog_

[redis]
Host = 127.0.0.1:6379
Password =
MaxIdle = 30
MaxActive = 30
IdleTimeout = 200
...
```

### Run
```
$ cd $GOPATH/src/go-gin-app

$ go run main.go 
```

### Docker Run
```
$ docker-compose up

Adminer Database Tool : http://localhost:8080

```

Project information and existing API

```
[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:	export GIN_MODE=release
 - using code:	gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /auth                     --> github.com/baturorkun/go-gin-app/routers/api.GetAuth (3 handlers)
[GIN-debug] GET    /swagger/*any             --> github.com/baturorkun/go-gin-app/vendor/github.com/swaggo/gin-swagger.WrapHandler.func1 (3 handlers)
[GIN-debug] GET    /api/v1/tags              --> github.com/baturorkun/go-gin-app/routers/api/v1.GetTags (4 handlers)
[GIN-debug] POST   /api/v1/tags              --> github.com/baturorkun/go-gin-app/routers/api/v1.AddTag (4 handlers)
[GIN-debug] PUT    /api/v1/tags/:id          --> github.com/baturorkun/go-gin-app/routers/api/v1.EditTag (4 handlers)
[GIN-debug] DELETE /api/v1/tags/:id          --> github.com/baturorkun/go-gin-app/routers/api/v1.DeleteTag (4 handlers)
[GIN-debug] GET    /api/v1/articles          --> github.com/baturorkun/go-gin-app/routers/api/v1.GetArticles (4 handlers)
[GIN-debug] GET    /api/v1/articles/:id      --> github.com/baturorkun/go-gin-app/routers/api/v1.GetArticle (4 handlers)
[GIN-debug] POST   /api/v1/articles          --> github.com/baturorkun/go-gin-app/routers/api/v1.AddArticle (4 handlers)
[GIN-debug] PUT    /api/v1/articles/:id      --> github.com/baturorkun/go-gin-app/routers/api/v1.EditArticle (4 handlers)
[GIN-debug] DELETE /api/v1/articles/:id      --> github.com/baturorkun/go-gin-app/routers/api/v1.DeleteArticle (4 handlers)

Listening port is 8000
Actual pid is 4393
```

## Features

- RESTful API
- Gorm
- Swagger
- logging
- Jwt-go
- Gin
- Graceful restart or stop (fvbock/endless)
- App configurable
- Cron
- Redis

### Resources

partial forked from EDDYCJY/go-gin-example
