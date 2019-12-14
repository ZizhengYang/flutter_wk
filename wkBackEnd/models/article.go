package models

type Article struct {
	Id int
	PostingTime	string
	Title string
	Subtitle string
	Abstract string

	Author []*User `orm:"reverse(many)"`    // Reverse of one to Many with Users
	UserWhofavorite []*User `orm:"reverse(many)"`    // Reverse of Many to Many with Users

}
