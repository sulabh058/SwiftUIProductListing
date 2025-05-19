//
//  URLSessionProtocol.swift
//  ProductListingApp
//  Created by Sulabh Surendran on 18/05/25.
//

import Foundation
protocol URLSessionProtocol {
    func asyncData(for request: URLRequest) async throws -> (Data?, URLResponse?)
}
extension URLSession: URLSessionProtocol {
    
    func asyncData(for request: URLRequest) async throws -> (Data?, URLResponse?) {
        return try await self.data(for: request)
    }
}
