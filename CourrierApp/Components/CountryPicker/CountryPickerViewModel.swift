import Foundation

class CountryPickerViewModel: ObservableObject {
	@Published var countries: [CountryItem] = []
	
	@Published var searchValue: String = ""
	
	init() {
		fetchCountries()
	}
	
	func clearSearch() {
		searchValue = ""
	}
	
	func fetchCountries() {
		if let url = Bundle.main.url(forResource: "countries", withExtension: "json") {
			do {
				let jsonData = try Data(contentsOf: url)
				let countriesList = try JSONDecoder().decode([CountryDataItem].self, from: jsonData)
				countries.append(contentsOf: countriesList.map({ item in
					return CountryItem(
						id: item.countryCode,
						name: item.countryNameEn,
						localName: item.countryNameLocal,
						countryCode: item.countryCode,
						dialCode: item.countryCallingCode,
						flag: item.flag
					)
				}))
			} catch {
				// show error
				print(error)
			}
		} else {
			// show error
			print("Json file not found")
		}
	}
}
