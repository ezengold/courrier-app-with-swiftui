import Foundation

class HomeViewModel: ObservableObject {
	@Published var currentLocation: LocationItem = LocationItem(title: "Your Location", description: "3891, Ranchview, LA, NY")
}
