import Foundation

protocol CountryItemRepository {
	
	func fetchCountries () async throws -> [CountryItem]
	
}
