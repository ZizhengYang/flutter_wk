package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Task struct {
	Id int
	Title string
	PriceMax int
	PriceMin int
	ExpectTimeUse time.Time
	ApplicationDue time.Time
	Language string
	Brief string
}

func (this Task) AddTask() (int64, error) {
	err_drive := orm.RegisterDriver("mysql", orm.DRMySQL)
	err_database := orm.RegisterDataBase("User", "mysql", "root:20001008@tcp(localhost:3306)/test?charset=utf8")
	if err_drive == nil {
		print(err_drive)
	}
	if err_database == nil {
		print(err_database)
	}
	o := orm.NewOrm()
	return o.Insert(&this)
}