import SwiftUI

struct LoginScreen: View {
	@StateObject var vm: LoginViewModel = LoginViewModel()
	
	var body: some View {
		ZStack {
			ThemeColor.background
				.edgesIgnoringSafeArea(.all)
			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .center, spacing: 0) {
					FullWidth()
					Group {
						Spacer(minLength: 50)
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
						NavigationLink(destination: RegisterScreen(), label: {
							Text("Welcome To Pickup App")
								.multilineTextAlignment(.center)
								.foregroundColor(ThemeColor.boldText)
								.font(ThemeFont.bold(24))
						})
						Spacer(minLength: 10)
						Text("You can now continue with your mobile number to Pickup your Goods!")
							.foregroundColor(ThemeColor.text)
							.font(ThemeFont.regular(14))
							.multilineTextAlignment(.center)
							.lineSpacing(8)
							.padding(.horizontal, 40)
						Spacer(minLength: 50)
					}
					VStack(alignment: .leading, spacing: 0) {
						FullWidth()
						Button (action: {
							vm.showCountryPicker.toggle()
						}, label: {
							GeometryReader { geometry in
								HStack(alignment: .center, spacing: 0) {
									if let country = vm.fields.country {
										Text(country.flag ?? "")
											.padding(.leading, 10)
											.padding(.trailing, 15)
											.frame(width: 55, height: 20)
										Text("(+\(country.dialCode)) \(country.name)")
											.foregroundColor(ThemeColor.boldText)
											.font(ThemeFont.medium(16))
											.frame(maxWidth: .infinity, alignment: .leading)
											.multilineTextAlignment(.leading)
									} else {
										Text("Pick a country")
											.foregroundColor(ThemeColor.boldText)
											.font(ThemeFont.medium(16))
											.frame(maxWidth: .infinity, alignment: .leading)
											.multilineTextAlignment(.leading)
									}
									SystemIcon(
										iconName: "chevron.right",
										contentMode: .fit,
										color: ThemeColor.boldText,
										height: 10,
										width: 10,
										align: .center
									)
									.padding(.horizontal, 15)
								}
								.frame(width: geometry.size.width, height: 62)
								.background(Color.white)
							}
						})
						.sheet(isPresented: $vm.showCountryPicker) {
							CountryPicker(currentCountry: $vm.fields.country)
						}
						
						Rectangle()
							.fill(ThemeColor.borderBlue)
							.frame(height: 1)
						
						GeometryReader { geometry in
							HStack(alignment: .center, spacing: 0) {
								SystemIcon(
									iconName: "phone",
									contentMode: .fit,
									color: ThemeColor.boldText,
									height: 20,
									width: 35,
									align: .center
								)
								.padding(.leading, 10)
								.padding(.trailing, 15)
								TextField("Enter Your Mobile Number", text: $vm.fields.phoneNumber)
									.font(ThemeFont.medium(16))
									.keyboardType(.numberPad)
									.foregroundColor(ThemeColor.boldText)
									.frame(width: geometry.size.width - 75, alignment: .leading)
									.padding(.trailing, 15)
							}
							.frame(width: geometry.size.width, height: 62)
							.background(Color.white)
						}
					}
					.frame(height: 124, alignment: .center)
					.background(Color.white)
					.cornerRadius(11)
					.clipped()
					.shadow(color: ThemeColor.borderBlue, radius: 19, x: 4, y: 6)
					.overlay {
						RoundedRectangle(cornerRadius: 11)
							.stroke(vm.errors.phoneNumber.isEmpty ? ThemeColor.borderBlue : ThemeColor.primary, lineWidth: 1)
					}
					
					Spacer(minLength: 30)
					VStack(alignment: .trailing, spacing: 0) {
						FullWidth()
						GeometryReader { geometry in
							HStack(alignment: .top, spacing: 0) {
								Checkbox(checked: $vm.fields.privacy, color: vm.errors.privacy.isEmpty ? ThemeColor.primary : ThemeColor.danger, size: 15)
									.padding(.top, 5)
									.padding(.leading, 10)
									.padding(.trailing, 15)
								Group {
									Text("I have read and accept the")
										.font(ThemeFont.regular(13))
									+ Text(" Privacy Policy ")
										.font(ThemeFont.medium(13))
										.foregroundColor(ThemeColor.primary)
									+ Text("and agree that my personal data will be processed by you")
										.font(ThemeFont.regular(13))
								}
								.foregroundColor(ThemeColor.text)
								.lineSpacing(5)
								.fixedSize(horizontal: false, vertical: true)
								.frame(width: geometry.size.width - 50, alignment: .leading)
								Spacer()
							}
							.frame(width: geometry.size.width)
						}
						
						Spacer(minLength: 70)
						
						GeometryReader { geometry in
							HStack(alignment: .center, spacing: 0) {
								Checkbox(checked: $vm.fields.terms, color: vm.errors.terms.isEmpty ? ThemeColor.primary : ThemeColor.danger, size: 15)
									.padding(.leading, 10)
									.padding(.trailing, 15)
								Group {
									Text("I have read and accept the")
										.font(ThemeFont.regular(13))
									+ Text(" Terms of Use")
										.font(ThemeFont.medium(13))
										.foregroundColor(ThemeColor.primary)
								}
								.foregroundColor(ThemeColor.text)
								.lineSpacing(5)
								.fixedSize(horizontal: false, vertical: true)
								.frame(width: geometry.size.width - 50, alignment: .leading)
								Spacer()
							}
							.frame(width: geometry.size.width)
						}
					}
					
					Spacer(minLength: 100)
					
					VStack(alignment: .center, spacing: 0) {
						FullWidth()
						Button {
							vm.onLogin()
						} label: {
							if vm.loading {
								ProgressView()
									.progressViewStyle(CircularProgressViewStyle(tint: Color.white))
									.frame(maxWidth: .infinity)
									.frame(height: 54, alignment: .center)
									.background(
										RoundedRectangle(cornerRadius: 7)
											.fill(ThemeColor.primary)
											.shadow(color: ThemeColor.buttonShadow, radius: 10, x: -5, y: 5)
									)
							} else {
								Text("Login Now")
									.font(ThemeFont.medium(19))
									.frame(maxWidth: .infinity)
									.frame(height: 54, alignment: .center)
									.foregroundColor(Color.white)
									.background(
										RoundedRectangle(cornerRadius: 7)
											.fill(vm.validator.isFormValid ? ThemeColor.primary : ThemeColor.primary.opacity(0.5))
											.shadow(color: ThemeColor.buttonShadow, radius: 10, x: -5, y: 5)
									)
							}
						}
						Spacer(minLength: 40)
						
						Text("For Commercial / Bulk Movement Please")
							.foregroundColor(ThemeColor.text)
							.font(ThemeFont.regular(14))
						Spacer(minLength: 10)
						Text("Contact")
							.foregroundColor(ThemeColor.text)
							.font(ThemeFont.regular(14))
						+ Text(" +91 12345 06789")
							.foregroundColor(ThemeColor.boldText)
							.font(ThemeFont.semiBold(14))
					}
				}
				.padding(.horizontal, 20)
				.padding(.bottom, 20)
			}
			.onTapGesture {
				UIApplication.shared.dismissKeyboard()
			}
		}
		.navigationBarHidden(true)
	}
}

struct LoginScreen_Previews: PreviewProvider {
	static var previews: some View {
		LoginScreen()
			.previewDevice("iPhone 12")
	}
}
