import Foundation


struct CountryItemAPIImpl: CountryItemDataSource {
	
	func getCountries() async throws -> [CountryItem] {
		guard let url = Bundle.main.url(forResource: "countries", withExtension: "json") else {
			throw APIServiceError.BAD_URL
		}
		
		guard let jsonData = try? Data(contentsOf: url) else {
			throw APIServiceError.REQUEST_ERROR
		}
		
		guard let countriesList = try? JSONDecoder().decode([CountryItemAPIEntity].self, from: jsonData) else {
			throw APIServiceError.DECODING_ERROR
		}
		
		return countriesList.map({ item in
			CountryItem (
				id: item.countryCode,
				name: item.countryNameEn,
				localName: item.countryNameLocal,
				countryCode: item.countryCode,
				dialCode: item.countryCallingCode,
				flag: item.flag
			)
		})
	}
}
