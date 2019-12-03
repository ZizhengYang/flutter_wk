package controllers

import (
	"encoding/json"
	"github.com/astaxie/beego"
	"wkBackEnd/models"
)

type TaskController struct {
	beego.Controller
}

func getJsonTaskData(c *TaskController) *models.Task {
	t := new(models.Task)
	err := json.Unmarshal(c.Ctx.Input.RequestBody, &t)
	if err != nil {
		print("[JSON]Get json [task] data success")
	} else {
		print(err)
	}
	return t
}

func (c *TaskController) Add() {
	t := getJsonTaskData(c)
	id, err := t.AddTask()
	if err != nil {
		print("[User]Insert new user " + string(id) + " success")
	} else {
		print(err)
	}
}

func (c *TaskController) Delete() {
	t := new(models.Task)
	_ = json.Unmarshal(c.Ctx.Input.RequestBody, &t)
	_, _ = t.AddTask()
}

func (c *TaskController) Set() {
	t := new(models.Task)
	_ = json.Unmarshal(c.Ctx.Input.RequestBody, &t)
	_, _ = t.AddTask()
}

func (c *TaskController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplName = "index.tpl"
}