package routers

import (
	"wkBackEnd/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
    // User router
	beego.Router("/user/login", &controllers.MainController{})
	beego.Router("/user/signup", &controllers.MainController{})
	beego.Router("/user/delete", &controllers.MainController{})
    // Organization router
	beego.Router("/organization/login", &controllers.MainController{})
	beego.Router("/organization/signup", &controllers.MainController{})
	beego.Router("/organization/delete", &controllers.MainController{})
    // Task router
	beego.Router("/task/add", &controllers.TaskController{})
	beego.Router("/task/delete", &controllers.MainController{})
	beego.Router("/task/get", &controllers.MainController{})
	beego.Router("/task/set", &controllers.MainController{})
	//beego.Router("/task/setTitle", &controllers.MainController{})
	//beego.Router("/task/setBrief", &controllers.MainController{})
}
