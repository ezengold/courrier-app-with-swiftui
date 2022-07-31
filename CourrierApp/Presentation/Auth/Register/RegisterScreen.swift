import SwiftUI

struct RegisterScreen: View {
	@Environment(\.presentationMode) var presentationMode
	
	@StateObject var registerVM: RegisterViewModel = RegisterViewModel()
	
	var body: some View {
		ZStack(alignment: .bottom) {
			ThemeColor.background
				.edgesIgnoringSafeArea(.all)
			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .center, spacing: 0) {
					HStack {
						Image(systemName: "arrow.backward")
							.resizable()
							.scaledToFit()
							.frame(width: 20, height: 20)
							.padding(8)
							.onTapGesture {
								presentationMode.wrappedValue.dismiss()
							}
						Spacer()
					}
					Group {
						Spacer(minLength: 30)
						HStack(alignment: .center, spacing: 0) {
							Spacer()
							Image("Logo")
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(width: 40, height: 40, alignment: .center)
							Text("Dummy Logo")
								.padding(.leading, 10)
								.foregroundColor(ThemeColor.boldText)
								.font(ThemeFont.medium(30))
							Spacer()
						}
						Spacer(minLength: 40)
						Text("Welcome To Pickup App")
							.multilineTextAlignment(.center)
							.foregroundColor(ThemeColor.boldText)
							.font(ThemeFont.bold(24))
						Spacer(minLength: 10)
						Text("You can now continue with your mobile number to Pickup your Goods!")
							.foregroundColor(ThemeColor.text)
							.font(ThemeFont.regular(14))
							.multilineTextAlignment(.center)
							.lineSpacing(8)
							.padding(.horizontal, 40)
						Spacer(minLength: 50)
					}
					VStack(spacing: 20) {
						FullWidth()
						HStack(spacing: 20) {
							Text("\(registerVM.fields.country?.flag ?? "")  (+\(registerVM.fields.country?.dialCode ?? "??"))")
								.font(ThemeFont.medium(16))
								.frame(width: 120, height: 55)
								.background(ThemeColor.background)
								.overlay {
									RoundedRectangle(cornerRadius: 11)
										.stroke(ThemeColor.borderBlue, lineWidth: 1)
								}
								.onTapGesture {
									registerVM.showCountryPicker.toggle()
								}
								.sheet(isPresented: $registerVM.showCountryPicker) {
									CountryPicker(currentCountry: $registerVM.fields.country)
								}
							TextField("Phone number", text: $registerVM.fields.phoneNumber)
								.font(ThemeFont.medium(16))
								.keyboardType(.numberPad)
								.padding(.horizontal)
								.frame(height: 55)
								.frame(maxWidth: .infinity)
								.background(ThemeColor.background)
								.overlay {
									RoundedRectangle(cornerRadius: 11)
										.stroke(ThemeColor.borderBlue, lineWidth: 1)
								}
						}
						TextField("Enter your name", text: $registerVM.fields.fullName)
							.font(ThemeFont.medium(16))
							.padding(.leading, 45)
							.padding(.trailing)
							.frame(height: 55)
							.frame(maxWidth: .infinity)
							.background(ThemeColor.background)
							.overlay {
								RoundedRectangle(cornerRadius: 11)
									.stroke(ThemeColor.borderBlue, lineWidth: 1)
								Image("user")
									.resizable()
									.scaledToFit()
									.frame(width: 25, height: 25, alignment: .center)
									.position(x: 25, y: 28)
							}
						TextField("Enter your email address", text: $registerVM.fields.email)
							.keyboardType(.emailAddress)
							.font(ThemeFont.medium(16))
							.keyboardType(.numberPad)
							.padding(.leading, 45)
							.padding(.trailing)
							.frame(height: 55)
							.frame(maxWidth: .infinity)
							.background(ThemeColor.background)
							.overlay {
								RoundedRectangle(cornerRadius: 11)
									.stroke(ThemeColor.borderBlue, lineWidth: 1)
								Image("mail")
									.resizable()
									.scaledToFit()
									.frame(width: 25, height: 25, alignment: .center)
									.position(x: 25, y: 28)
							}
						HStack(alignment: .center, spacing: 0) {
							Checkbox(checked: $registerVM.isRemember, size: 15)
								.padding(.leading, 5)
								.padding(.trailing, 15)
							Text("Remember me")
								.font(ThemeFont.medium(15))
								.foregroundColor(ThemeColor.text)
								.lineSpacing(5)
								.fixedSize(horizontal: false, vertical: true)
							Spacer()
						}
						Spacer(minLength: 80)
						Button {
							registerVM.onRegister()
						} label: {
							Text("Register")
								.font(ThemeFont.medium(19))
								.frame(maxWidth: .infinity)
								.frame(height: 54, alignment: .center)
								.foregroundColor(Color.white)
								.background(
									RoundedRectangle(cornerRadius: 7)
										.fill(ThemeColor.primary)
										.shadow(color: ThemeColor.buttonShadow, radius: 10, x: -5, y: 5)
								)
						}
					}
				}
				.padding(.horizontal, 20)
				.padding(.bottom, 50)
			}
			.onTapGesture {
				UIApplication.shared.dismissKeyboard()
			}
		}
		.navigationBarHidden(true)
	}
}

struct RegisterScreen_Previews: PreviewProvider {
	static var previews: some View {
		RegisterScreen()
			.preferredColorScheme(.dark)
			.previewDevice("iPhone 12")
	}
}
