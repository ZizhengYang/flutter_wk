package logger

import (
	"fmt"
	"github.com/astaxie/beego/logs"
	"wkBackEnd/utils/feedback"
)

func Log_Success_Console(phone string, ip string)  {
	log := logs.NewLogger(1000)
	log.SetLevel(logs.LevelInfo)
	_ = log.SetLogger("console", fmt.Sprintf("{\"level\":%d}", logs.LevelNotice))
	log.Alert("{%s} |  User phone number: (+86)%s      | Request URL: %s", feedback.Login_success, phone, ip)
	log.Flush()
	log.Close()
}

func Log_Success_File()  {

}

func Log_Fail_Console(phone string, ip string)  {
	log := logs.NewLogger(1000)
	log.SetLevel(logs.LevelInfo)
	_ = log.SetLogger("console", fmt.Sprintf("{\"level\":%d}", logs.LevelNotice))
	log.Warn("{%s} |  User phone number: (+86)%s       | Request URL: %s", feedback.Login_fail_no_user, phone, ip)
	log.Flush()
	log.Close()
}

func Log_Fail_File()  {

}