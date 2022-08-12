import SwiftUI

struct PickPointScreen: View {
	@EnvironmentObject var vm: HomeViewModel
	
	var body: some View {
		ZStack {
			ThemeColor.background
				.edgesIgnoringSafeArea(.all)
			ScrollView(.vertical, showsIndicators: false) {
				header
				searchView
				predictions
				Spacer()
			}
			.onTapGesture {
				UIApplication.shared.dismissKeyboard()
			}
		}
		.onChange(of: vm.searchValue) { _ in
			Task {
				await vm.handleSearch()
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
	
	private var searchView: some View {
		VStack(alignment: .leading, spacing: 0) {
			FullWidth()
			GeometryReader { geometry in
				HStack(alignment: .center, spacing: 0) {
					ImageIcon(
						iconName: "Target",
						contentMode: .fit,
						height: 20,
						width: 35,
						align: .center
					)
					.foregroundColor(ThemeColor.boldText)
					.padding(.leading, 10)
					.padding(.trailing, 15)
					Text(vm.currentLocation.description)
						.foregroundColor(ThemeColor.boldText)
						.font(ThemeFont.semiBold(15))
						.frame(maxWidth: .infinity, alignment: .leading)
						.multilineTextAlignment(.leading)
				}
				.frame(width: geometry.size.width, height: 62)
				.background(Color.white)
			}
			Rectangle()
				.fill(ThemeColor.borderBlue)
				.frame(height: 1)
			GeometryReader { geometry in
				HStack(alignment: .center, spacing: 0) {
					ImageIcon(
						iconName: "PinClear",
						contentMode: .fit,
						height: 20,
						width: 35,
						align: .center
					)
					.foregroundColor(Color.gray)
					.padding(.leading, 10)
					.padding(.trailing, 15)
					TextField("Select your drop point", text: $vm.searchValue)
						.font(ThemeFont.medium(16))
						.keyboardType(.default)
						.foregroundColor(ThemeColor.boldText)
						.frame(width: geometry.size.width - 125, alignment: .leading)
						.padding(.trailing, 15)
					SystemIcon(
						iconName: "plus",
						contentMode: .fit,
						color: vm.dropLocation != nil ? ThemeColor.boldText : Color.gray,
						height: 15,
						width: 15,
						align: .center
					)
					.font(vm.dropLocation != nil ? ThemeFont.bold(15) : ThemeFont.regular(15))
					.padding(.horizontal, 15)
					.onTapGesture {
						if vm.dropLocation != nil {
							vm.pushVehiclePicker()
						}
					}
				}
				.frame(width: geometry.size.width, height: 62)
				.background(Color.white)
			}
		}
		.frame(height: 124, alignment: .center)
		.background(Color.white)
		.cornerRadius(11)
		.clipped()
		.shadow(color: ThemeColor.borderBlue, radius: 19, x: 4, y: 6)
		.overlay {
			RoundedRectangle(cornerRadius: 11)
				.stroke(ThemeColor.borderBlue, lineWidth: 1)
		}
		.padding([.horizontal], 15)
	}
	
	private var predictions: some View {
		LazyVStack {
			ForEach(vm.predictions) { pred in
				predictionLine(location: pred)
			}
		}
		.padding([.horizontal, .top], 15)
	}
	
	private func predictionLine(location: LocationItem) -> some View {
		HStack(alignment: .center, spacing: 10) {
			Image(systemName: "clock")
				.foregroundColor(ThemeColor.boldText)
			VStack(alignment: .leading, spacing: 5) {
				Text(location.title)
					.font(ThemeFont.bold(16))
					.foregroundColor(ThemeColor.boldText)
				Text(location.description)
					.font(ThemeFont.regular(15))
					.foregroundColor(ThemeColor.text)
			}
			Spacer()
			Text(location.distance)
				.font(ThemeFont.semiBold(15))
				.foregroundColor(Color.gray)
		}
		.padding([.horizontal, .bottom], 15)
		.onTapGesture {
			vm.pickLocation(location)
		}
	}
}

struct PickPointScreen_Previews: PreviewProvider {
	static var previews: some View {
		PickPointScreen()
			.environmentObject(HomeViewModel())
			.previewDevice("iPhone 12")
	}
}
