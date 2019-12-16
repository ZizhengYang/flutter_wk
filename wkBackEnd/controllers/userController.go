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
// post method
// www.zhuanxiaoqian.com/user/alpha_user/login
// Input :  phoneNum , verificationCode , IP
func (u *AlphaUserController) Login() {
	// Obtaining all the varible from the request 
	phoneNumber = u.GetString("phoneNum")
	veriCode = u.GetString("verificationCode")
	ip := u.Ctx.Input.IP()

	user := new(models.AlphaUser)    // creating new AlphaUser
	user.PhoneNum = phoneNumber     // assigning the new AlphaUser with the given phoneNum

	if veriCode == constant.Alpha_accessCode {    // correct access code
		if user.Login() == true,true{    // the user in the database
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
	} else {    // different user verification code
		//print(feedback.Login_fail_no_user+"2"+"\n")
		logger.Log_login_fail_console(user.PhoneNum, ip)
	}
	u.ServeJSON()
}




