package routers

import (
	"beegoDemo/controllers"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/test", &controllers.TestController{})

	beego.Router("/test/list", &controllers.TestController{}, "*:List")
	beego.Router("/test/create", &controllers.TestController{}, "post:Create")
	beego.Router("/test/update", &controllers.TestController{}, "put:Update")
	beego.Router("/test/remove", &controllers.TestController{}, "delete:Remove")
}
