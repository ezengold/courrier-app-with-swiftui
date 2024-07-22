import Foundation

class ConfirmDetailsViewModel: ObservableObject {
	var validator: SwiftFormValidator = SwiftFormValidator()
	
	@Published var details: OrderSetupDetails
	
	@Published var errors: OrderSetupErrors = OrderSetupErrors()
	
	// controls
	@Published var showBillingScreen: Bool = false
	
	@Published var showPickupCountryPicker: Bool = false
	
	@Published var showDropoffCountryPicker: Bool = false
	
	init(details: OrderSetupDetails) {
		self.details = details
		self.details.callback = self.onInputChange
		
		validator.fields.append(
			SwiftFormField(name: OrderSetupEnum.name.rawValue, rules: [
				RuleImpl.isRequired,
				RuleImpl.isName
			])
		)
		validator.fields.append(
			SwiftFormField(name: OrderSetupEnum.pickerPhoneNumber.rawValue, rules: [])
		)
		validator.fields.append(
			SwiftFormField(name: OrderSetupEnum.dropoffPhoneNumber.rawValue, rules: [])
		)
		validator.fields.append(
			SwiftFormField(name: OrderSetupEnum.message.rawValue, rules: [
				RuleImpl.maxLength(270)
			])
		)
	}
	
	func onInputChange(field: OrderSetupEnum, value: String) {
		validator.validateFieldByName(name: field.rawValue, value: value)
		updateErrors()
	}
	
	func onTapNext() {
		// perform global validation
		validator.validateForm(values: [
			OrderSetupEnum.name.rawValue: details.name,
			OrderSetupEnum.pickerPhoneNumber.rawValue: details.pickerPhoneNumber,
			OrderSetupEnum.dropoffPhoneNumber.rawValue: details.dropoffPhoneNumber,
			OrderSetupEnum.message.rawValue: details.message,
		])
		updateErrors()
		
		if validator.isFormValid {
			self.showBillingScreen = true
		}
	}
	
	func handlePay() {
		//
	}
	
	func updateErrors() {
		if let name = self.validator.fields.first(where: {$0.name == OrderSetupEnum.name.rawValue }) {
			self.errors.name = name.error
		}
		if let pickupPhoneNumber = self.validator.fields.first(where: {$0.name == OrderSetupEnum.pickerPhoneNumber.rawValue }) {
			self.errors.pickerPhoneNumber = pickupPhoneNumber.error
		}
		if let dropoffPhoneNumber = self.validator.fields.first(where: {$0.name == OrderSetupEnum.dropoffPhoneNumber.rawValue }) {
			self.errors.dropoffPhoneNumber = dropoffPhoneNumber.error
		}
		if let message = self.validator.fields.first(where: {$0.name == OrderSetupEnum.message.rawValue }) {
			self.errors.message = message.error
		}
	}
}
