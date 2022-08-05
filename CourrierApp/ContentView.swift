import SwiftUI

struct ContentView: View {
	
	var body: some View {
		NavigationView {
			LoginScreen()
		}
		.preferredColorScheme(.light)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice("iPhone 12")
	}
}

extension UIApplication {
	func dismissKeyboard() {
		sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}

extension String {
	func chartAt(at index: Int) -> String {
		if index >= 0 && index < self.count {
			return String(self[self.index(self.startIndex, offsetBy: index)])
		}
		
		return ""
	}
}
