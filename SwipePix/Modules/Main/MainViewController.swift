//
//  ViewController.swift
//  Swipy
//
//  Created by Umut Konmuş on 22.03.2025.
//

import UIKit

protocol MainViewInterface: ViewInterface {
    func showNewPhoto(data: Data)
}

final class MainViewController: UIViewController, MainViewInterface, Storyboarded {
    
    static var storyboardName: StoryboardNames {
        .main
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var unsplashLabel: UILabel!
    @IBOutlet weak var dislikeImageView: UIImageView!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var creditStackView: UIStackView!
    var presenter: MainPresenterInterface!
    
    var originalCenter: CGPoint = .zero

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        
        likeImageView.alpha = 0
        dislikeImageView.alpha = 0
        
        originalCenter = imageView.center
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(panGesture)
    }
    
    func prepareUI() {
        imageView.image = UIImage(named: "swipepix")
        creditStackView.isHidden = true
    }
    
    
    func giveLikeFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

    func giveDislikeFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let imageView = gesture.view!
        
        switch gesture.state {
        case .changed:
            imageView.center = CGPoint(x: originalCenter.x + translation.x, y: originalCenter.y)
            
            if translation.x > 50 {
                likeImageView.alpha = min(1, translation.x / 100)
                dislikeImageView.alpha = 0
            } else if translation.x < -50 {
                dislikeImageView.alpha = min(1, -translation.x / 100)
                likeImageView.alpha = 0
            } else {
                likeImageView.alpha = 0
                dislikeImageView.alpha = 0
            }
            
        case .ended:
            if translation.x > 100 {
                giveLikeFeedback()
                animateImageViewOffScreen(direction: 1)
            } else if translation.x < -100 {
                giveDislikeFeedback()
                animateImageViewOffScreen(direction: -1)
            } else {
                resetImageViewPosition()
            }
            
            UIView.animate(withDuration: 0.3) {
                self.likeImageView.alpha = 0
                self.dislikeImageView.alpha = 0
            }
            
        default:
            break
        }
    }
    
    func animateImageViewOffScreen(direction: Int) {
        UIView.animate(withDuration: 0.3, animations: {
            self.imageView.center.x += CGFloat(direction) * self.view.frame.width
            self.imageView.alpha = 0
        }) { _ in
            self.loadNextImage()
        }
    }
    
    func resetImageViewPosition() {
        UIView.animate(withDuration: 0.3) {
            self.imageView.center = self.originalCenter
            self.imageView.transform = .identity
            self.imageView.alpha = 1
        }
    }
    
    func loadNextImage() {
        presenter.getNextPhotoData()
        creditStackView.isHidden = false
        authorLabel.text = presenter.getAuthor()
    }

    func showNewPhoto(data: Data) {
        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: data)
            
            self.imageView.center = self.originalCenter
            self.imageView.alpha = 1
        }
    }

}

