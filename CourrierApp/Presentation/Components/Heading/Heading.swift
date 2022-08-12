import SwiftUI

struct Heading: View {
	@Environment(\.presentationMode) var presentationMode
	
	var title: String
	
	var onTapBack: () -> Void
	
    var body: some View {
		HStack {
			Image(systemName: "arrow.backward")
				.resizable()
				.scaledToFit()
				.frame(width: 20, height: 20)
				.padding(8)
				.onTapGesture {
					onTapBack()
				}
			Text(title)
				.foregroundColor(ThemeColor.boldText)
				.font(ThemeFont.semiBold(17))
			Spacer()
		}
		.padding(10)
    }
}

struct Heading_Previews: PreviewProvider {
    static var previews: some View {
		Heading(title: "Title") {
			
		}
		.previewLayout(.sizeThatFits)
    }
}
