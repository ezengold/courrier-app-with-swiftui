import Foundation
import MapKit

struct LocationItem: Identifiable {
	var id: String = UUID().uuidString
	
	var title: String
	var description: String
	var coords = DEFAULT_COORDS
	var distance: String = ""
	
	static let DEFAULT_SPAN = MKCoordinateSpan(latitudeDelta: 1.208788759319396, longitudeDelta: 0.6159467588864231)
	static let DEFAULT_COORDS = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.656797352694418, longitude: 2.4710453333535116), span: DEFAULT_SPAN)
}
