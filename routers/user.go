package routers

import (
	"beegoDemo/controllers"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.UserController{}, "get:RenderLogin")
	beego.Router("/login/v", &controllers.UserController{}, "get:RenderLogin")
	beego.Router("/regist/v", &controllers.UserController{}, "get:RenderRegist")

	beego.Router("/login", &controllers.UserController{}, "get:Login")
	beego.Router("/regist", &controllers.UserController{}, "post:Regist")
	beego.Router("/logout", &controllers.UserController{}, "get:Logout")
}
