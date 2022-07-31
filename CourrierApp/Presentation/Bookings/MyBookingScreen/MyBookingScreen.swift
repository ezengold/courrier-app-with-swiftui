import SwiftUI

struct MyBookingScreen: View {
	var body: some View {
		ZStack {
			ThemeColor.background
				.edgesIgnoringSafeArea(.all)
			Text("MyBookingScreen")
		}
		.navigationBarHidden(true)
	}
}

struct MyBookingScreen_Previews: PreviewProvider {
	static var previews: some View {
		MyBookingScreen()
			.previewDevice("iPhone 12")
	}
}
