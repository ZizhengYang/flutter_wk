package models

import (
	"github.com/astaxie/beego/orm"
	"wkBackEnd/utils/strings/sql"
)

func init()  {
	_ = orm.RegisterDriver("mysql", orm.DRMySQL)
	_ = orm.RegisterDataBase("default", "mysql", sql.Set_mysql_wk("wk_admin"))
	_ = orm.RegisterDataBase("user", "mysql", sql.Set_mysql_wk("wk_user"))
	//_ = orm.RegisterDataBase("company", "mysql", sql.Set_mysql_wk("wk_company"))
	orm.RegisterModel(new(AlphaUser))
	_ = orm.RunSyncdb("user", false, true)
}