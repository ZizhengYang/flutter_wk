package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

type Profile struct {
	Id			int
	Gender  	string
	Age     	string
	Address 	string
	Email   	string
	motto		string
	Intro 		string
	AlphaUser	*AlphaUser	`orm:"reverse(one)"`
}

//type CreditCard struct {
//	Id 			int
//	CardName	string
//	CardNum		string
//	expDate		string
//	SecurityNum	string
//	AlphaUser	[]*AlphaUser	`orm:"reverse(many)"`
//}
//
//type CompanyExperience struct {
//	Id 			int
//	Company		string
//	Position	string
//	StartYear	string
//	EndYear		string
//	StartMonth	string
//	EndMonth	string
//	Resume		*Resume					`orm:"reverse(one)"`
//}
//
//type Education struct {
//	Id 			int
//	College		string
//	Degree		string
//	Major		string
//	Minor1		string
//	Minor2		string
//	StartYear	string
//	EndYear		string
//	StartMonth	string
//	EndMonth	string
//	Resume		*Resume		`orm:"reverse(one)"`
//}
//
//type Resume struct {
//	Id 			int
//	AlphaUser	*AlphaUser			`orm:"reverse(one)"`
//	Experience	*CompanyExperience	`orm:"rel(one)"`
//	Education	*Education			`orm:"rel(one)"`
//}

type AlphaUser struct {
	Id 			int
	Avatar 	 	string
	Username 	string
	PhoneNum 	string
	Profile  	*Profile	`orm:"rel(one)"`
	//CreditCard	*CreditCard	`orm:"rel(fk)"`
	//Resume		*Resume		`orm:"rel(one)"`
}

func (this *AlphaUser) Login() bool {
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

func (this *AlphaUser) Signup() bool {
	o := orm.NewOrm()
	this.Profile = new(Profile)
	if o.Using("user") == nil {
		_, err1 := o.Insert(this.Profile)
		_, err2 := o.Insert(this)
		if err1 == nil || err2 == nil {
			return true
		} else {
			return false
		}
	} else {
		return false
	}
}