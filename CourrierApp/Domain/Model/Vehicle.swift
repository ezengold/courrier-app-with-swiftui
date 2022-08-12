import Foundation

enum Vehicle: Identifiable {
	case lorry, pickup, truck, van
	
	var id: String {
		UUID().uuidString
	}
	
	var slug: String {
		switch self {
		case .lorry:
			return "LORRY"
		case .pickup:
			return "PICKUP"
		case .truck:
			return "TRUCK"
		case .van:
			return "VAN"
		}
	}
	
	var name: String {
		switch self {
		case .lorry:
			return "Lorry Car"
		case .pickup:
			return "Pickup Truck"
		case .truck:
			return "Large Truck"
		case .van:
			return "Van Car"
		}
	}
	
	var icon: String {
		switch self {
		case .lorry:
			return "Lorry"
		case .pickup:
			return "Pickup"
		case .truck:
			return "TruckVehicle"
		case .van:
			return "Van"
		}
	}
	
	var price: Float {
		switch self {
		case .lorry:
			return 180.0
		case .pickup:
			return 100.0
		case .truck:
			return 130.0
		case .van:
			return 165.0
		}
	}
	
	var currency: String { "INR" }
}
