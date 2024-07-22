import Foundation

enum OrderSetupEnum: String {
	case name = "name"
	case pickerPhoneNumber = "pickerPhoneNumber"
	case dropoffPhoneNumber = "dropoffPhoneNumber"
	case message = "message"
}

struct OrderSetupDetails {
	var startLocation: LocationItem
	var dropLocation: LocationItem
	var vehicle: Vehicle
	var goodType: String
	
	var callback: (OrderSetupEnum, String) -> Void = {_,_ in }
	
	var name: String = "" {
		didSet {
			callback(.name, name)
		}
	}
	
	var pickerCountry: CountryItem? = .DEFAULT_COUNTRY
	var pickerPhoneNumber: String = "" {
		didSet {
			callback(.pickerPhoneNumber, pickerPhoneNumber)
		}
	}
	
	var dropoffCountry: CountryItem? = .DEFAULT_COUNTRY
	var dropoffPhoneNumber: String = "" {
		didSet {
			callback(.dropoffPhoneNumber, dropoffPhoneNumber)
		}
	}
	
	var message: String = "" {
		didSet {
			callback(.message, message)
		}
	}
	
	static var DEFAULT = OrderSetupDetails(
		startLocation: LocationItem(title: "Your Location", description: "1901, thornridge Cir., Shiloh"),
		dropLocation: LocationItem(title: "Ash. Dr. Sans john", description: "1901, thornridge Cir., Shiloh"),
		vehicle: .lorry,
		goodType: "catering / restaurant / Event management"
	)
}

struct OrderSetupErrors {
	var name: String = ""
	var pickerPhoneNumber: String = ""
	var dropoffPhoneNumber: String = ""
	var message: String = ""
}
