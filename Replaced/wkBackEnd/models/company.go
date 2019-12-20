package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	UserModels "wkBackEnd/models/user.go"
)


type Company struct {
	Id       int
	Email    string
	Password string
	CompanyName    string
	CompanyLogo	string
	CompanyLisence string
	CompanyBankAccout string
}






//-----------------------------------------Data models for Tasks



type CompanyUser struct {
	Id       int

	// ListOfTask_CompanySupervisorPosted	*Task_CompanySupervisor	`orm:"rel(fk)"`    // One to Many relationship with Task_CompanySupervisor, One Compnay many Task_CompanySupervisor for this Company
	// ListOfQucikTaskPosted	*QucikTask	`orm:"rel(fk)"`    // One to Many relationship with QucikTask, One CompanyUser many published QucikTask

	// FavoriteSupervisors  []*Supervisor `orm:"rel(m2m)"`     // Many to Many with Supervisor
	//FavoriteUsers  []*User `orm:"rel(m2m)"`     // Many to Many with User


}

















//-------------------------------------------------  Functions related to the Company Models




// The method is actually only checking if the company is in the database
func (this *Company) Login() bool {
	o := orm.NewOrm()
	if o.Using("small_money") == nil {       // o.Using("databaseName") returns the error
		if o.Read(this) == nil {      // No error reading, meaing object exist in the database
			return true
		} else {     // Error,Not able to find the object in the databse, or object missing fk
			return false
		}
	} else {      //  No error accessing the database
		return false
	}
}




func (this *Company) Signup() bool {
	o := orm.NewOrm()
	// this.Profile = new(Profile)       // creating new profile
	if o.Using("small_money") == nil {     // o.Using("databaseName") returns the error
		// _, err1 := o.Insert(this.Profile)
		_, err2 := o.Insert(this)     
		if err2 == nil{     // No error inserting into the the database table
			return true
		} else {      //some error inserting into the database table
			return false 
		}
		// if err1 == nil && err2 == nil {
		// 	return true
		// } else {
		// 	return false
		// }
	} else {       // error accessing the databser
		return false
	}
}