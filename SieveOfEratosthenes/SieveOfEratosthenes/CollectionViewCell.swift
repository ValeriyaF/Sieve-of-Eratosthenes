import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    var cellLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with number: UInt) {
        cellLabel.text = String(number)
    }

    
    private func configureSubviews() {
        
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 5
        
    
        self.addSubview(cellLabel)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cellLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        cellLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
}
