package models

type WorkOvertime struct {
	Id        int    `json:"id"`
	UserId    string `json:"userId"`
	UserName  string `json:"userName"`
	Remark    int    `json:"remark"`
	Status    int    `json:"status"`
	CreatedAt int    `json:"createdAt"`
}
