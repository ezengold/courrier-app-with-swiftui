import SwiftUI

struct OtpField: View {
	@State var otpCode: String = ""
	
	@State var isDisabled: Bool = false
	
	var length: Int = 5
	
	var spacing: CGFloat = 10
	
	var cellWidth: CGFloat = 50
	
	var maxWidth: CGFloat = 5 * 50 + 6 * 10 {
		didSet {
			let estimatedWidth = ((maxWidth - (spacing * CGFloat(length + 1))) / CGFloat(length))
			cellWidth = estimatedWidth > 50.0 ? 50.0 : estimatedWidth
		}
	}
	
	var onChange: (String, (Bool) -> Void) -> Void
	
	var body: some View {
		VStack {
			ZStack {
				LettersList
				HiddenField
			}
		}
	}
	
	private var LettersList: some View {
		HStack(spacing: spacing) {
			ForEach (0 ..< length, id: \.self) { index in
				ZStack {
					Text(otpCode.chartAt(at: index))
						.foregroundColor(Color.white)
						.multilineTextAlignment(.center)
						.font(ThemeFont.medium(18))
						.frame(width: cellWidth, height: 50, alignment: .center)
						.background(index < otpCode.count ? ThemeColor.primary : Color.white)
						.cornerRadius(10)
						.overlay() {
							if (index + 1) > otpCode.count {
								RoundedRectangle(cornerRadius: 11)
									.stroke(Color.gray, lineWidth: 1)
							}
						}
				}
			}
		}
		.frame(alignment: .center)
		.frame(maxWidth: .infinity, maxHeight: 80.0)
	}
	
	private var HiddenField: some View {
		let boundPin = Binding<String>(
			get: { self.otpCode },
			set: { newValue in
				self.otpCode = newValue
				self.handleSubmit()
			}
		)
		
		return TextField(
			"",
			text: boundPin,
			onCommit: handleSubmit
		)
		.keyboardType(.numberPad)
		.foregroundColor(.clear)
		.accentColor(.clear)
	}
	
	private func handleSubmit() {
		guard !otpCode.isEmpty else {
			return
		}
		
		if otpCode.count == length {
			isDisabled = true
			
			onChange(otpCode) { isSuccess in
				if !isSuccess {
					otpCode = ""
					isDisabled = false
				}
			}
		}
		
		if otpCode.count > length {
			otpCode = String(otpCode.prefix(length))
			handleSubmit()
		}
	}
}

struct OtpField_Previews: PreviewProvider {
	static var previews: some View {
		OtpField(onChange: {_,_ in })
			.previewLayout(.sizeThatFits)
			.preferredColorScheme(.light)
			.previewDevice("iPhone 12")
	}
}
