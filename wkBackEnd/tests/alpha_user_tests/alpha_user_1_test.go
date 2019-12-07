package test

import (
	"bytes"
	"github.com/astaxie/beego"
	"net/http"
	"net/http/httptest"
	"testing"
	_ "wkBackEnd/routers"
)

// TestGet is a sample to run an endpoint test
func TestPost(t *testing.T) {
	//var jsonStr = []byte("{'phoneNum':'18396871815','verificationCode':'666666'}")
	//r, _ := http.NewRequest("POST", "/user/alpha_user/login", bytes.NewBuffer(jsonStr))
	////r.Header.Add("Content-Type", "application/x-www-form-urlencoded")
	//r.Header.Set("X-Custom-Header", "myvalue")
	//r.Header.Set("Content-Type", "application/json")
	var jsonStr = []byte(`{"phoneNum":"18396871815","verificationCode":"666666"}`)
	req, _ := http.NewRequest("POST", "/user/alpha_user/login", bytes.NewBuffer(jsonStr))
	//req.Header.Set("X-Custom-Header", "myvalue")
	req.Header.Set("Content-Type", "application/json")
	w := httptest.NewRecorder()
	beego.BeeApp.Handlers.ServeHTTP(w, req)
	beego.Debug(w)
	print(w.Body.String())
}
