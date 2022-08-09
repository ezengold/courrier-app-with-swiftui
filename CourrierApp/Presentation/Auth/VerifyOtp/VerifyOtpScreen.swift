import SwiftUI

struct VerifyOtpScreen: View {
	@Environment(\.presentationMode) var presentationMode
	
	// ROUTE PARAMS
	var loginFields: LoginFieldsModel
	
	@EnvironmentObject var auth: AuthModel
	
	@StateObject var vm: VerifyOtpViewModel = VerifyOtpViewModel()
	
	var body: some View {
		ZStack(alignment: .bottom) {
			ThemeColor.background
				.edgesIgnoringSafeArea(.all)
			VStack(alignment: .center, spacing: 10) {
				HStack {
					Image(systemName: "arrow.backward")
						.resizable()
						.scaledToFit()
						.frame(width: 20, height: 20)
						.padding(8)
						.onTapGesture {
							presentationMode.wrappedValue.dismiss()
						}
					Text("Enter Verification Code")
						.foregroundColor(ThemeColor.boldText)
						.font(ThemeFont.bold(17))
					Spacer()
				}
				HStack {
					Text("We have sent an OTP to ")
						.foregroundColor(ThemeColor.text)
						.font(ThemeFont.regular(15))
					Text("+\(loginFields.country?.dialCode ?? "") \(loginFields.phoneNumber)")
						.foregroundColor(ThemeColor.boldText)
						.font(ThemeFont.bold(15))
						.lineSpacing(8)
					Spacer()
				}
				Spacer().frame(height: 50)
				GeometryReader { geometry in
					OtpField(
						length: 5,
						spacing: 15,
						maxWidth: geometry.size.width
					) { code,_ in vm.otpCode = code}
				}
				Spacer()
			}
			.padding(.horizontal, 20)
			.padding(.bottom, 50)
			.onAppear() {
				vm.setupViewModel(
					fields: loginFields,
					auth: auth,
					onAuthChange: auth.setInstance
				)
			}
			.onTapGesture {
				UIApplication.shared.dismissKeyboard()
			}
			VStack(spacing: 15) {
				Text(vm.timeRemainingStr)
					.foregroundColor(ThemeColor.text)
					.font(ThemeFont.bold(17))
					.onReceive(vm.timer) { _ in
						if vm.timeRemaining > 0 {
							vm.timeRemaining -= 1
						}
					}
				HStack {
					Text("Didn’t Receive The code ?")
						.foregroundColor(ThemeColor.text)
						.font(ThemeFont.medium(16))
					Text("Resend Now")
						.foregroundColor(ThemeColor.primary)
						.font(ThemeFont.medium(15))
				}
				Button {
					vm.onVerifyOtp()
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
						Text("Verify Now")
							.font(ThemeFont.medium(19))
							.frame(maxWidth: .infinity)
							.frame(height: 54, alignment: .center)
							.foregroundColor(Color.white)
							.background(
								RoundedRectangle(cornerRadius: 7)
									.fill(vm.otpCode.isEmpty ? Color.gray : ThemeColor.primary)
									.shadow(color: vm.otpCode.isEmpty ? Color.clear : ThemeColor.buttonShadow, radius: 10, x: -5, y: 5)
							)
							.disabled(vm.otpCode.isEmpty)
					}
				}
			}
			.padding([.horizontal, .bottom], 20)
		}
		.onTapGesture {
			UIApplication.shared.dismissKeyboard()
		}
		.navigationBarHidden(true)
	}
}

struct VerifyOtpScreen_Previews: PreviewProvider {
	static var previews: some View {
		VerifyOtpScreen(loginFields: .DEFAULT)
			.preferredColorScheme(.light)
			.previewDevice("iPhone 12")
	}
}
