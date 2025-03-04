import Foundation

class MinValue: SwiftFormCompairRule {
	init(limit: Int) {
		super.init()
		self.limit = Double(limit)
		self.message = String(format: "Should be greater or equal to %ld", limit)
	}
	
	init(limit: Float) {
		super.init()
		self.limit = Double(limit)
		self.message = String(format: "Should be greater or equal to %f", limit)
	}
	
	init(limit: Double) {
		super.init()
		self.limit = limit
		self.message = String(format: "Should be greater or equal to %f", limit)
	}
	
	init(limit: Int, message: String) {
		super.init()
		self.limit = Double(limit)
		self.message = String(format: message, limit)
	}
	
	init(limit: Float, message: String) {
		super.init()
		self.limit = Double(limit)
		self.message = String(format: message, limit)
	}
	
	init(limit: Double, message: String) {
		super.init()
		self.limit = limit
		self.message = String(format: message, limit)
	}
	
	override func valid(_ value: String) -> Bool {
		if let safeValue = Double(value) {
			return safeValue >= self.limit
		} else {
			return false
		}
	}
}
