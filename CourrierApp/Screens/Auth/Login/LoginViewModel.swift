import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
	@Published var hasAcceptedPrivacy: Bool = false
	
	@Published var phoneNumber: String = ""
	
	@Published var showCountryPicker: Bool = false
	@Published var currentCountry: CountryItem? = CountryItem.DEFAULT_COUNTRY
}
