import Foundation

protocol LocationItemRepository {
	
	func searchPlaces(search: String) async throws -> [LocationItem]
	
}
