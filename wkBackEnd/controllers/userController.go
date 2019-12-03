package controllers

import (
	"encoding/json"
	"github.com/astaxie/beego"
	"wkBackEnd/models"
)

type UserController struct {
	beego.Controller
}

func getJsonUserData(c *UserController) *models.User {
	t := new(models.User)
	err := json.Unmarshal(c.Ctx.Input.RequestBody, &t)
	if err != nil {
		print("[JSON]Get json [task] data success")
	} else {
		print(err)
	}
	return t
}

func (c *UserController) Add() {
	t := getJsonUserData(c)
	id, err := t.AddUser()
	if err != nil {
		print("[User]Insert new user " + string(id) + " success")
	} else {
		print(err)
	}
}

func (c *UserController) Delete() {
	t := new(models.Task)
	_ = json.Unmarshal(c.Ctx.Input.RequestBody, &t)
	_, _ = t.AddTask()
}

func (c *UserController) Set() {
	t := new(models.Task)
	_ = json.Unmarshal(c.Ctx.Input.RequestBody, &t)
	_, _ = t.AddTask()
}

func (c *UserController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplName = "index.tpl"
}