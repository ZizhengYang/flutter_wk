package sql

func Set_mysql(user string, password string, port string, database string, charset string) string  {
	return user+":"+password+"@tcp"+"(localhost:"+port+")"+"/"+database+"?"+"charset="+charset
}