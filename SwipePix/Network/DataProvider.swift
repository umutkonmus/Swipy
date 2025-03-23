//
//  DataProvider.swift
//  Swipy
//
//  Created by Umut Konmuş on 22.03.2025.
//

import Foundation

protocol DataProvider {
    func fetchData<T: Codable>(path: String, completion: @escaping (Result<T, NetworkError>) -> Void)
}
