package sql

func Set_mysql_wk(database string) string  {
	return Set_mysql("root", "20001008", "3306", database, "utf8")
}