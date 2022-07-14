//
//  Checkbox.swift
//  CourrierApp
//
//  Created by ezen on 14/07/2022.
//

import SwiftUI

struct Checkbox: View {
	var checked: Bool
	var color: Color?
	var size: CGFloat?
	var onChange: (_ checked: Bool) -> Void
	
	var body: some View {
		Button {
			onChange(!checked)
		} label: {
			SystemIcon(
				iconName: "checkmark",
				contentMode: .fit,
				color: checked ? Color.white : (self.color ?? ThemeColor.primary),
				height: (size ?? 15) * 0.5,
				width: (size ?? 15) * 0.5,
				align: .center
			)
		}
		.frame(width: (size ?? 15), height: (size ?? 15))
		.background(checked ? (color ?? ThemeColor.primary) : Color.clear)
		.overlay {
			RoundedRectangle(cornerRadius: 3)
				.stroke((color ?? ThemeColor.primary), lineWidth: 1)
		}
	}
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
		Checkbox(checked: false, onChange: { checked in
			print("Clicked")
		})
    }
}
