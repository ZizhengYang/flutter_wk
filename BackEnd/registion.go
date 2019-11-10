package main

import (
	"log"
	"net/http"
)

func registor() {
	http.HandleFunc("/User/signUpUser", signUpUser)
	http.HandleFunc("/User/deleteUser", deleteUser)
	http.HandleFunc("/User/logInUser", logInUser)
	http.HandleFunc("/Organization/signUpOrganization", signUpOrganization)
	http.HandleFunc("/Organization/deleteOrganization", deleteUser)
	http.HandleFunc("/Organization/logInOrganization", logInUser)
	err := http.ListenAndServe(port, nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
