import Foundation

enum RegisterEnum: String {
	case fullName = "fullName"
	case email = "email"
	case phoneNumber = "phoneNumber"
	case countryCode = "countryCode"
}

struct RegisterFieldsModel {
	var callback: (RegisterEnum, String) -> Void
	
	var country: CountryItem? = .DEFAULT_COUNTRY
	
	var phoneNumber: String = "" {
		didSet {
			callback(.phoneNumber, phoneNumber)
		}
	}
	
	var fullName: String = "" {
		didSet {
			callback(.fullName, fullName)
		}
	}
	
	var email: String = "" {
		didSet {
			callback(.email, email)
		}
	}
	
	init(onChange: (@escaping (RegisterEnum, String) -> Void)) {
		self.callback = onChange
	}
}

struct RegisterErrorsModel {
	var country: String = ""
	var phoneNumber: String = ""
	var fullName: String = ""
	var email: String = ""
}
