import Foundation

class IsInteger: SwiftFormRegexRule {
	override init() {
		super.init()
		self.regex = "^[1-9][0-9]*$"
	}
}
