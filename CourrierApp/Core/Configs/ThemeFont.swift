//
//  ThemeFont.swift
//  CourrierApp
//
//  Created by ezen on 14/07/2022.
//

import Foundation
import SwiftUI

struct ThemeFont {
	static func light(_ size: CGFloat?) -> Font {
		return  Font.custom("Montserrat-Light", size: size ?? 14)
	}
	static func lightItalic(_ size: CGFloat?) -> Font {
		return  Font.custom("Montserrat-LightItalic", size: size ?? 14)
	}
	
	static func regular(_ size: CGFloat?) -> Font {
		return  Font.custom("Montserrat-Regular", size: size ?? 14)
	}
	static func italic(_ size: CGFloat?) -> Font {
		return  Font.custom("Montserrat-Italic", size: size ?? 14)
	}
	
	static func medium(_ size: CGFloat?) -> Font {
		return  Font.custom("Montserrat-Medium", size: size ?? 14)
	}
	static func mediumItalic(_ size: CGFloat?) -> Font {
		return  Font.custom("Montserrat-MediumItalic", size: size ?? 14)
	}
	
	static func semiBold(_ size: CGFloat?) -> Font {
		return  Font.custom("Montserrat-SemiBold", size: size ?? 14)
	}
	static func semiBoldItalic(_ size: CGFloat?) -> Font {
		return  Font.custom("Montserrat-SemiBoldItalic", size: size ?? 14)
	}
	
	static func bold(_ size: CGFloat?) -> Font {
		return  Font.custom("Montserrat-Bold", size: size ?? 14)
	}
	static func boldItalic(_ size: CGFloat?) -> Font {
		return  Font.custom("Montserrat-BoldItalic", size: size ?? 14)
	}
	
	static func extraBold(_ size: CGFloat?) -> Font {
		return  Font.custom("Montserrat-ExtraBold", size: size ?? 14)
	}
	static func extraBoldItalic(_ size: CGFloat?) -> Font {
		return  Font.custom("Montserrat-ExtraBoldItalic", size: size ?? 14)
	}
}
