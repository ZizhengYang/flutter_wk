package logger

import (
	"fmt"
	"github.com/astaxie/beego/logs"
	"wkBackEnd/utils/feedback"
)

func Log_login_success_console(phone string, ip string)  {
	log := logs.NewLogger(1000)
	log.SetLevel(logs.LevelInfo)
	_ = log.SetLogger("console", fmt.Sprintf("{\"level\":%d}", logs.LevelNotice))
	log.Alert("{%s} |  User phone number: (+86)%s      | Request URL: %s", feedback.Login_success, phone, ip)
	log.Flush()
	log.Close()
}

func Log_login_success_file()  {

}

func Log_login_fail_console(phone string, ip string)  {
	log := logs.NewLogger(1000)
	log.SetLevel(logs.LevelInfo)
	_ = log.SetLogger("console", fmt.Sprintf("{\"level\":%d}", logs.LevelNotice))
	log.Warn("{%s} |  User phone number: (+86)%s       | Request URL: %s", feedback.Login_fail_no_user, phone, ip)
	log.Flush()
	log.Close()
}

func Log_login_fail_file()  {

}

func Log_signup_success_console(phone string, ip string)  {
	log := logs.NewLogger(1000)
	log.SetLevel(logs.LevelInfo)
	_ = log.SetLogger("console", fmt.Sprintf("{\"level\":%d}", logs.LevelNotice))
	log.Alert("{%s} |  User phone number: (+86)%s      | Request URL: %s", feedback.Signup_success, phone, ip)
	log.Flush()
	log.Close()
}

func Log_signup_fail_console(phone string, ip string)  {
	log := logs.NewLogger(1000)
	log.SetLevel(logs.LevelInfo)
	_ = log.SetLogger("console", fmt.Sprintf("{\"level\":%d}", logs.LevelNotice))
	log.Warn("{%s} |  User phone number: (+86)%s       | Request URL: %s", feedback.Signup_fail, phone, ip)
	log.Flush()
	log.Close()
}