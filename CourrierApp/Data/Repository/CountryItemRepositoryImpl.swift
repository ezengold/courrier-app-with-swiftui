import Foundation

struct CountryItemRepositoryImpl: CountryItemRepository {
	
	var dataSource: CountryItemDataSource
	
	func fetchCountries() async throws -> [CountryItem] {
		let _countries =  try await dataSource.getCountries()
		return _countries
	}
}
