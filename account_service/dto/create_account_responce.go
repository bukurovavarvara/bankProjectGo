package dto

type CreateAccountDtoRs struct{
	Id string `json: id`
	HolderName string `json: accountHolder`
	Balance float32 `json: balance`
	Currency string `json: currency`
}