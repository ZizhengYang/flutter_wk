package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

type Profile struct {
	Gender  	string
	Age     	int
	Address 	string
	Email   	string
	motto		string
	Intro 		string
}

type AlphaUser struct {
	Id 			int
	Avatar 	 	string
	Username 	string
	PhoneNum 	string
	//Profile  	Profile
}

func (this *AlphaUser) Login() bool {
	//_ = orm.RegisterDriver("mysql", orm.DRMySQL)
	//_ = orm.RegisterDataBase("default", "mysql", sql.Set_mysql_wk("wk_admin"))
	//_ = orm.RegisterDataBase("user", "mysql", sql.Set_mysql_wk("wk_user"))
	//orm.RegisterModel(new(AlphaUser))
	//_ = orm.RunSyncdb("user", false, true)
	o := orm.NewOrm()
	if o.Using("user") == nil {
		if o.Read(this) == nil {
			return true
		} else {
			return false
		}
	} else {
		return false
	}
}