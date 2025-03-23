//
//  Photo.swift
//  Swipy
//
//  Created by Umut Konmuş on 22.03.2025.
//
import Foundation

struct Photo: Codable{

    //MARK: Properties
    let id: String
    let user: User
    let urls: PhotoURLs
    
    //MARK: Methods
    func getData() -> Data {
        return Data()
    }
}
