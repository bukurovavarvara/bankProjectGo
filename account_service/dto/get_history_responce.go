package dto

import (
	"time"
)

type GetHistoryDtoRs struct{
	TransactionId string `json:"transactionId"`
	FromAccountId string `json:"fromAccount"`
	ToAccountId string `json:"toAccount"`
	Amount float32 `json:"amount"`
	TimeTransaction time.Time `json:"timestamp"`
	StatusTransaction string `json:"status"`
}