import Foundation

protocol IView: AnyObject {
    func setNumbers(_ numbers: [Int])
    func configureView()
}
