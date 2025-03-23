//
//  Photo.swift
//  Swipy
//
//  Created by Umut Konmuş on 22.03.2025.
//
import Foundation

struct Photo: Codable{

    let id: String
    let user: User
    let urls: PhotoURLs
}

struct User: Codable {
    let username: String
}

struct PhotoURLs: Codable {
    let regular: String
}
