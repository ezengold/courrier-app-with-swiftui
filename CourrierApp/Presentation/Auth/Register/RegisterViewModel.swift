import Foundation
import Combine

class RegisterViewModel: ObservableObject {
	var validator: SwiftFormValidator = SwiftFormValidator()
	
	@Published var loading: Bool = false
	
	@Published var fields: RegisterFieldsModel = RegisterFieldsModel { _,_  in	}
	
	@Published var errors: RegisterErrorsModel = RegisterErrorsModel()
	
	@Published var showCountryPicker: Bool = false
	
	@Published var isRemember: Bool = true
		
	init() {
		self.fields = RegisterFieldsModel(onChange: self.onInputChange)
		
		validator.fields.append(
			SwiftFormField(name: RegisterEnum.email.rawValue, rules: [
				RuleImpl.isRequired,
				RuleImpl.isEmail,
			])
		)
		validator.fields.append(
			SwiftFormField(name: RegisterEnum.fullName.rawValue, rules: [
				RuleImpl.isRequired,
				RuleImpl.isName,
				RuleImpl.maxLength(100),
			])
		)
		validator.fields.append(
			SwiftFormField(name: RegisterEnum.countryCode.rawValue, rules: [
				RuleImpl.isRequired,
			])
		)
		validator.fields.append(
			SwiftFormField(name: RegisterEnum.phoneNumber.rawValue, rules: [
				RuleImpl.isRequired,
				RuleImpl.isInteger,
				RuleImpl.minLength(8),
				RuleImpl.maxLength(10),
			])
		)
	}
	
	func onInputChange(field: RegisterEnum, value: String) {
		validator.validateFieldByName(name: field.rawValue, value: value)
		updateErrors()
	}
	
	func onRegister() {
		loading = true
		
		// perform global validation
		validator.validateForm(values: [
			RegisterEnum.email.rawValue: fields.email,
			RegisterEnum.fullName.rawValue: fields.fullName,
			RegisterEnum.countryCode.rawValue: fields.country?.countryCode ?? "",
			RegisterEnum.phoneNumber.rawValue: fields.phoneNumber,
		])
		updateErrors()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			self.loading = false
		}
	}
	
	func updateErrors() {
		if let fullName = self.validator.fields.first(where: {$0.name == RegisterEnum.fullName.rawValue }) {
			self.errors.fullName = fullName.error
		}
		if let email = self.validator.fields.first(where: {$0.name == RegisterEnum.email.rawValue }) {
			self.errors.email = email.error
		}
		if let country = self.validator.fields.first(where: {$0.name == RegisterEnum.countryCode.rawValue }) {
			self.errors.country = country.error
		}
		if let phoneNumber = self.validator.fields.first(where: {$0.name == RegisterEnum.phoneNumber.rawValue }) {
			self.errors.phoneNumber = phoneNumber.error
		}
	}
}
