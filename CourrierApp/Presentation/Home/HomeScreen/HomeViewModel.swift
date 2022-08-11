import Foundation

class HomeViewModel: ObservableObject {
	@Published var currentLocation: LocationItem = LocationItem(title: "Your Location", description: "3891, Ranchview, LA, NY")
	
	@Published var dropLocation: LocationItem?
	
	// sheet controls
	@Published var showPointPicker: Bool = false
	
	@Published var showVehiclePicker: Bool = false
	// end sheet controls
	
	// handle search places
	@Published var searchValue: String = ""
	
	var searchUseCase = SearchPlacesUseCase(repo: LocationItemRepositoryImpl(dataSource: LocationItemAPIImpl()))
	
	@Published var predictions: [LocationItem] = []
	// end handle search
	
	
	func handleSearch() async {
		let result = await searchUseCase.execute(self.searchValue)
		
		switch result {
			
		case .success(let response):
			self.predictions = response
			
		case .failure(_):
			self.predictions = []
		}
	}
	
	func pickLocation(_ location: LocationItem) {
		dropLocation = location
		searchValue = location.title
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			self.predictions = []
		}
	}
	
	func performVehiclePicking() {
		showPointPicker = false
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			self.showVehiclePicker = true
		}
	}
	
	func resetAll() {
		showPointPicker = false
		showVehiclePicker = false
		dropLocation = nil
		searchValue = ""
		predictions = []
	}
}
