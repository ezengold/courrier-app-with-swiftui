import SwiftUI

struct ProfileScreen: View {
    var body: some View {
		ZStack {
			ThemeColor.background
				.edgesIgnoringSafeArea(.all)
			Text("ProfileScreen")
		}
		.navigationBarHidden(true)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
			.previewDevice("iPhone 12")
    }
}
