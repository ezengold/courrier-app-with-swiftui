import SwiftUI

struct TabBarView<Content: View>: View {
	@State var tabs: [TabBarItem] = []
	
	@Binding var selection: TabBarItem
	
	let content: Content
	
	init(current: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
		self._selection = current
		self.content = content()
	}
	
	var body: some View {
		ZStack(alignment: .bottom) {
			content
				.ignoresSafeArea()
				.animation(.none, value: selection)
			TabBar(tabs: tabs, selection: $selection)
		}
		.onPreferenceChange(TabBarPreferenceKey.self) { updated in self.tabs = updated }
	}
}

struct TabBarView_Previews: PreviewProvider {
	static var previews: some View {
		TabBarView(current: .constant(.home)) {
			ThemeColor.primary
		}
		.previewDevice("iPhone 12")
	}
}
