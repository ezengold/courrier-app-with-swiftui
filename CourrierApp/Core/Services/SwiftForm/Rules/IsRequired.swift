import Foundation

class IsRequired: SwiftFormRule {
	var message : String = "Required field"
	
	init() {}
	
	init(message: String) {
		self.message = message
	}
	
	func valid(_ value: String) -> Bool {
		return !value.isEmpty
	}
	
	func error() -> String {
		return message
	}
}
