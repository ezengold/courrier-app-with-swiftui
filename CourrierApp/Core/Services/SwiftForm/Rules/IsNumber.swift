import Foundation

class IsNumber: SwiftFormRegexRule {
	override init() {
		super.init()
		self.regex = "^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$"
	}
}
