//
//  URLSession.swift
//  Swipy
//
//  Created by Umut Konmuş on 22.03.2025.
//

import Foundation

extension URLSession {
    func data(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -2, userInfo: nil)))
                return
            }

            completion(.success(data))
        }.resume()
    }
}
