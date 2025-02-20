import Foundation

class SwiftFormValidator {
	var fields: [SwiftFormField] = []
	
	var isFormValid: Bool = false
	
	func validateFieldByName(name fieldName: String, value fieldValue: String) {
		// find the field
		if let fieldIndex = self.fields.firstIndex(where: {$0.name == fieldName}) {
			var field = self.fields[fieldIndex]
			
			// reset to true
			field.valid = true

			for rule in field.rules {
				let isValid: Bool = rule.valid(fieldValue)
				
				field.valid = field.valid && isValid
				field.error = isValid ? "" : rule.error()
				
				if !isValid {
					// stop validations on first error
					break
				}
			}
			
			self.fields[fieldIndex] = field
		}
	}
	
	func validateFieldByName(name fieldName: String, value fieldValue: Any) {
		// find the field
		if let fieldIndex = self.fields.firstIndex(where: {$0.name == fieldName}) {
			var field = self.fields[fieldIndex]
			
			// reset to true
			field.valid = true

			for rule in field.rules {
				let isValid: Bool = rule.valid(fieldValue)
				
				field.valid = field.valid && isValid
				field.error = isValid ? "" : rule.error()
				
				if !isValid {
					// stop validations on first error
					break
				}
			}
			
			self.fields[fieldIndex] = field
		}
	}
	
	func validateForm(values: [String: Any]) {
		var isAllValid: Bool = true
		
		for field in self.fields {
			let fieldIndex = self.fields.firstIndex(where: {$0.name == field.name})!
						
			var updatedField = field
			
			// reset to true
			updatedField.valid = true
			
			for rule in field.rules {
				var isValid: Bool = false
				
				if values[field.name] is String {
					isValid = rule.valid(values[field.name] as! String)
				} else {
					isValid = rule.valid(values[field.name]!)
				}
				
				updatedField.valid = updatedField.valid && isValid
				updatedField.error = isValid ? "" : rule.error()
				
				if !isValid {
					// stop validations on first error
					break
				}
			}
			
			isAllValid = isAllValid && updatedField.valid
			self.fields[fieldIndex] = updatedField
		}
		
		self.isFormValid = isAllValid
	}
}
