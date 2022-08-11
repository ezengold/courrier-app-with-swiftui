import SwiftUI

/// The tab bar shown at bottom or top
struct TabBar: View {
	let tabs: [TabBarItem]
	
	@Binding var selection: TabBarItem
	
	var body: some View {
		secondStyle
	}
	
	private func switchToTab(tab: TabBarItem) {
		withAnimation(.easeInOut) {
			selection = tab
		}
	}
}


// MARK - Presentation 1 (default)
extension TabBar {
	private var firstStyle: some View {
		HStack {
			ForEach(tabs, id: \.self) { tab in
				firstTabBarCell(tab: tab)
					.onTapGesture {
						switchToTab(tab: tab)
					}
			}
		}
		.frame(maxWidth: .infinity)
		.background(.ultraThinMaterial)
	}
	
	private func firstTabBarCell(tab: TabBarItem) -> some View {
		VStack(spacing: 10) {
			Image(tab.icon)
				.resizable()
				.animation(.none, value: selection)
				.foregroundColor(selection == tab ? tab.color : Color.gray)
				.scaledToFit()
				.frame(width: 25, height: 25)
			Text(tab.title)
				.animation(.none, value: selection)
				.lineLimit(1)
				.font(ThemeFont.semiBold(14))
				.foregroundColor(selection == tab ? tab.color : Color.gray)
		}
		.padding(.vertical, 10)
		.frame(maxWidth: .infinity)
	}
}


// MARK - Presentation 2
extension TabBar {
	private var secondStyle: some View {
		HStack {
			ForEach(tabs, id: \.self) { tab in
				secondTabBarCell(tab: tab)
					.onTapGesture {
						switchToTab(tab: tab)
					}
			}
		}
		.frame(maxWidth: .infinity)
		.background(Color.white)
		.cornerRadius(12)
		.padding([.horizontal, .bottom], 15)
		.shadow(radius: 15)
	}
	
	private func secondTabBarCell(tab: TabBarItem) -> some View {
		VStack {
			Rectangle()
				.fill(selection == tab ? ThemeColor.primary : Color.clear)
				.padding(.horizontal, 20)
				.frame(maxWidth: .infinity)
				.frame(height: 5)
				.animation(.none, value: selection)
			Image(tab.icon)
				.resizable()
				.foregroundColor(selection == tab ? ThemeColor.boldText : Color.gray)
				.scaledToFit()
				.frame(width: 30, height: 30)
				.animation(.none, value: selection)
			Text(tab.title)
				.lineLimit(1)
				.font(ThemeFont.medium(14))
				.foregroundColor(selection == tab ? ThemeColor.boldText : Color.gray)
				.animation(.none, value: selection)
		}
		.padding(.bottom, 10)
		.frame(maxWidth: .infinity)
	}
}


struct TabBar_Previews: PreviewProvider {
	static var previews: some View {
		TabBar(
			tabs: [
				.home,
				.bookings,
				.profile
			],
			selection: .constant(.home)
		)
		.previewLayout(.sizeThatFits)
	}
}
