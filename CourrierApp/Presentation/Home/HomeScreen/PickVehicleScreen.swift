import SwiftUI

struct PickVehicleScreen: View {
	@EnvironmentObject var vm: HomeViewModel
	
	var body: some View {
		ZStack {
			ThemeColor.orange
				.edgesIgnoringSafeArea(.all)
			ScrollView(.vertical, showsIndicators: false) {
				header
			}
		}
	}
	
	private var header: some View {
		HStack {
			Image(systemName: "arrow.backward")
				.resizable()
				.scaledToFit()
				.frame(width: 20, height: 20)
				.padding(8)
				.onTapGesture {
					vm.resetAll()
				}
			Text("Select Your point")
				.foregroundColor(ThemeColor.boldText)
				.font(ThemeFont.medium(17))
			Spacer()
		}
		.padding([.horizontal, .bottom], 15)
		.padding(.top, 10)
	}
}

struct PickVehicleScreen_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			ThemeColor.primary
				.ignoresSafeArea()
		}
		.sheet(isPresented: .constant(true)) {
			PickVehicleScreen()
		}
		.environmentObject(HomeViewModel())
		.previewDevice("iPhone 12")
	}
}
