import Foundation

struct CountryItem: Identifiable {
	let id: String
	let name: String
	let localName: String
	let countryCode: String
	let dialCode: String
	let flag: String?
	
	static let DEFAULT_COUNTRY: CountryItem = CountryItem(id: "91", name: "India", localName: "भारत, India", countryCode: "IN", dialCode: "91", flag: "🇮🇳")
}
