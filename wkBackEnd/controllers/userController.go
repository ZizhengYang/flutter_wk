package controllers

import (
	"github.com/astaxie/beego"
	models "wkBackEnd/models"
	"wkBackEnd/utils/constant"
	"wkBackEnd/utils/logger"
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
	ip := u.Ctx.Input.IP()
	if u.GetString("verificationCode") == constant.Alpha_accessCode {
		if user.Login() {
			//print(feedback.Login_success+"\n")
			logger.Log_login_success_console(user.PhoneNum, ip)
		} else {
			//print(feedback.Login_fail_no_user+"1"+"\n")
			logger.Log_login_fail_console(user.PhoneNum, ip)
			if user.Signup() {
				logger.Log_signup_success_console(user.PhoneNum, ip)
				logger.Log_login_success_console(user.PhoneNum, ip)
			} else {
				logger.Log_signup_fail_console(user.PhoneNum, ip)
			}
		}
	} else {
		//print(feedback.Login_fail_no_user+"2"+"\n")
		logger.Log_login_fail_console(user.PhoneNum, ip)
	}
	u.ServeJSON()
}




