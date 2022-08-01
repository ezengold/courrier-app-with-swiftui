import Foundation

class IsName: SwiftFormRegexRule {
	override init() {
		super.init()
		self.regex = "[^0-9]+$"
	}
}
