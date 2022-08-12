import SwiftUI

struct PickGoodTypeScreen: View {
	@EnvironmentObject var vm: HomeViewModel
	
	var body: some View {
		ZStack(alignment: .bottom) {
			Color.white
				.edgesIgnoringSafeArea(.all)
			VStack(spacing: 0) {
				header
				Rectangle()
					.fill(Color(hex: "#F1F2F6") ?? Color.gray)
					.frame(maxWidth: .infinity, maxHeight: 3)
					.frame(height: 3)
				ScrollView(.vertical, showsIndicators: false) {
					if vm.showGoodsList {
						goodsList
					} else {
						selectedGood
					}
				}
				Spacer()
			}
			.onTapGesture {
				UIApplication.shared.dismissKeyboard()
			}
			buttons
				.animation(.none, value: vm.showGoodsList)
		}
	}
	
	private var header: some View {
		HStack {
			Text("Select Your Goods Type")
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

extension PickGoodTypeScreen {
	private var goodsList: some View {
		VStack(alignment: .leading, spacing: 20) {
			ForEach(vm.goodTypes.indices, id: \.self) { key in
				Text(vm.goodTypes[key])
					.font(vm.goodTypes[key] == vm.goodType ? ThemeFont.bold(14) : ThemeFont.regular(14))
					.foregroundColor(ThemeColor.text)
					.padding(.horizontal, 20)
					.frame(maxWidth: .infinity, alignment: .leading)
					.multilineTextAlignment(.leading)
					.onTapGesture {
						vm.goodType = vm.goodTypes[key]
						vm.showGoodsList = false
					}
			}
		}
		.padding(.vertical, 20)
		.padding(.bottom, 100)
	}
}

extension PickGoodTypeScreen {
	private var selectedGood: some View {
		HStack(alignment: .center, spacing: 15) {
			Text(vm.goodType)
				.foregroundColor(ThemeColor.text)
				.font(ThemeFont.regular(14))
				.frame(maxWidth: .infinity, alignment: .leading)
				.multilineTextAlignment(.leading)
			Spacer()
			Text("Change")
				.foregroundColor(ThemeColor.primary)
				.underline()
				.font(ThemeFont.medium(14))
				.onTapGesture {
					vm.showVehiclePicker = false
					withAnimation(.easeInOut) {
						vm.showGoodsList = true
					}
				}
		}
		.padding([.vertical, .leading], 20)
		.padding(.trailing, 10)
		.background(Color(hex: "#FAFAFA") ?? Color.red)
		.cornerRadius(10)
		.overlay {
			RoundedRectangle(cornerRadius: 10)
				.stroke(Color(hex: "#67729429") ?? Color.gray)
		}
		.padding(20)
	}
}

extension PickGoodTypeScreen {
	var buttons: some View {
		if vm.showGoodsList {
			return Button {
				if !vm.goodType.isEmpty {
					vm.showGoodsList = false
				}
			} label: {
				Text("Update")
					.font(ThemeFont.medium(19))
					.frame(maxWidth: .infinity)
					.frame(height: 54, alignment: .center)
					.foregroundColor(Color.white)
					.background(!vm.goodType.isEmpty ? ThemeColor.primary : Color.gray)
					.cornerRadius(7)
			}
			.padding(20)
		} else {
			return Button {
				vm.pushConfirmDetails()
			} label: {
				Text("Done")
					.font(ThemeFont.medium(19))
					.frame(maxWidth: .infinity)
					.frame(height: 54, alignment: .center)
					.foregroundColor(Color.white)
					.background(ThemeColor.primary)
					.cornerRadius(7)
			}
			.padding(20)
		}
	}
}

struct PickGoodTypeScreen_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			ThemeColor.primary
				.ignoresSafeArea()
		}
		.sheet(isPresented: .constant(true), content: {
			PickGoodTypeScreen()
		})
		.environmentObject(HomeViewModel())
		.previewDevice("iPhone 12")
	}
}
