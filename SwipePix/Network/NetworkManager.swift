//
//  NetworkManager.swift
//  Swipy
//
//  Created by Umut Konmuş on 22.03.2025.
//

import Foundation

class NetworkManager: DataProvider {
    
    static let shared = NetworkManager()
    
    private func createURL(for path: String) -> URL? {
        var components = URLComponents(string: APIConfiguration.baseURL + path)
        components?.queryItems = [
            URLQueryItem(name: "client_id", value: APIConfiguration.apiKey),
            URLQueryItem(name: "count", value: "\(APIConfiguration.photoCount)")
        ]
        return components?.url
    }
    
    func fetchData<T: Codable>(path: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = createURL(for: path) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unknownError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.serverError))
                return
            }
            
            if httpResponse.statusCode >= 500 {
                completion(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
