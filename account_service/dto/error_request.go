package dto

import (
	"time"
)

type ErrorDto struct{
	Message string `json:"message"`
	MessageTime time.Time `json:"time"`
}