import Foundation

class RegisterViewModel: ObservableObject {
	@Published var loading: Bool = false
	
	@Published var fields: RegisterFieldsModel = RegisterFieldsModel()
	@Published var errors: RegisterErrorsModel = RegisterErrorsModel()
	
	@Published var showCountryPicker: Bool = false
	
	@Published var isRemember: Bool = true
	
	func onRegister() {
		loading = true
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			self.loading = false
		}
	}
}
