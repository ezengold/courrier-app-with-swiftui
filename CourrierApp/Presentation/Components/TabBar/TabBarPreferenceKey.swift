import Foundation
import SwiftUI

struct TabBarPreferenceKey: PreferenceKey {
	static var defaultValue: [TabBarItem] = []
	
	static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
		value += nextValue()
	}
}
