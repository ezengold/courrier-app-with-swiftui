import Foundation

struct OrderSetupDetails {
	var startLocation: LocationItem
	var dropLocation: LocationItem
	var vehicle: Vehicle
	var goodType: String
	
	var name: String = ""
	
	var pickerCountry: CountryItem = .DEFAULT_COUNTRY
	var pickerPhoneNumber: String = ""
	
	var dropoffCountry: CountryItem = .DEFAULT_COUNTRY
	var dropoffPhoneNumber: String = ""
	
	var message: String = ""
	
	static var DEFAULT = OrderSetupDetails(
		startLocation: LocationItem(title: "Your Location", description: "1901, thornridge Cir., Shiloh"),
		dropLocation: LocationItem(title: "Ash. Dr. Sans john", description: "1901, thornridge Cir., Shiloh"),
		vehicle: .lorry,
		goodType: "catering / restaurant / Event management"
	)
}
