package controllers

import (
	"github.com/astaxie/beego"
)

type TestController struct {
	beego.Controller
}

func (c *TestController) Get() {
	c.Ctx.WriteString("get-> /test")
}

func (c *TestController) Post() {
	c.Ctx.WriteString("Post-> /test")
}

func (c *TestController) Put() {
	c.Ctx.WriteString("Put-> /test")
}

func (c *TestController) Delete() {
	c.Ctx.WriteString("Delete-> /test")
}

func (this *TestController) List() {
	this.Ctx.WriteString("*-> /test/list")
}

func (this *TestController) Create() {
	this.Ctx.WriteString("post-> /test/create")
}

func (this *TestController) Update() {
	this.Ctx.WriteString("put-> /test/update")
}

func (this *TestController) Remove() {
	this.Ctx.WriteString("*-> /test/remove")
}

func (this *TestController) Login() {
	this.Ctx.WriteString("get-> /test/login")
}

func (this *TestController) Logout() {
	this.Ctx.WriteString("get-> /test/logout")
}

func (this *TestController) Register() {
	this.Ctx.WriteString("post-> /test/register")
}
