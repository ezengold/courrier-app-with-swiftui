import Foundation

class IsEqualsTo: SwiftFormRule {
	var match: Any? = nil
	
	var message : String = "Field not matching"
	
	init() {}
	
	init(match: Any) {
		self.match = match
	}
	
	init(match: Any, message: String) {
		self.match = match
		self.message = message
	}
	
	func valid(_ value: String) -> Bool {
		if self.match is String {
			return value == self.match as! String
		} else {
			return false
		}
	}
	
	func valid(_ value: Any) -> Bool {
		print(["value": value, "match": self.match ?? "nil"])
		if let safeMatch = self.match {
			return Helpers.isEqual(a: safeMatch, b: value)
		} else {
			return false
		}
	}
	
	func error() -> String {
		return message
	}
}
