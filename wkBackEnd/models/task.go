package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	UserModels "wkBackEnd/models/user.go"
	CompanyModels "wkBackEnd/models/company.go"
)


//-----------------------------------------Data models for Tasks
// Two tyes of Tasks
// 1. Task between User and Supervisor
// 2. Task between Company and Supervisor



// This is the task bet
type Task_UserSupervisor struct {
	Id 		int

	UserProfile *UserProfile `orm:"null;rel(one);on_delete(set_null)"`   // One User one profile, On_delete Set null
	Supervisor  *Supervisor  `orm:"null;rel(one);on_delete(set_null)"`   // ONe User one superviosr, On_delete set null
	Skill  []*Skill `orm:"rel(m2m)"`     // Many to Many with Photos
}
