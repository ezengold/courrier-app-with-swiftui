import SwiftUI
import MapKit

struct HomeScreen: View {
	@EnvironmentObject var auth: AuthModel
	
	@StateObject var vm: HomeViewModel = HomeViewModel()
	
	var body: some View {
		ZStack {
			Map(coordinateRegion: $vm.currentLocation.coords)
				.ignoresSafeArea()
				.frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height)
			VStack {
				heading
				NavigationLink(
					"",
					destination: ConfirmDetailsScreen(vm: ConfirmDetailsViewModel(details: OrderSetupDetails(
						startLocation: vm.currentLocation,
						dropLocation: vm.dropLocation ?? LocationItem(title: "Ash. Dr. Sans john", description: "1901, thornridge Cir., Shiloh"),
						vehicle: vm.tripVehicle ?? .pickup,
						goodType: vm.goodType,
						name: auth.fullName,
						pickerCountry: .DEFAULT_COUNTRY,
						pickerPhoneNumber: auth.phoneNumber,
						dropoffCountry: .DEFAULT_COUNTRY
					))),
					isActive: $vm.showConfirmDetails
				)
				Spacer()
				footer
			}
			.sheet(isPresented: $vm.showVehiclePicker) {
				PickVehicleScreen()
			}
			.fullScreenCover(isPresented: $vm.showPointPicker) {
				PickPointScreen()
			}
			.sheet(isPresented: $vm.showGoodTypePicker) {
				PickGoodTypeScreen()
			}
			.environmentObject(vm)
		}
	}
	
	private var heading: some View {
		VStack(spacing: 0) {
			Text("Your Location")
				.font(ThemeFont.medium(15))
				.foregroundColor(Color.white)
			HStack(alignment: .center, spacing: 10.0) {
				ImageIcon(iconName: "Pin", contentMode: .fit, height: 30, width: 25, align: .center)
				Text("3891, Ranchview, LA, NY")
					.font(ThemeFont.semiBold(15))
					.foregroundColor(Color.white)
			}
		}
		.padding(.bottom, 50)
		.frame(maxWidth: .infinity)
		.background(
			LinearGradient(
				colors: [
					Color(.sRGB, red: 25/255, green: 33/255, blue: 45/255, opacity: 0.7),
					Color(.sRGB, red: 25/255, green: 33/255, blue: 45/255, opacity: 0.5),
					Color(.sRGB, red: 25/255, green: 33/255, blue: 45/255, opacity: 0.2),
					Color(.sRGB, red: 25/255, green: 33/255, blue: 45/255, opacity: 0),
				],
				startPoint: .top,
				endPoint: .bottom
			)
		)
	}
	
	private var footer: some View {
		VStack {
			Button {
				vm.pushLocationPicker(false)
			} label: {
				HStack {
					ImageIcon(iconName: "Truck", contentMode: .fit, height: 25, width: 25, align: .center)
					Text("Select your pickup and drop point")
						.font(ThemeFont.semiBold(14))
				}
				.foregroundColor(Color.white)
				.frame(maxWidth: .infinity)
				.frame(height: 60, alignment: .center)
				.background(Color.white.opacity(0.3))
				.cornerRadius(10)
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(Color.white.opacity(0.4), lineWidth: 1)
				)
				.padding(.horizontal, 15)
			}
		}
		.padding(.bottom, 115)
		.padding(.top, 50)
		.frame(maxWidth: .infinity)
		.background(
			LinearGradient(
				colors: [
					Color(.sRGB, red: 25/255, green: 33/255, blue: 45/255, opacity: 0.9),
					Color(.sRGB, red: 25/255, green: 33/255, blue: 45/255, opacity: 0.6),
					Color(.sRGB, red: 25/255, green: 33/255, blue: 45/255, opacity: 0.5),
					Color(.sRGB, red: 25/255, green: 33/255, blue: 45/255, opacity: 0.3),
					Color(.sRGB, red: 25/255, green: 33/255, blue: 45/255, opacity: 0),
				],
				startPoint: .bottom,
				endPoint: .top
			)
		)
	}
}

struct HomeScreen_Previews: PreviewProvider {
	static var previews: some View {
		HomeScreen()
			.previewDevice("iPhone 12")
	}
}
