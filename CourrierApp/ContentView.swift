import SwiftUI

struct ContentView: View {
	@State var loading: Bool = false
	
	@AppStorage(Constants.AUTH_STORAGE_KEY) var authJson: String = ""
	
	@StateObject var auth: AuthModel = AuthModel()
	
	@State var currentTab: TabBarItem = .home
	
	var body: some View {
		ZStack {
			if loading {
				ProgressView()
					.progressViewStyle(CircularProgressViewStyle(tint: ThemeColor.primary))
			} else {
				if !auth.id.isEmpty && !auth.token.isEmpty {
					TabBarView(current: $currentTab) {
						NavigationView {
							HomeScreen()
								.navigationBarHidden(true)
						}
						.tabBarItem(.home, current: $currentTab)
						MyBookingScreen()
							.tabBarItem(.bookings, current: $currentTab)
						ProfileScreen()
							.tabBarItem(.profile, current: $currentTab)
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
		let data = Data(authJson.utf8)
		
//		if !data.isEmpty {
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
				
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					loading = false
				}
			} catch {
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					loading = false
				}
			}
//		} else {
//			self.auth.id = "1"
//			self.auth.fullName = "Ezen Gold"
//			self.auth.token = "loremipsumdolor"
//		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice("iPhone 12")
	}
}
