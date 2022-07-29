import Foundation

struct RegisterFieldsModel {
	var country: CountryItem? = .DEFAULT_COUNTRY
	var phoneNumber: String = ""
	var fullName: String = ""
	var email: String = ""
}

struct RegisterErrorsModel {
	var country: String = ""
	var phoneNumber: String = ""
	var fullName: String = ""
	var email: String = ""
}
