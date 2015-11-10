package models

import (
	"fmt"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
)

// Gorm is goroutines friendly, so you can create a global variable to keep the connection and use it everywhere like this
var DB gorm.DB
var err error

func init() {
	DB, err = gorm.Open("mysql", "root:1234@/go_demo?charset=utf8&parseTime=True&loc=Local")

	if err != nil {
		fmt.Println(err)
	} else {
		fmt.Println("connect database success")
	}

	DB.DB()
	DB.DB().Ping()
	DB.DB().SetMaxIdleConns(10)
	DB.DB().SetMaxOpenConns(100)
	DB.SingularTable(true)

	DB.AutoMigrate(&User{}, &WorkOvertime{})
}
