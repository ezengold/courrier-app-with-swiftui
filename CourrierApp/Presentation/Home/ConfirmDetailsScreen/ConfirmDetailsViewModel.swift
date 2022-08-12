import Foundation

class ConfirmDetailsViewModel: ObservableObject {
	@Published var details: OrderSetupDetails
	
	init(details: OrderSetupDetails) {
		self.details = details
	}
}
