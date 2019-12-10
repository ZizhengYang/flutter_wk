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
	if o.Using("small_money") == nil {       // o.Using("databaseName") returns the error
		if o.Read(this) == nil {
			return true
		} else {
			return false
		}
	} else {
		return false
	}
}


    // 三个返回参数依次为：是否新创建的，对象 Id 值，错误
	// if created, id, err := o.ReadOrCreate(&user, "Name"); err == nil {
	// 	if created {
	// 		fmt.Println("New Insert an object. Id:", id)
	// 	} else {
	// 		fmt.Println("Get an object. Id:", id)
	// 	}
	// }





// The method is actually only checking if the company is in the database
func (this *AlphaUser) Signup() bool {
	o := orm.NewOrm()
	this.Profile = new(Profile)
	if o.Using("small_money") == nil {     // o.Using("databaseName") returns the error
		_, err1 := o.Insert(this.Profile)
		_, err2 := o.Insert(this)
		if err1 == nil && err2 == nil {
			return true
		} else {
			return false
		}
	} else {
		return false
	}
}






func (this *AlphaUser) LoginOrSignUp() int {
	o := orm.NewOrm()
	this.Profile = new(Profile)
	if o.Using("small_money") == nil {
		_, err1 := o.Insert(this.Profile)     // insert the profile object into profile table 
		_, err2 := o.Insert(this)             // insert the user object into user table

		if err1 == nil && err2 == nil {           // there's no error inserting both object into the tables

		if created, id, err := o.ReadOrCreate(this); err == nil {      // no error reading or creating user object
			if created {
				fmt.Println("New Insert an object. Id:", id)
			} else {
				fmt.Println("Get an object. Id:", id)
			}
		} else {
			return 4        // 4 means error whene reading or creating user object
		}

		} else {
			return 3       // 3 means there's error inserting the two objects into the tables 
		}

	} else {
		return 2          // 2 means there's something wrong with accessing the database
	}

}