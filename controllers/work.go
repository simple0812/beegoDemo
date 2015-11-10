package controllers

import (
	"github.com/astaxie/beego"
)

type WorkController struct {
	beego.Controller
}

func (this *WorkController) RenderV() {
	this.TplNames = "workOvertime/index.tpl"
}

func (this *WorkController) RenderUsers() {
	this.TplNames = "workOvertime/users.tpl"
}

func (this *WorkController) ExportByExcel() {
	this.Ctx.WriteString("Put-> /test")
}

func (this *WorkController) GetById() {
	this.Ctx.WriteString("Delete-> /test")
}

func (this *WorkController) GetByMonth() {
	this.Ctx.WriteString("Delete-> /test")
}

func (this *WorkController) Create() {
	this.Ctx.WriteString("Delete-> /test")
}

func (this *WorkController) PageByUsers() {
	this.Ctx.WriteString("Delete-> /test")
}
