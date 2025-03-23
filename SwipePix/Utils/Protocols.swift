import UIKit

protocol PresenterInterface{
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    func viewWillEnterForeground()
    func viewDidLayoutSubviews()
}

extension PresenterInterface {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
    func viewWillEnterForeground() {}
    func viewDidLayoutSubviews() {}
}

protocol ViewInterface : AnyObject {
    func prepareUI()
}

protocol RouterInterface {
    var navigationController : UINavigationController? { get }
}
