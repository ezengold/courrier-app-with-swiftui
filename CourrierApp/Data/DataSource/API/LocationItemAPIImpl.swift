import Foundation

struct LocationItemAPIImpl: LocationItemDataSource {
	static var ALL_DATA: [LocationItem] = [
		LocationItem(
			title: "Rd. Allentown",
			description: "1901, thornridge Cir., Shiloh",
			coords: LocationItem.DEFAULT_COORDS,
			distance: "2.3 KM"
		),
		LocationItem(
			title: "Dr. Richardson",
			description: "1901, thornridge Cir., Shiloh",
			coords: LocationItem.DEFAULT_COORDS,
			distance: "2.3 KM"
		),
		LocationItem(
			title: "St. Cellina",
			description: "1901, thornridge Cir., Shiloh",
			coords: LocationItem.DEFAULT_COORDS,
			distance: "2.3 KM"
		),
		LocationItem(
			title: "Ash. Dr. Sans john",
			description: "1901, thornridge Cir., Shiloh",
			coords: LocationItem.DEFAULT_COORDS,
			distance: "2.3 KM"
		),
		LocationItem(
			title: "Rd. Allentown",
			description: "1901, thornridge Cir., Shiloh",
			coords: LocationItem.DEFAULT_COORDS,
			distance: "2.3 KM"
		),
		LocationItem(
			title: "Rd. Allentown",
			description: "1901, thornridge Cir., Shiloh",
			coords: LocationItem.DEFAULT_COORDS,
			distance: "2.3 KM"
		),
		LocationItem(
			title: "Rd. Allentown",
			description: "1901, thornridge Cir., Shiloh",
			coords: LocationItem.DEFAULT_COORDS,
			distance: "2.3 KM"
		),
		LocationItem(
			title: "Rd. Allentown",
			description: "1901, thornridge Cir., Shiloh",
			coords: LocationItem.DEFAULT_COORDS,
			distance: "2.3 KM"
		),
	]
	
	func searchPlaces(search: String) async throws -> [LocationItem] {
		return LocationItemAPIImpl.ALL_DATA.filter({ $0.title.uppercased().contains(search.uppercased()) || $0.description.uppercased().contains(search.uppercased()) })
	}
	
}
