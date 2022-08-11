import Foundation

protocol SearchPlaces {
	func execute(_ search: String) async -> Result<[LocationItem], UseCaseError>
}

struct SearchPlacesUseCase: SearchPlaces {
	var repo: LocationItemRepository
	
	func execute(_ search: String) async -> Result<[LocationItem], UseCaseError> {
		do {
			
			let places = try await repo.searchPlaces(search: search)
			
			return .success(places)
			
		} catch {
			switch(error) {
				
			case APIServiceError.DECODING_ERROR:
				return .failure(.DECODING_ERROR)
				
			default:
				return .failure(.NETWORK_ERROR)
				
			}
		}
	}
}
