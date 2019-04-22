import Foundation

protocol  IPresenter {
    init(view: IView)
    func didLoad()
    func numberOfRowsInSection() -> Int
    func showNumbers(upTo num: String)
    func numberForIndexPath(indexPath: IndexPath) -> Int
}

class Presenter: IPresenter {
  
    weak var view: IView?
    
    private let model = SieveOfEratosthenes()
    private var numbers: [Int] = []
    
    required init(view: IView) {
        self.view = view
    }
    
    func didLoad() {
        view?.configureView()
    }
    
    func showNumbers(upTo num: String) {
        numbers = model.primeNumbers(upTo: Int(num) ?? 0)
        view?.setNumbers(numbers)
    }
    
    func numberOfRowsInSection() -> Int {
        return numbers.count
    }
    
    func numberForIndexPath(indexPath: IndexPath) -> Int {
        return numbers[indexPath.row]
    }
    
}
