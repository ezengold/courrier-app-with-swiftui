import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
	var validator: SwiftFormValidator = SwiftFormValidator()
	
	@Published var loading: Bool = false
	
	@Published var fields: LoginFieldsModel = LoginFieldsModel { _,_  in	}
	
	@Published var errors: LoginErrorsModel = LoginErrorsModel()
	
	@Published var showCountryPicker: Bool = false
	
	init() {
		self.fields = LoginFieldsModel(onChange: self.onInputChange)
		
		validator.fields.append(
			SwiftFormField(name: LoginEnum.countryCode.rawValue, rules: [
				RuleImpl.isRequired,
			])
		)
		validator.fields.append(
			SwiftFormField(name: LoginEnum.phoneNumber.rawValue, rules: [
				RuleImpl.isRequired,
				RuleImpl.isInteger,
				RuleImpl.minLength(8),
				RuleImpl.maxLength(10),
			])
		)
		validator.fields.append(
			SwiftFormField(name: LoginEnum.privacy.rawValue, rules: [
				RuleImpl.equalsTo(true)
			])
		)
		validator.fields.append(
			SwiftFormField(name: LoginEnum.terms.rawValue, rules: [
				RuleImpl.equalsTo(true)
			])
		)
	}
	
	func onInputChange(field: LoginEnum, value: Any) {
		if (value is String) {
			validator.validateFieldByName(name: field.rawValue, value: value as! String)
		} else {
			validator.validateFieldByName(name: field.rawValue, value: value)
		}
		updateErrors()
	}
	
	func onLogin() {
		loading = true
		
		// perform global validation
		validator.validateForm(values: [
			LoginEnum.countryCode.rawValue: fields.country?.countryCode ?? "",
			LoginEnum.phoneNumber.rawValue: fields.phoneNumber,
			LoginEnum.privacy.rawValue: fields.privacy,
			LoginEnum.terms.rawValue: fields.terms,
		])
		updateErrors()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			self.loading = false
		}
	}
	
	func updateErrors() {
		if let country = self.validator.fields.first(where: {$0.name == LoginEnum.countryCode.rawValue }) {
			self.errors.country = country.error
		}
		if let phoneNumber = self.validator.fields.first(where: {$0.name == LoginEnum.phoneNumber.rawValue }) {
			self.errors.phoneNumber = phoneNumber.error
		}
		if let privacy = self.validator.fields.first(where: {$0.name == LoginEnum.privacy.rawValue }) {
			self.errors.privacy = privacy.error
		}
		if let terms = self.validator.fields.first(where: {$0.name == LoginEnum.terms.rawValue }) {
			self.errors.terms = terms.error
		}
	}
}
