import SwiftUI

struct ConfirmDetailsScreen: View {
	@StateObject var vm: ConfirmDetailsViewModel
	
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
						Text("Driver Will Call Below Person")
							.font(ThemeFont.semiBold(15))
							.foregroundColor(ThemeColor.boldText)
						nameInput
						pickupContactInput
						dropoffContactInput
						messageInput
						submit
							.padding(.top, 30)
						NavigationLink("", destination: BillingScreen(vm: vm), isActive: $vm.showBillingScreen)
						Spacer()
					}
					.padding(.horizontal, 15)
					.padding(.bottom, 120)
					.padding(.top, 15)
				}
				.onTapGesture {
					UIApplication.shared.dismissKeyboard()
				}
			}
			.navigationBarHidden(true)
		}
	}
}

extension ConfirmDetailsScreen {
	var nameInput: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text("Your name")
				.font(ThemeFont.medium(15))
				.foregroundColor(Color(hex: "#677294B2") ?? ThemeColor.text)
			TextField("", text: $vm.details.name)
				.disableAutocorrection(true)
				.font(ThemeFont.medium(16))
				.padding(.leading, 45)
				.padding(.trailing)
				.frame(height: 55)
				.frame(maxWidth: .infinity)
				.background(Color(hex: "#CED1DC4F") ?? ThemeColor.background)
				.cornerRadius(10)
				.overlay {
					RoundedRectangle(cornerRadius: 10)
						.stroke(
							vm.errors.name.isEmpty ? (Color(hex: "#67729429") ?? Color.gray) : ThemeColor.primary,
							lineWidth: 1
						)
					Image("user")
						.resizable()
						.scaledToFit()
						.frame(width: 25, height: 25, alignment: .center)
						.position(x: 25, y: 28)
				}
		}
		.padding(.top, 30)
		.frame(maxWidth: .infinity, alignment: .leading)
	}
}

extension ConfirmDetailsScreen {
	private var pickupContactInput: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text("Pickup Contact")
				.font(ThemeFont.medium(15))
				.foregroundColor(Color(hex: "#677294B2") ?? ThemeColor.text)
			HStack(spacing: 20) {
				Text("\(vm.details.pickerCountry?.flag ?? "")  (+\(vm.details.pickerCountry?.dialCode ?? "??"))")
					.font(ThemeFont.medium(16))
					.frame(width: 120, height: 55)
					.background(Color(hex: "#CED1DC4F") ?? ThemeColor.background)
					.cornerRadius(11)
					.overlay {
						RoundedRectangle(cornerRadius: 11)
							.stroke(
								Color(hex: "#67729429") ?? Color.gray,
								lineWidth: 1
							)
					}
					.onTapGesture {
						vm.showPickupCountryPicker.toggle()
					}
					.sheet(isPresented: $vm.showPickupCountryPicker) {
						CountryPicker(currentCountry: $vm.details.pickerCountry)
					}
				TextField("Phone number", text: $vm.details.pickerPhoneNumber)
					.font(ThemeFont.medium(16))
					.keyboardType(.numberPad)
					.padding(.horizontal)
					.frame(height: 55)
					.frame(maxWidth: .infinity)
					.background(Color(hex: "#CED1DC4F") ?? ThemeColor.background)
					.cornerRadius(11)
					.overlay {
						RoundedRectangle(cornerRadius: 11)
							.stroke(
								vm.errors.pickerPhoneNumber.isEmpty ? (Color(hex: "#67729429") ?? Color.gray) : ThemeColor.primary,
								lineWidth: 1
							)
					}
			}
		}
		.padding(.top, 30)
		.frame(maxWidth: .infinity, alignment: .leading)
	}
}

extension ConfirmDetailsScreen {
	private var dropoffContactInput: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text("Dropoff Contact")
				.font(ThemeFont.medium(15))
				.foregroundColor(Color(hex: "#677294B2") ?? ThemeColor.text)
			HStack(spacing: 20) {
				Text("\(vm.details.dropoffCountry?.flag ?? "")  (+\(vm.details.dropoffCountry?.dialCode ?? "??"))")
					.font(ThemeFont.medium(16))
					.frame(width: 120, height: 55)
					.background(Color(hex: "#CED1DC4F") ?? ThemeColor.background)
					.cornerRadius(11)
					.overlay {
						RoundedRectangle(cornerRadius: 11)
							.stroke(
								Color(hex: "#67729429") ?? Color.gray,
								lineWidth: 1
							)
					}
					.onTapGesture {
						vm.showDropoffCountryPicker.toggle()
					}
					.sheet(isPresented: $vm.showDropoffCountryPicker) {
						CountryPicker(currentCountry: $vm.details.dropoffCountry)
					}
				TextField("Phone number", text: $vm.details.dropoffPhoneNumber)
					.font(ThemeFont.medium(16))
					.keyboardType(.numberPad)
					.padding(.horizontal)
					.frame(height: 55)
					.frame(maxWidth: .infinity)
					.background(Color(hex: "#CED1DC4F") ?? ThemeColor.background)
					.cornerRadius(11)
					.overlay {
						RoundedRectangle(cornerRadius: 11)
							.stroke(
								vm.errors.dropoffPhoneNumber.isEmpty ? (Color(hex: "#67729429") ?? Color.gray) : ThemeColor.primary,
								lineWidth: 1
							)
					}
			}
		}
		.padding(.top, 30)
		.frame(maxWidth: .infinity, alignment: .leading)
	}
}

extension ConfirmDetailsScreen {
	var messageInput: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text("Message")
				.font(ThemeFont.medium(15))
				.foregroundColor(Color(hex: "#677294B2") ?? ThemeColor.text)
			TextEditor(text: $vm.details.message)
				.foregroundColor(ThemeColor.text)
				.disableAutocorrection(true)
				.font(ThemeFont.medium(16))
				.padding(10)
				.background(Color(hex: "#CED1DC4F") ?? ThemeColor.background)
				.frame(height: 120)
				.frame(maxWidth: .infinity)
				.cornerRadius(10)
				.overlay {
					RoundedRectangle(cornerRadius: 10)
						.stroke(
							vm.errors.message.isEmpty ? (Color(hex: "#67729429") ?? Color.gray) : ThemeColor.primary,
							lineWidth: 1
						)
				}
			Text("\(vm.details.message.count) / 270")
				.font(ThemeFont.regular(13))
				.multilineTextAlignment(.trailing)
				.frame(maxWidth: .infinity, alignment: .trailing)
		}
		.padding(.top, 30)
		.frame(maxWidth: .infinity, alignment: .leading)
		.onAppear() {
			UITextView.appearance().backgroundColor = .clear
		}
	}
}

extension ConfirmDetailsScreen {
	var submit: some View {
		Button {
			vm.onTapNext()
		} label: {
			Text("Confirm Details")
				.font(ThemeFont.medium(19))
				.frame(maxWidth: .infinity)
				.frame(height: 54, alignment: .center)
				.foregroundColor(Color.white)
				.background(
					RoundedRectangle(cornerRadius: 7)
						.fill(ThemeColor.primary)
						.shadow(color: ThemeColor.buttonShadow, radius: 10, x: -5, y: 5)
				)
				.disabled(!vm.validator.isFormValid)
		}
	}
}

struct ConfirmDetailsScreen_Previews: PreviewProvider {
	static var previews: some View {
		ConfirmDetailsScreen(vm: ConfirmDetailsViewModel(details: .DEFAULT))
			.previewDevice("iPhone 12")
	}
}
