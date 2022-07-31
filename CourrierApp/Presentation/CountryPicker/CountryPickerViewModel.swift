import Foundation

@MainActor
class CountryPickerViewModel: ObservableObject {
	var getCountriesUseCase = GetCountriesUseCase(repo: CountryItemRepositoryImpl(dataSource: CountryItemAPIImpl()))
	
	@Published var countries: [CountryItem] = []
	
	@Published var searchValue: String = ""
			
	func fetchCountries() async {
		let result = await getCountriesUseCase.execute()
		
		switch result {
			
		case .success(let response):
			self.countries = response
			
		case .failure(_):
			self.countries = []
			
		}
	}
}
