import SwiftUI

struct PickVehicleScreen: View {
	@EnvironmentObject var vm: HomeViewModel
	
	var body: some View {
		ZStack {
			Color.white
				.edgesIgnoringSafeArea(.all)
			VStack(spacing: 0) {
				header
				Rectangle()
					.fill(Color(hex: "#F1F2F6") ?? Color.gray)
					.frame(maxWidth: .infinity, maxHeight: 3)
					.frame(height: 3)
				locations
				vehicles
				submit
				Spacer()
			}
			.onTapGesture {
				UIApplication.shared.dismissKeyboard()
			}
		}
	}
	
	private var header: some View {
		HStack {
			Text("Select Your Vehicle Type")
				.foregroundColor(ThemeColor.boldText)
				.font(ThemeFont.semiBold(17))
			Spacer()
			Image(systemName: "xmark")
				.resizable()
				.font(ThemeFont.bold(10))
				.scaledToFit()
				.frame(width: 9, height: 9)
				.padding(13)
				.background(Color(hex: "#D1D3DE") ?? Color.gray)
				.cornerRadius(20)
				.onTapGesture {
					vm.resetAll()
				}
		}
		.padding(.horizontal, 20)
		.padding(.vertical, 15)
	}
}

extension PickVehicleScreen {
	private var locations: some View {
		HStack(alignment: .center, spacing: 15) {
			VStack(alignment: .leading, spacing: 15) {
				HStack(alignment: .center, spacing: 0) {
					ImageIcon(
						iconName: "Target",
						contentMode: .fit,
						height: 25,
						width: 25,
						align: .center
					)
					.foregroundColor(ThemeColor.text)
					Text(vm.currentLocation.description)
						.foregroundColor(ThemeColor.text)
						.font(ThemeFont.semiBold(15))
						.padding(.leading, 15)
						.frame(maxWidth: .infinity, alignment: .leading)
						.multilineTextAlignment(.leading)
				}
				HStack(alignment: .center, spacing: 0) {
					ImageIcon(
						iconName: "PinClear",
						contentMode: .fit,
						height: 25,
						width: 25,
						align: .center
					)
					.foregroundColor(ThemeColor.text)
					Text(vm.dropLocation?.description ?? "-")
						.foregroundColor(ThemeColor.text)
						.font(ThemeFont.semiBold(15))
						.padding(.leading, 15)
						.frame(maxWidth: .infinity, alignment: .leading)
						.multilineTextAlignment(.leading)
				}
			}
			Spacer()
			Text("Change")
				.foregroundColor(ThemeColor.primary)
				.underline()
				.font(ThemeFont.medium(15))
				.onTapGesture {
					vm.showVehiclePicker = false
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
						vm.showPointPicker = true
					}
				}
		}
		.padding(20)
	}
}

extension PickVehicleScreen {
	private var vehicles: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(alignment: .center, spacing: 15.0) {
				ForEach(vm.vehicles) { vehicle in
					renderVehicle(vehicle: vehicle)
				}
			}
			.padding(.top, 5)
			.padding(.horizontal, 20)
		}
		.padding(.vertical, 15)
	}
	
	private func renderVehicle(vehicle: Vehicle) -> some View {
		VStack(alignment: .center, spacing: 8) {
			VStack(alignment: .center, spacing: 15) {
				Image(vehicle.icon)
					.resizable()
					.scaledToFit()
					.foregroundColor(vehicle == vm.tripVehicle ? ThemeColor.primary : (Color(hex: "#838994") ?? Color.gray))
					.frame(width: 95, height: 60, alignment: .center)
				Text(vehicle.name)
					.font(ThemeFont.medium(14))
					.foregroundColor(vehicle == vm.tripVehicle ? ThemeColor.primary : ThemeColor.boldText)
			}
			.frame(width: 120, alignment: .center)
			.frame(minHeight: 120)
			.background(vehicle == vm.tripVehicle ? ThemeColor.primary.opacity(0.1) : (Color(hex: "#F3F4F6") ?? Color.gray))
			.cornerRadius(10)
			.overlay {
				RoundedRectangle(cornerRadius: 10)
					.stroke(
						vm.tripVehicle == vehicle ? ThemeColor.primary : Color.clear,
						lineWidth: vm.tripVehicle == vehicle ? 1.5 : 0
					)
			}
			Text("\(vehicle.currency) \(String(format: "%.2f", vehicle.price))")
				.font(ThemeFont.semiBold(13))
				.foregroundColor(vehicle == vm.tripVehicle ? ThemeColor.primary : Color.white)
				.frame(width: 100, height: 30, alignment: .center)
				.background(vehicle == vm.tripVehicle ? ThemeColor.primary.opacity(0.1) : (Color(hex: "#B7BBBF") ?? Color.gray))
				.cornerRadius(5)
		}
		.onTapGesture {
			vm.tripVehicle = vehicle
		}
	}
}

extension PickVehicleScreen {
	private var submit: some View {
		Button {
			if vm.tripVehicle != nil {
				vm.pushGoodTypePicker()
			}
		} label: {
			Text("Goods Type ?")
				.font(ThemeFont.medium(19))
				.frame(maxWidth: .infinity)
				.frame(height: 54, alignment: .center)
				.foregroundColor(Color.white)
				.background(vm.tripVehicle != nil ? ThemeColor.primary : Color.gray)
				.cornerRadius(7)
		}
		.padding(20)
	}
}

struct PickVehicleScreen_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			ThemeColor.primary
				.ignoresSafeArea()
		}
		.sheet(isPresented: .constant(true), content: {
			PickVehicleScreen()
		})
		.environmentObject(HomeViewModel())
		.previewDevice("iPhone 12")
	}
}
