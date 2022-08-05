import Foundation
import SwiftUI


class VerifyOtpViewModel: ObservableObject {
	var loginFields: LoginFieldsModel = LoginFieldsModel { _, _ in	}
	
	@Published var loading: Bool = false
	
	@Published var otpCode: String = ""
	
	@Published var timeRemainingStr: String = "05:00"
	
	@Published var timeRemaining: Int = 300 {
		didSet {
			let minutes = Int(timeRemaining) / 60 % 60
			let seconds = Int(timeRemaining) % 60
			timeRemainingStr = String(format:"%02i:%02i", minutes, seconds)
		}
	}
	
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	func onVerifyOtp() -> Void {
		loading = true
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			self.loading = false
		}
	}
}
