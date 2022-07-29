import SwiftUI

struct CountryPicker: View {
	@Environment(\.presentationMode) var presentationMode
	
	@StateObject var pickerVM: CountryPickerViewModel = CountryPickerViewModel()
	
	@Binding var currentCountry: CountryItem?
	
	func chooseCountry(country: CountryItem) {
		currentCountry = country
		presentationMode.wrappedValue.dismiss()
	}
	
	var body: some View {
		ZStack {
			VStack(alignment: .center, spacing: 0) {
				FullWidth()
				Spacer(minLength: 30)
				Text("Pick a country")
					.font(ThemeFont.medium(14))
				Spacer(minLength: 15)
				HStack(alignment: .center) {
					TextField("Search", text: $pickerVM.searchValue) { startedEditing in
						
					}
					.font(ThemeFont.regular(14))
					.padding(15)
					.background(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.04))
					.cornerRadius(10)
					Image(systemName: "chevron.down")
						.resizable()
						.scaledToFit()
						.padding(10)
						.frame(width: 35, height: 35)
						.background(Color(hex: "#0001"))
						.onTapGesture {
							presentationMode.wrappedValue.dismiss()
						}
				}
				.padding(.trailing, 10)
				.padding(.leading, 15)
				.padding(.bottom, 15)
				List(
					pickerVM.countries.filter({ (el: CountryItem) -> Bool in
						return el.name.hasPrefix(pickerVM.searchValue) || pickerVM.searchValue == ""
					})
				) { country in
					HStack {
						Text(country.flag ?? "")
							.padding(.trailing, 15)
						VStack(alignment: .leading) {
							Text(country.name)
								.font(ThemeFont.bold(15))
							Text(country.localName)
								.font(ThemeFont.regular(12))
								.foregroundColor(ThemeColor.primary)
								.multilineTextAlignment(.leading)
								.lineLimit(1)
						}
						Spacer()
						Text("+\(country.dialCode)")
							.font(ThemeFont.medium(14))
							.foregroundColor(ThemeColor.primary)
					}
					.padding(15)
					.listRowSeparator(.hidden)
					.background(country.id == currentCountry?.id ? Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.04) : Color.white)
					.cornerRadius(10)
					.onTapGesture {
						chooseCountry(country: country)
					}
				}
				.listStyle(PlainListStyle())
				.gesture(DragGesture().onChanged({ _ in
					UIApplication.shared.dismissKeyboard()
				}))
			}
		}
		.edgesIgnoringSafeArea([.top, .leading, .trailing])
	}
}

struct CountryPicker_Previews: PreviewProvider {
	static var previews: some View {
		CountryPicker(currentCountry: .constant(.DEFAULT_COUNTRY))
			.previewDevice("iPhone 12")
	}
}
