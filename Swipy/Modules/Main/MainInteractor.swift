//
//  MainInteractor.swift
//  Swipy
//
//  Created by Umut Konmuş on 22.03.2025.
//

import Foundation

protocol MainInteractorInterface {
    func getPhotos()
    func getPhotoData(photo: Photo)
    func likePhoto(with id: String)
    func dislikePhoto(with id: String)
}

protocol MainInteractorOutput: AnyObject {
    func getPhotosOnResponseRecieved(_ result: Result<[Photo], NetworkError>)
    func getPhotoDataOnResponseRecieved(result: Result<Data, Error>)
}

final class MainInteractor: MainInteractorInterface {
    
    weak var output: MainInteractorOutput?
    let dataService = PhotoDataService()
    
    func getPhotos() {
        NetworkManager.shared.fetchData(path: APIConfiguration.randomPhotoPath) { [weak self] (result: Result<[Photo], NetworkError>) in
            self?.output?.getPhotosOnResponseRecieved(result)
        }
    }
    
    func getPhotoData(photo: Photo) {
        dataService.getPhotoData(from: photo.urls.regular) { [weak self] result in
            self?.output?.getPhotoDataOnResponseRecieved(result: result)
        }
    }
    
    func likePhoto(with id: String) {
        print("like photo with id: \(id)")
    }
    
    func dislikePhoto(with id: String) {
        print("dislike photo with id: \(id)")
    }
}
