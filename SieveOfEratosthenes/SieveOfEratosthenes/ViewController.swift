import UIKit

enum AnchorValues: CGFloat {
    case collectionViewHeight = 450
    case inputNumberLabelWidth = 370
    case inputNumberLabelHeight = 93
    case calculateButtonWidth = 110
    case calculateButtonHeight = 36
    case calculateButtonTop = 150
    case inputNumberTextFieldWidth = 190
    case inputNumberTextFieldHeight = 35
    case inputNumberTextFieldTop = 100
}


class ViewController: UIViewController {
    
    private let inputNumberLabel = UILabel(frame: .zero)
    private let inputNumberTextField = UITextField(frame: .zero)
    private let calculateButton = UIButton(frame: .zero)
    private let layout = UICollectionViewFlowLayout()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        return collection
    }()
    
    private let cellId = "CollectionViewCell"

    
    
    var presenter: IPresenter!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
        calculateButton.addTarget(self, action: #selector(didTapCalculateButton(_:)), for: .touchUpInside)
        
       
    }
    
    @objc private func didTapCalculateButton(_ sender: UIButton) {
        presenter.showNumbers(upTo: inputNumberTextField.text ?? "0")
        view.endEditing(true)
        
    }

}

extension ViewController: IView {
    
    func setNumbers(_ numbers: [Int]) {
        collectionView.reloadData()
    }
    

    
    func configureView() {
        self.view.backgroundColor = .white
        let parent = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(collectionView)
        self.view.addSubview(inputNumberLabel)
        self.view.addSubview(inputNumberTextField)
        self.view.addSubview(calculateButton)
        
        
        configureCollectionView(equalTo: parent)
        configureTextFieldConstraints(equalTo: parent)
        configureLabel(equalTo: parent)
        configureButtonConstraints(equalTo: parent)
        
        inputNumberTextField.keyboardType = .numberPad
    }
    
    private func configureTextFieldConstraints(equalTo parent: UILayoutGuide) {
        inputNumberTextField.font = UIFont.systemFont(ofSize: 15)
        inputNumberTextField.borderStyle = UITextField.BorderStyle.roundedRect
        inputNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        inputNumberTextField.topAnchor.constraint(equalTo: parent.topAnchor, constant: AnchorValues.inputNumberTextFieldTop.rawValue).isActive = true
        inputNumberTextField.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        inputNumberTextField.widthAnchor.constraint(equalToConstant: AnchorValues.inputNumberTextFieldWidth.rawValue).isActive = true
        inputNumberTextField.heightAnchor.constraint(equalToConstant: AnchorValues.inputNumberTextFieldHeight.rawValue).isActive = true
    }
    
    private func configureButtonConstraints(equalTo parent: UILayoutGuide) {
        calculateButton.setTitle("Посчитать", for: calculateButton.state)
        calculateButton.setTitleColor(.blue, for: .normal)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.topAnchor.constraint(equalTo: parent.topAnchor, constant: AnchorValues.calculateButtonTop.rawValue).isActive = true
        calculateButton.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        calculateButton.widthAnchor.constraint(equalToConstant: AnchorValues.calculateButtonWidth.rawValue).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: AnchorValues.calculateButtonHeight.rawValue).isActive = true
    }
    
    private func configureCollectionView(equalTo parent: UILayoutGuide) {
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        
        collectionView.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: parent.layoutFrame.width).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: AnchorValues.collectionViewHeight.rawValue).isActive = true
        
    }
    
    private func configureLabel(equalTo parent: UILayoutGuide) {
        inputNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        inputNumberLabel.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        inputNumberLabel.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        inputNumberLabel.widthAnchor.constraint(equalToConstant: AnchorValues.inputNumberLabelWidth.rawValue).isActive = true
        inputNumberLabel.heightAnchor.constraint(equalToConstant: AnchorValues.inputNumberLabelHeight.rawValue).isActive = true
        inputNumberLabel.numberOfLines = 2
        inputNumberLabel.textAlignment = .center
        inputNumberLabel.font = UIFont(name: inputNumberLabel.font.fontName, size: 20)
        inputNumberLabel.text = "Введите число до которого будут посчитаны все простые числа"
        
    }
}


extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        
        cell.configureCell(with: UInt(presenter.numberForIndexPath(indexPath: indexPath)))

        return cell
    }

}



