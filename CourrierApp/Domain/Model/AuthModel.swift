import Foundation

class AuthModel: ObservableObject, Codable {
	enum CodingKeys: CodingKey {
		case id, fullName, email, phoneNumber, countryCode, status, token
	}
	
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		id = try container.decode(String.self, forKey: .id)
		fullName = try container.decode(String.self, forKey: .fullName)
		email = try container.decode(String.self, forKey: .email)
		phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
		countryCode = try container.decode(String.self, forKey: .countryCode)
		status = try container.decode(String.self, forKey: .status)
		token = try container.decode(String.self, forKey: .token)
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(fullName, forKey: .fullName)
		try container.encode(email, forKey: .email)
		try container.encode(phoneNumber, forKey: .phoneNumber)
		try container.encode(countryCode, forKey: .countryCode)
		try container.encode(status, forKey: .status)
		try container.encode(token, forKey: .token)
	}
	
	@Published var id: String = ""
	@Published var fullName: String = ""
	@Published var email: String = ""
	@Published var phoneNumber: String = ""
	@Published var countryCode: String = ""
	@Published var status: String = INACTIVE_STATUS
	@Published var token: String = ""
	
	init() {}
	
	init(
		id: String,
		fullName: String,
		email: String,
		phoneNumber: String,
		countryCode: String,
		status: String,
		token: String
	) {
		self.id = id
		self.fullName = fullName
		self.email = email
		self.phoneNumber = phoneNumber
		self.countryCode = countryCode
		self.status = status
		self.token = token
	}
	
	func setInstance(updated: AuthModel) {
		self.fullName = updated.fullName
		self.email = updated.email
		self.phoneNumber = updated.phoneNumber
		self.countryCode = updated.countryCode
		self.status = updated.status
		self.id = updated.id
		self.token = updated.token
	}
	
	func toString() -> String {
		return "id: \(self.id), fullName: \(self.fullName), email: \(self.email), phoneNumber: \(self.phoneNumber), countryCode: \(self.countryCode), status: \(self.status), token: \(token)"
	}
	
	static var INACTIVE_STATUS: String = "INACTIVE_STATUS"
	static var ACTIVE_STATUS: String = "ACTIVE_STATUS"
	static var DEFAULT = AuthModel(id: "", fullName: "", email: "", phoneNumber: "", countryCode: "", status: "", token: "")
}
