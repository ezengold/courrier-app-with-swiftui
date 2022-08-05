import Foundation

import SwiftUI

class VerifyOtpViewModel: ObservableObject {
	var loginFields: LoginFieldsModel = LoginFieldsModel { _, _ in	}
	
	@Published var loading: Bool = false
	
	@Published var otpCode: String = ""
	
	@Published var timeRemaining: Int = 0
	
	@Published var timeRemainingStr: String = "00:30"
}
