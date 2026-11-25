package config

type ConfigurationProperty struct{
	Database *DatabaseProperty
	Service *ServiceProperty
	KafkaService *KafkaProperty
}

func CreateConfigurationProperty(database *DatabaseProperty, service *ServiceProperty, kafka *KafkaProperty) *ConfigurationProperty{
	return &ConfigurationProperty{
		Database: database,
		Service: service,
		KafkaService: kafka,
	}
}

type DatabaseProperty struct{
	DatabaseName string
	DatabaseUsername string
	DatabasePassword string
}

func CreateNewDatabaseConfiguration(databaseName, databaseUsername, databasePassword string) *DatabaseProperty{
	return &DatabaseProperty{
		DatabaseName: databaseName,
		DatabaseUsername: databaseUsername,
		DatabasePassword: databasePassword,
	}
}

type ServiceProperty struct{
	Port string
}

func CreateServiceConfiguration(port string) *ServiceProperty{
	return &ServiceProperty{
		Port: port,
	}
}

type KafkaProperty struct{
	BootstrapServer string
	Enable bool
}

func CreateKafkaProperty(bootstrapServer string, enable bool) *KafkaProperty{
	return &KafkaProperty{
		BootstrapServer: bootstrapServer,
		Enable: enable,
	}
}