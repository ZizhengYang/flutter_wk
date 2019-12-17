package models

import (
	"fmt"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	ArticleModels "wkBackEnd/models/article.go"
)


//-----------------------------------------Data models for Users

// Testing User AlphaUser
type AlphaUser struct {
	Id 			int
	Avatar 	 	string
	Username 	string
	PhoneNum 	string
	Profile  	*Profile	`orm:"rel(one)"`
	//CreditCard	*CreditCard	`orm:"rel(fk)"`
	//Resume		*Resume		`orm:"rel(one)"`
}

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























// User has two relationship with skills????? how to deal
type User struct {
	Id 		int

	UserProfile *UserProfile `orm:"null;rel(one);on_delete(set_null)"`   // One User one profile, On_delete Set null
	Supervisor  *Supervisor  `orm:"null;rel(one);on_delete(set_null)"`   // ONe User one superviosr, On_delete set null

	ArticlePosted	*Article	`orm:"rel(fk)"`    // One to Many relationship with Articles, One user many published articles
	ListOfTask_UserSupervisorAsUser	*Task_UserSupervisor	`orm:"rel(fk)"`    // One to Many relationship with Task_UserSupervisor, One user many Task_UserSupervisor done by the user


	FavoriteSkills  []*Skill `orm:"rel(m2m)"`     // Many to Many with skills
	Skill  []*Skill `orm:"rel(m2m)"`     // Many to Many with skills
	FavoriteArticles  []*Article `orm:"rel(m2m)"`     // Many to Many with Articles
	CreditCard  []*CreditCard `orm:"rel(m2m)"`     // Many to Many with Credit Cards
	ListOfQucikTask  []*QucikTask `orm:"rel(m2m)"`     // Many to Many with QucikTask


	FavoritedBySuperviosr []*Supervisor `orm:"reverse(many)"`    // Reverse of Many to Many with Supervisors, users liked by the supervisors
	FavoritedByCompany []*CompanyUser `orm:"reverse(many)"`    // Reverse of Many to Many with CompanyUser, users liked by the CompanyUser

}


type Skill struct {
	Id			int

	FavoriteOfUsers []*User `orm:"reverse(many)"`    // Reverse of Many to Many with FavoriteSkills
	User []*User `orm:"reverse(many)"`    // Reverse of Many to Many with Users
	Task_UserSupervisor []*Task_UserSupervisor `orm:"reverse(many)"`    // Reverse of Many to Many with Task_UserSupervisor
	Task_CompanySupervisor []*Task_CompanySupervisor `orm:"reverse(many)"`    // Reverse of Many to Many with Task_CompanySupervisor, skills required to do Task_CompanySupervisor


}


type CreditCard struct {
	Id 			int
	CardName	string
	CardNum		string
	expDate		string
	SecurityNum	string
	
	User	[]*User	`orm:"reverse(many)"`         // Many to Many with the users  
}


type Supervisor struct {
	Id			int

	FavoriteUsers  []*User `orm:"rel(m2m)"`     // Many to Many with Users
	ListOfTask_UserSupervisorAsSupervisor	*Task_UserSupervisor	`orm:"rel(fk)"`    // One to Many relationship with Task_UserSupervisor, One supervisor many Task_UserSupervisor for this onsite supervisor
	ListOfTask_CompanySupervisorAsSupervisor	*Task_CompanySupervisor	`orm:"rel(fk)"`    // One to Many relationship with Task_CompanySupervisor, One supervisor many Task_CompanySupervisor for this onsite supervisor


	User *User `orm:"reverse(one)"`    // One to One relationship, One Supervisor can be used only one user 
	User *Task_UserSupervisor `orm:"reverse(one)"`    // One to One relationship, One Supervisor can be used only one user 
	FavoritedByCompany []*CompanyUser `orm:"reverse(many)"`    // Reverse of Many to Many with CompanyUser, supervisors liked by the CompanyUser

}


type UserProfile struct {
	Id			int

	DesignWall *DesignWall  `orm:"null;rel(one);on_delete(set_null)"`   // One UserProfile one DesignWall,on_delete Set null
	Education	*Education	`orm:"rel(fk)"`    // One to Many relationship with Education, One UserProfile many educations
	Experience	*Experience	`orm:"rel(fk)"`    // One to Many relationship with Experience, One UserProfile many Experiences
	
	User *User `orm:"reverse(one)"`    // One to One relationship, One UserProfile can be used only one user 
}

type DesignWall struct {
	Id			int

	Photo  []*Photo `orm:"rel(m2m)"`     // Many to Many with Photo

	UserProfile *UserProfile `orm:"reverse(one)"`    // One to One relationship, One DesignWall can be used only one UserProfile 
}

type Photos struct {
	Id			int

	DesignWall []*DesignWall `orm:"reverse(many)"`    // Reverse of Many to Many with DesignWall
}


type Education struct {
	Id			int

	UserProfile []*UserProfile `orm:"reverse(many)"`    // Many to One relationship with UserProfile
}

type Experience struct {
	Id			int

	UserProfile []*UserProfile `orm:"reverse(many)"`    // Many to One relationship with UserProfile
}






// favaorite Task
// Feedbacks(should be inside of a task)
// ListofTasksDone













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



























//-------------------------------------------------  Functions related to the User Models

// false, false  ------> error accessing the database
// false, true  ------> can access database but no such user
// false, false  ------> can access database and user existed in the database
func (this *AlphaUser) Login() (bool, bool) {
	o := orm.NewOrm()
	if o.Using("small_money") == nil {       // o.Using("databaseName") returns the error
		if o.Read(this) == nil {      // no error 
			return true, true
		} else {                    
			return false, true
		}
	} else {         // Error
		return false, false
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