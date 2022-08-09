import Foundation
import SwiftUI


class VerifyOtpViewModel: ObservableObject {
	@AppStorage(Constants.AUTH_STORAGE_KEY) var authJson: String = ""
	
	var loginFields: LoginFieldsModel = LoginFieldsModel { _, _ in	}
	
	var auth: AuthModel = .DEFAULT
	
	var onChange: (AuthModel) -> Void = { _ in }
	
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
	
	func setupViewModel(fields: LoginFieldsModel, auth: AuthModel, onAuthChange: @escaping ((AuthModel) -> Void)) {
		self.loginFields = fields
		self.auth = auth
		self.onChange = onAuthChange
	}
	
	func onVerifyOtp() -> Void {
		loading = true
		do {
			auth.fullName = "JOHN Doe"
			auth.email = "johndoe@gmail.com"
			auth.phoneNumber = loginFields.phoneNumber
			auth.countryCode = loginFields.country?.countryCode ?? "+91"
			auth.status = AuthModel.ACTIVE_STATUS
			auth.id = "1"
			auth.token = "CfDJ8OW5OI0CPGJBgSNlGwO0x4YF7qbYKVv7KOO-N0eFtDUzXOrL7F9Xd9W1otVi4ueJOkAmAhuoHFWNkqRaFD7zvAMHMSKncl6Vo5QXKmpvy6vqxOKxSURdIey8aZPRi3Nnhp2p9la-Al5xrVKz0lignRdcCHf3O7pF9zv_sNx_c_T7pUe3WsxaJEPX3t_9FO2Wjw"
			
			let encodedData = try JSONEncoder().encode(auth)
			authJson = String(data: encodedData, encoding: .utf8) ?? authJson
			
			DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
				self.loading = false
				self.onChange(self.auth)
			}
		} catch {
			// print error
			DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
				self.loading = false
			}
		}
	}
}
