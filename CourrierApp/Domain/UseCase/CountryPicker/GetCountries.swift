import Foundation

protocol GetCountries {
	func execute() async -> Result<[CountryItem], UseCaseError>
}

struct GetCountriesUseCase: GetCountries {
	var repo: CountryItemRepository
	
	func execute() async -> Result<[CountryItem], UseCaseError> {
		do {
			
			let countries = try await repo.fetchCountries()
			return .success(countries)
			
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
