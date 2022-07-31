//
//  SystemIcon.swift
//  CourrierApp
//
//  Created by ezen on 14/07/2022.
//

import SwiftUI

struct SystemIcon: View {
	var iconName: String
	var contentMode: ContentMode
	var color: Color
	var height: CGFloat?
	var width: CGFloat?
	var align: Alignment
	
	var body: some View {
		Image(systemName: iconName)
			.resizable()
			.foregroundColor(color)
			.aspectRatio(contentMode: contentMode)
			.frame(width: width, height: height, alignment: align)
	}
}

struct SystemIcon_Previews: PreviewProvider {
	static var previews: some View {
		SystemIcon(iconName: "flag", contentMode: .fit, color: Color.blue, height: 50, width: 50, align: .center)
			.previewLayout(.sizeThatFits)
	}
}
