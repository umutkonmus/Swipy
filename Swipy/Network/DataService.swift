//
//  DataService.swift
//  Swipy
//
//  Created by Umut Konmuş on 22.03.2025.
//

import Foundation

class PhotoDataService {
    func getPhotoData(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.data(from: urlString, completion: completion)
    }
}
