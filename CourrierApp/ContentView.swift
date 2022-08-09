import SwiftUI

struct ContentView: View {
	@State var loading: Bool = false
	
	@StateObject var auth: AuthModel = AuthModel()
	
	var body: some View {
		ZStack {
			if loading {
				ProgressView()
					.progressViewStyle(CircularProgressViewStyle(tint: ThemeColor.primary))
			} else {
				if !auth.id.isEmpty && !auth.token.isEmpty {
					NavigationView {
						// TODO - Put navigation
						HomeScreen()
					}
				} else {
					NavigationView {
						LoginScreen()
					}
				}
			}
		}
		.onAppear() {
			fetchAuth()
		}
		.preferredColorScheme(.light)
		.environmentObject(auth)
	}
	
	func fetchAuth() {
		if let data = UserDefaults.standard.value(forKey: Constants.AUTH_STORAGE_KEY) as? Data {
			loading = true
			do {
				let user = try JSONDecoder().decode(AuthModel.self, from: data)
				
				self.auth.id = user.id
				self.auth.fullName = user.fullName
				self.auth.email = user.email
				self.auth.phoneNumber = user.phoneNumber
				self.auth.countryCode = user.countryCode
				self.auth.status = user.status
				self.auth.token = user.token
				
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					loading = false
				}
			} catch {
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					loading = false
				}
			}
		} else {
			print("noting in storage")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice("iPhone 12")
	}
}
