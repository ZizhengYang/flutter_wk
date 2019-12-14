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
// 3. Qucik task







//-----------------------------------------1. Task between User and Supervisor

// This is the task between supervisor and user 
// This is a job between a supervisor and a user
// The task_CompanySupervisor can have many Task_UserSupervisor object
// So task_CompanySupervisor can be broken up into a few contractor work to do 
// But each Task_UserSupervisor is only between a supervisor and a contractor
// One user many Task_UserSupervisor
// One supervisor many Task_UserSupervisor
type Task_UserSupervisor struct {
	Id 		int

	Comment_U_to_S *Comment_U_to_S `orm:"null;rel(one);on_delete(set_null)"`   // One Task_UserSupervisor one Comment_U_to_S, On_delete Set null
	Comment_S_to_U *Comment_S_to_U `orm:"null;rel(one);on_delete(set_null)"`   // One Task_UserSupervisor one Comment_S_to_U, On_delete Set null
	Rating_U_to_S *Rating_U_to_S `orm:"null;rel(one);on_delete(set_null)"`   // One Task_UserSupervisor one Rating_U_to_S, On_delete Set null
	Rating_S_to_U *Rating_S_to_U `orm:"null;rel(one);on_delete(set_null)"`   // One Task_UserSupervisor one Rating_S_to_U, On_delete Set null
	Feedback_U_to_S *Feedback_U_to_S `orm:"null;rel(one);on_delete(set_null)"`   // Task_UserSupervisor User one Feedback_U_to_S, On_delete Set null
	Feedback_S_to_U *Feedback_S_to_U `orm:"null;rel(one);on_delete(set_null)"`   // Task_UserSupervisor User one Feedback_S_to_U, On_delete Set null

	SkillsRequiredForTask  []*Skill `orm:"rel(m2m)"`     // Many to Many with between Task_UserSupervisor and Skills

	UserDoingTask_UserSupervisor []*User `orm:"reverse(many)"`    // Reverse of Many to Many with user
	SupervisorOnsiteTask_UserSupervisor []*Supervisor `orm:"reverse(many)"`    // Reverse of Many to Many with supervisor

}

// Comment from user to supervisor
type Comment_U_to_S struct {
	Id 		int

	Task_UserSupervisor *Task_UserSupervisor `orm:"reverse(one)"`    // One to One relationship, One Supervisor can be used only one user 

}

// Comment from supervisor to user
type Comment_S_to_U struct {
	Id 		int

	Task_UserSupervisor *Task_UserSupervisor `orm:"reverse(one)"`    // One to One relationship, One Supervisor can be used only one user 

}


// Rating from user to supervisor
type Rating_U_to_S struct {
	Id 		int

	Task_UserSupervisor *Task_UserSupervisor `orm:"reverse(one)"`    // One to One relationship, One Supervisor can be used only one user 

}


// Comment from user to supervisor
type Rating_S_to_U struct {
	Id 		int
	
	Task_UserSupervisor *Task_UserSupervisor `orm:"reverse(one)"`    // One to One relationship, One Supervisor can be used only one user 

}


// Feedback from user to supervisor
type Feedback_U_to_S struct {
	Id 		int

	Task_UserSupervisor *Task_UserSupervisor `orm:"reverse(one)"`    // One to One relationship, One Supervisor can be used only one user 

}


// Comment from user to supervisor
type Feedback_S_to_U struct {
	Id 		int

	Task_UserSupervisor *Task_UserSupervisor `orm:"reverse(one)"`    // One to One relationship, One Supervisor can be used only one user 

}





//-----------------------------------------2. Task between Company and Supervisor



type Task_CompanySupervisor struct {
	Id 		int

	Comment_C_to_S *Comment_C_to_S `orm:"null;rel(one);on_delete(set_null)"`   // One Task_CompanySupervisor one Comment_C_to_S, On_delete Set null
	Rating_C_to_S *Rating_C_to_S `orm:"null;rel(one);on_delete(set_null)"`   // One Task_CompanySupervisor one Rating_C_to_S, On_delete Set null
	Feedback_C_to_S *Feedback_C_to_S `orm:"null;rel(one);on_delete(set_null)"`   // Task_CompanySupervisor User one Feedback_C_to_S, On_delete Set null

	SkillsRequiredForTask  []*Skill `orm:"rel(m2m)"`     // Many to Many with between Task_UserSupervisor and Skills
	

	SupervisorOnsiteTask_CompanySupervisor []*Supervisor `orm:"reverse(many)"`    // Reverse of Many to Many with supervisor
	CompnayOfTask_CompanySupervisor []*CompanyUser `orm:"reverse(many)"`    // Reverse of Many to Many with CompanyUser


}



// Comment from user to supervisor
type Comment_C_to_S struct {
	Id 		int

	Task_CompanySupervisor *Task_CompanySupervisor `orm:"reverse(one)"`    // One to One relationship, One Comment_C_to_S can be used only one Task_CompanySupervisor 

}


// Rating from user to supervisor
type Rating_C_to_S struct {
	Id 		int

	Task_CompanySupervisor *Task_CompanySupervisor `orm:"reverse(one)"`    // One to One relationship, One Rating_C_to_S can be used only one Task_CompanySupervisor 

}


// Feedback from user to supervisor
type Feedback_C_to_S struct {
	Id 		int

	Task_CompanySupervisor *Task_CompanySupervisor `orm:"reverse(one)"`    // One to One relationship, One Feedback_C_to_S can be used only one Task_CompanySupervisor 

}

