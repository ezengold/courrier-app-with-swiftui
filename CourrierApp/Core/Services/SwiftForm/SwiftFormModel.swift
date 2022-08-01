import Foundation
import SwiftUI

struct SwiftFormField {
	var name: String
	var rules: [SwiftFormRule] = []
	var valid: Bool = false
	var error: String = ""
}
