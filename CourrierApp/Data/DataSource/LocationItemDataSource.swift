import Foundation

protocol LocationItemDataSource {
	
	func searchPlaces(search: String) async throws -> [LocationItem]
	
}
