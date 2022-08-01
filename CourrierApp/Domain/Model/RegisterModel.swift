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

struct RegisterFile {
	var url: String
	var size: Float
	var name: String = ""
}

enum RegisterEnum: String {
case fullName = "fullName"
case email = "email"
case phoneNumber = "phoneNumber"
case countryCode = "countryCode"
}
