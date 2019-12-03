package models

import (
	"github.com/astaxie/beego/orm"
)

func init() {
	orm.RegisterModel(new(Task))
	orm.RegisterModel(new(User))
}
