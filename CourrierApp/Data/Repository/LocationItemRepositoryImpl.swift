import Foundation

struct LocationItemRepositoryImpl: LocationItemRepository {
	
	var dataSource: LocationItemDataSource
	
	func searchPlaces(search: String) async throws -> [LocationItem] {
		let _places = try await dataSource.searchPlaces(search: search)
		return _places
	}
}
