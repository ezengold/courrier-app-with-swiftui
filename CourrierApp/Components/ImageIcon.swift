//
//  ImageIcon.swift
//  CourrierApp
//
//  Created by ezen on 14/07/2022.
//

import SwiftUI

struct ImageIcon: View {
	var iconName: String
	var contentMode: ContentMode
	var height: CGFloat?
	var width: CGFloat?
	var align: Alignment
	
	var body: some View {
		Image(iconName)
			.resizable()
			.aspectRatio(contentMode: contentMode)
			.frame(width: width, height: height, alignment: align)
	}
}

struct ImageIcon_Previews: PreviewProvider {
	static var previews: some View {
		ImageIcon(iconName: "Logo", contentMode: .fit, height: 50, width: 50, align: .center)
			.previewLayout(.sizeThatFits)
	}
}
