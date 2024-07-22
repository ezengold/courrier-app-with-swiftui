import SwiftUI

struct BillingScreen: View {
	@StateObject var vm: ConfirmDetailsViewModel
	
	@Environment(\.presentationMode) var presentationMode
	
	var body: some View {
		ZStack {
			ThemeColor.background
				.ignoresSafeArea()
			VStack(spacing: 0) {
				Heading(title: "Billing Details") {
					presentationMode.wrappedValue.dismiss()
				}
				Rectangle()
					.fill(Color(hex: "#F1F2F6") ?? Color.gray)
					.frame(maxWidth: .infinity, maxHeight: 3)
					.frame(height: 3)
				ScrollView(.vertical, showsIndicators: false) {
					VStack(spacing: 0) {
						locations
							.padding(.horizontal, 15)
						Spacer()
							.frame(height: 30)
						Rectangle()
							.fill(Color(hex: "#F1F2F6") ?? Color.gray)
							.frame(maxWidth: .infinity, maxHeight: 3)
							.frame(height: 3)
						applyCoupon
						Rectangle()
							.fill(Color(hex: "#F1F2F6") ?? Color.gray)
							.frame(maxWidth: .infinity, maxHeight: 3)
							.frame(height: 3)
						billingDetails
						Rectangle()
							.fill(Color(hex: "#F1F2F6") ?? Color.gray)
							.frame(maxWidth: .infinity, maxHeight: 3)
							.frame(height: 3)
						payments
						submit
							.padding(.horizontal, 20)
							.padding(.top, 30)
						Spacer()
					}
					.padding(.bottom, 100)
					.padding(.top, 15)
				}
			}
			.navigationBarHidden(true)
		}
	}
}

extension BillingScreen {
	private var locations: some View {
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
					Text(vm.details.startLocation.description)
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
					.foregroundColor(ThemeColor.boldText)
					.padding(.leading, 10)
					.padding(.trailing, 15)
					Text(vm.details.dropLocation.description)
						.foregroundColor(ThemeColor.boldText)
						.font(ThemeFont.semiBold(15))
						.frame(maxWidth: .infinity, alignment: .leading)
						.multilineTextAlignment(.leading)
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
	}
}

extension BillingScreen {
	private var applyCoupon: some View {
		Button {
			//
		} label: {
			HStack(alignment: .center, spacing: 0) {
				ImageIcon(
					iconName: "Coupon",
					contentMode: .fit,
					height: 25,
					width: 25,
					align: .center
				)
				.foregroundColor(ThemeColor.boldText)
				Text("APPLY COUPON")
					.foregroundColor(ThemeColor.boldText)
					.font(ThemeFont.semiBold(15))
					.frame(maxWidth: .infinity, alignment: .leading)
					.multilineTextAlignment(.leading)
					.padding(.leading, 15)
				Spacer()
				SystemIcon(
					iconName: "chevron.right",
					contentMode: .fit,
					color: ThemeColor.boldText,
					height: 15,
					width: 15,
					align: .center
				)
			}
			.padding(15)
		}
		
	}
}

extension BillingScreen {
	private var billingDetails: some View {
		VStack(alignment: .leading, spacing: 0) {
			Text("Bill Details")
				.foregroundColor(ThemeColor.text)
				.font(ThemeFont.medium(15))
				.frame(maxWidth: .infinity, alignment: .leading)
				.multilineTextAlignment(.leading)
			Spacer().frame(height: 20)
			HStack(alignment: .center, spacing: 0) {
				Text("Item Total")
					.foregroundColor(ThemeColor.text)
					.font(ThemeFont.regular(14))
					.multilineTextAlignment(.leading)
				Spacer()
				Text("₹350.12")
					.foregroundColor(Color.black)
					.font(ThemeFont.bold(15))
			}
			.frame(maxWidth: .infinity)
			Spacer().frame(height: 15)
			HStack(alignment: .center, spacing: 0) {
				Text("Promo Code")
					.foregroundColor(ThemeColor.text)
					.font(ThemeFont.regular(14))
					.multilineTextAlignment(.leading)
				Spacer()
				Text("₹15.00")
					.foregroundColor(Color.black)
					.font(ThemeFont.bold(15))
			}
			.frame(maxWidth: .infinity)
			Spacer().frame(height: 20)
			Divider()
			Spacer().frame(height: 20)
			HStack(alignment: .center, spacing: 0) {
				Text("Grand Total")
					.foregroundColor(Color.black)
					.font(ThemeFont.bold(14))
					.multilineTextAlignment(.leading)
				Spacer()
				Text("₹335.12")
					.foregroundColor(Color.black)
					.font(ThemeFont.bold(15))
			}
			.frame(maxWidth: .infinity)
		}
		.padding(20)
		.background(Color.white)
	}
}

extension BillingScreen {
	private var payments: some View {
		HStack(alignment: .center, spacing: 0) {
			ImageIcon(
				iconName: "Money",
				contentMode: .fit,
				height: 25,
				width: 35,
				align: .center
			)
			.foregroundColor(Color(hex: "#A4B0BE") ?? ThemeColor.boldText)
			VStack(alignment: .leading, spacing: 5) {
				Text("Payment Method")
					.foregroundColor(Color(hex: "#A4B0BE") ?? ThemeColor.text)
					.font(ThemeFont.regular(14))
				Text("online")
					.foregroundColor(Color.black)
					.font(ThemeFont.semiBold(15))
			}
			.padding(.leading, 20)
			.frame(maxWidth: .infinity, alignment: .leading)
		}
		.frame(maxWidth: .infinity)
		.padding(.horizontal, 20)
		.padding(.vertical, 10)
		.background(Color.white)
	}
}

extension BillingScreen {
	var submit: some View {
		Button {
			vm.handlePay()
		} label: {
			Text("Pay")
				.font(ThemeFont.medium(19))
				.frame(maxWidth: .infinity)
				.frame(height: 54, alignment: .center)
				.foregroundColor(Color.white)
				.background(
					RoundedRectangle(cornerRadius: 7)
						.fill(ThemeColor.primary)
						.shadow(color: ThemeColor.buttonShadow, radius: 10, x: -5, y: 5)
				)
		}
	}
}

struct BillingScreen_Previews: PreviewProvider {
	static var previews: some View {
		BillingScreen(vm: ConfirmDetailsViewModel(details: .DEFAULT))
			.previewDevice("iPhone 12")
	}
}
