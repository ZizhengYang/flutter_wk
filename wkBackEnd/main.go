package main

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	"wkBackEnd/models"
	_ "wkBackEnd/routers"
)

func main() {
	beego.Run()
	o := orm.NewOrm()
	//o.Using("default")
	test_task := models.Task{}
	fmt.Println(o.Insert(test_task))
}
