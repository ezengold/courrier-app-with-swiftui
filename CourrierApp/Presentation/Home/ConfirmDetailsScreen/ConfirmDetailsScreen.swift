import SwiftUI

struct ConfirmDetailsScreen: View {
	@Environment(\.presentationMode) var presentationMode
	
	var body: some View {
		ZStack {
			ThemeColor.background
				.ignoresSafeArea()
			VStack(spacing: 0) {
				Heading(title: "Confirm Your Details") {
					presentationMode.wrappedValue.dismiss()
				}
				Rectangle()
					.fill(Color(hex: "#F1F2F6") ?? Color.gray)
					.frame(maxWidth: .infinity, maxHeight: 3)
					.frame(height: 3)
				ScrollView(.vertical, showsIndicators: false) {
					VStack(spacing: 0) {
						Text("Lorem ipsm")
						Spacer()
					}
					.padding(.horizontal, 15)
					.padding(.bottom, 100)
					.padding(.top, 15)
				}
			}
		}
	}
}

struct ConfirmDetailsScreen_Previews: PreviewProvider {
	static var previews: some View {
		ConfirmDetailsScreen()
			.previewDevice("iPhone 12")
	}
}
