import SwiftUI

struct HomeScreen: View {
	var body: some View {
		ZStack {
			ThemeColor.background
				.edgesIgnoringSafeArea(.all)
			Text("HomeScreen")
		}
		.navigationBarHidden(true)
	}
}

struct HomeScreen_Previews: PreviewProvider {
	static var previews: some View {
		HomeScreen()
			.previewDevice("iPhone 12")
	}
}
