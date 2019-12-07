package controllers

import (
	"github.com/astaxie/beego"
	models "wkBackEnd/models"
	"wkBackEnd/utils/constant"
	"wkBackEnd/utils/feedback"
)

// Operations about Users
type AlphaUserController struct {
	beego.Controller
}

// @Title CreateUser
// @Description create users
// @Param	body		body 	models.User	true		"body for user content"
// @Success 200 {int} models.User.Id
// @Failure 403 body is empty
// @router / [post]
func (u *AlphaUserController) Login() {
	user := new(models.AlphaUser)
	user.PhoneNum = u.GetString("phoneNum")
	//print(user.PhoneNum+"\n")
	//print(constant.Alpha_accessCode+"\n")
	//print(u.GetString("verificationCode")+"\n")
	if u.GetString("verificationCode") == constant.Alpha_accessCode {
		if user.Login() {
			print(feedback.Login_success+"\n")
			u.Data["json"] = map[string]string{"feedback": feedback.Login_success}
		} else {
			print(feedback.Login_fail_no_user+"1"+"\n")
			u.Data["json"] = map[string]string{"feedback": feedback.Login_fail_no_user}
		}
	} else {
		print(feedback.Login_fail_no_user+"2"+"\n")
		u.Data["json"] = map[string]string{"feedback": feedback.Login_fail_no_user}
	}
	u.ServeJSON()
}

func (u *AlphaUserController) Signup() {
	user := new(models.AlphaUser)
	user.PhoneNum = u.GetString("phoneNum")
	if u.GetString("verificationCode") == constant.Alpha_accessCode {
		if user.Login() {
			print(feedback.Login_success+"\n")
			u.Data["json"] = map[string]string{"feedback": feedback.Login_success}
		} else {
			print(feedback.Login_fail_no_user+"1"+"\n")
			u.Data["json"] = map[string]string{"feedback": feedback.Login_fail_no_user}
		}
	} else {
		print(feedback.Login_fail_no_user+"2"+"\n")
		u.Data["json"] = map[string]string{"feedback": feedback.Login_fail_no_user}
	}
	u.ServeJSON()
}
