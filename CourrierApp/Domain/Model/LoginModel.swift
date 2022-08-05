import Foundation

enum LoginEnum: String {
	case countryCode = "countryCode"
	case phoneNumber = "phoneNumber"
	case privacy = "privacy"
	case terms = "terms"
}

struct LoginFieldsModel {
	var callback: (LoginEnum, Any) -> Void
	
	var country: CountryItem? = .DEFAULT_COUNTRY
	
	var phoneNumber: String = "" {
		didSet {
			callback(.phoneNumber, phoneNumber)
		}
	}
	
	var privacy: Bool = false {
		didSet {
			callback(.privacy, privacy)
		}
	}
	
	var terms: Bool = false {
		didSet {
			callback(.terms, terms)
		}
	}
	
	init(onChange: (@escaping (LoginEnum, Any) -> Void)) {
		self.callback = onChange
	}
	
	static var DEFAULT: LoginFieldsModel = LoginFieldsModel { _, _ in  }
}

struct LoginErrorsModel {
	var country: String = ""
	var phoneNumber: String = ""
	var privacy: String = ""
	var terms: String = ""
}
