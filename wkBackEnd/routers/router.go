// @APIVersion 1.0.0
// @Title beego Test API
// @Description beego has a very cool tools to autogenerate documents for your API
// @Contact astaxie@gmail.com
// @TermsOfServiceUrl http://beego.me/
// @License Apache 2.0
// @LicenseUrl http://www.apache.org/licenses/LICENSE-2.0.html
package routers

import (
	"wkBackEnd/controllers"

	"github.com/astaxie/beego"
)


// For more layers of routing layers, add extra layer of beego.NSNamespace()
// beego.NSNamespace() is like sub folders
// router is like the actual file
func init() {
	user := beego.NewNamespace("/user",
		beego.NSNamespace("/alpha_user",
			beego.NSRouter("/login",&controllers.AlphaUserController{},"post:Login"),
			//beego.NSRouter("/signup",&controllers.AlphaUserController{},"post:Signup"),
		),
	)
	company := beego.NewNamespace("/company",
		beego.NSNamespace("/company",
			beego.NSRouter("/login",&controllers.AlphaUserController{},"post:Login"),
			beego.NSRouter("/signup",&controllers.AlphaUserController{},"post:Signup"),
		),
	)
	beego.AddNamespace(user)
	beego.AddNamespace(company)
}
