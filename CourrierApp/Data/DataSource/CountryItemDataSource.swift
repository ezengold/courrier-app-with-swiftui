import Foundation

protocol CountryItemDataSource {
	
	func getCountries() async throws -> [CountryItem]
	
}
