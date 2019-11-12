package test

import (
	"github.com/astaxie/beego"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestAddTask(t *testing.T) {
	r, _ := http.NewRequest("POST", "/", nil)
	w := httptest.NewRecorder()
	beego.BeeApp.Handlers.ServeHTTP(w, r)

	beego.Trace("testing", "TestBeego", "Code[%d]\n%s", w.Code, w.Body.String())
}
