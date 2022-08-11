import Foundation
import SwiftUI

struct TabBarItemViewModifier: ViewModifier {
	// Declared tab on the modifier
	let tab: TabBarItem
	
	// Current tab
	@Binding var selection: TabBarItem
	
	func body(content: Content) -> some View {
		content
			.opacity(selection == tab ? 1.0 : 0.0)
			.preference(key: TabBarPreferenceKey.self, value: [tab])
			.animation(.none, value: selection)
	}
}

// add tarbarmodifier to View
extension View {
	func tabBarItem(_ tab: TabBarItem, current: Binding<TabBarItem>) -> some View {
		self
			.modifier(TabBarItemViewModifier(tab: tab, selection: current))
	}
}
