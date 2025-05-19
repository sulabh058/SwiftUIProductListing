//
//  MockNetworkManager.swift
//  ProductListingAppTests
//
//  Created by Sulabh Surendran on 18/05/25.
//
import Foundation
@testable import ProductListingApp

class MockNetworkManager: NetworkManager {
    var data: Data?
    var error: Error?
    func fetch(request: NetworkRequest) async throws -> Data {
        if let error {
            throw error
        }
        return data!
    }
}
