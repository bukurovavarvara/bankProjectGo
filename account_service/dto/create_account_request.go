package dto

type CreateAccountDtoRq struct{
	HolderName string `json: accountHolder`
	Currency string `json: currency`
}