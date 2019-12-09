package controllers

import (
	"github.com/astaxie/beego"
	"wkBackEnd/models"
)

// Operations about Users
type CompanyController struct {
	beego.Controller
}

// @Title CreateUser
// @Description create companies
// @Param	body		body 	models.Company	true		"body for user content"
// @Success 200 {int} models.Company.Id
// @Failure 403 body is empty
// @router / [post]
func (c *CompanyController) Login() {
	company := new(models.Company)
	company.Email = ""
}

// @Title CreateUser
// @Description create companies
// @Param	body		body 	models.Company	true		"body for user content"
// @Success 200 {int} models.Company.Id
// @Failure 403 body is empty
// @router / [post]
func (c *CompanyController) Signup() {

}