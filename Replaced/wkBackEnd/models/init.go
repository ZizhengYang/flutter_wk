package models

import (
	"github.com/astaxie/beego/orm"
	"wkBackEnd/utils/strings/sql"
)

func init()  {
	_ = orm.RegisterDriver("mysql", orm.DRMySQL)
	_ = orm.RegisterDataBase("default", "mysql", sql.Set_mysql_wk("wk_admin"))
	_ = orm.RegisterDataBase("small_money", "mysql", sql.Set_mysql_wk("wk_user"))
	//_ = orm.RegisterDataBase("company", "mysql", sql.Set_mysql_wk("wk_company"))
	orm.RegisterModel(new(Profile), new(AlphaUser))
	//orm.RegisterModel(new(Profile), new(CreditCard), new(Education), new(CompanyExperience), new(Resume), new(AlphaUser))
	_ = orm.RunSyncdb("small_money", true, true)
}