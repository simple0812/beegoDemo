package controllers

import (
	"beegoDemo/models"
	"beegoDemo/utils"
	// "encoding/json"
	"fmt"
	"github.com/astaxie/beego"
	"time"
)

type UserController struct {
	beego.Controller
}

func (this *UserController) RenderLogin() {
	this.TplNames = "login.tpl"
}

func (this *UserController) RenderRegist() {
	this.TplNames = "regist.tpl"
}

func (this *UserController) Login() {
	this.Ctx.WriteString("Post-> /test")
}

func (this *UserController) Logout() {

	this.Ctx.WriteString("Put-> /test")
}

func (this *UserController) Regist() {

	userName := this.GetString("name")
	password := this.GetString("password")

	user := models.User{
		UserName:  userName,
		Password:  password,
		Status:    1,
		CreatedAt: int(time.Now().Unix()),
	}

	models.DB.Create(&user)
	fmt.Println(user.Id)

	p, err := utils.GetSucessResult(user)

	if err != nil {
		this.Ctx.WriteString(err.Error())
	} else {
		this.Ctx.WriteString(p)
	}
}
