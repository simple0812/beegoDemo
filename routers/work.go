package routers

import (
	"beegoDemo/controllers"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/workOvertime/v", &controllers.WorkController{}, "get:RenderV")
	beego.Router("/workOvertime/users/v", &controllers.WorkController{}, "get:RenderUsers")

	beego.Router("/workOvertime/users", &controllers.WorkController{}, "get:PageByUsers")
	beego.Router("/workOvertime/excel", &controllers.WorkController{}, "get:ExportByExcel")
	beego.Router("/workOvertime/:id", &controllers.WorkController{}, "get:GetById")
	beego.Router("/workOvertime", &controllers.WorkController{}, "get:GetByMonth")
	beego.Router("/workOvertime", &controllers.WorkController{}, "post:Create")
}
