import Foundation

struct CountryItemAPIEntity: Codable {
	let countryNameEn: String
	let countryNameLocal: String
	let countryCode: String
	let countryCallingCode: String
	let flag: String?
}
