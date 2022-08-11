import Foundation
import SwiftUI

enum TabBarItem: Hashable {
	case home, bookings, profile
	
	var title: String {
		switch self {
		case .home: return "Book now"
		case .bookings: return "My Booking"
		case .profile: return "Settings"
		}
	}
	
	var icon: String {
		switch self {
		case .home: return "HomeTab"
		case .bookings: return "BookingTab"
		case .profile: return "SettingsTab"
		}
	}
	
	var color: Color {
		switch self {
		case .home: return ThemeColor.primary
		case .bookings: return ThemeColor.primary
		case .profile: return ThemeColor.primary
		}
	}
}

