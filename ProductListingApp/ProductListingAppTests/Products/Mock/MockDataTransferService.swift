//
//  MockDataTransferService.swift
//  ProductListingAppTests
//
//  Created by Sajib Ghosh on 25/02/24.
//

import Foundation
@testable import ProductListingApp

final class MockDataTransferService: DataTransferService {
    
    var response: Decodable?
    var error: Error?
    
    func request<T>(request: NetworkRequest) async throws -> T where T : Decodable {
        if let error {
            throw error
        }
        return response as! T
    }
}
