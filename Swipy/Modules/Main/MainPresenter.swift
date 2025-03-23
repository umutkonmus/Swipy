//
//  MainPresenter.swift
//  Swipy
//
//  Created by Umut Konmuş on 22.03.2025.
//

import Foundation

protocol MainPresenterInterface : PresenterInterface {
    func likePhoto()
    func dislikePhoto()
    func getNextPhotoData()
    func getAuthor() -> String
}

final class MainPresenter {
    
    private var photos: [Photo] = []
    private var index: Int = -1
    
    var router: MainRouterInterface!
    var interactor: MainInteractorInterface!
    weak var view: MainViewInterface?
    
    func likePhoto(with id: String) {
        interactor?.likePhoto(with: id)
    }
    
    func dislikePhoto(with id: String) {
        interactor?.dislikePhoto(with: id)
    }
    
    func viewDidLoad() {
        interactor.getPhotos()
        view?.prepareUI()
    }
    
}

// MARK: Presenter Interface

extension MainPresenter: MainPresenterInterface{
    func getNextPhotoData(){
        index += 1
        if index + 1 == photos.count {
            index = 0
            interactor.getPhotos()
        }
        getPhotoData(photo: photos[index])
    }
    
    func getPhotoData(photo: Photo) {
        interactor?.getPhotoData(photo: photo)
    }
    
    func getAuthor() -> String {
        return photos[index].user.username
    }
    
    func likePhoto() {
        print("like Photo")
    }
    
    func dislikePhoto() {
        print("dislike photo")
    }
}

// MARK: Interactor Output

extension MainPresenter: MainInteractorOutput{
    
    func getPhotosOnResponseRecieved(_ result: Result<[Photo], NetworkError>) {
        switch result {
        case .success(let photos):
            self.photos = photos
        case .failure(let error):
            print(error.localizedDescription)
            self.photos = []
        }
    }
    
    func getPhotoDataOnResponseRecieved(result: Result<Data, any Error>) {
        switch result {
        case .success(let data):
            view?.showNewPhoto(data: data)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}
