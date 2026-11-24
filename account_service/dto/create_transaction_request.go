package dto

type CreateTransactionDtoRq struct{
	FromAccountId string `json: fromAccount`
	ToAccountId string `json: toAccount`
	Amount float32 `json: amount`
}