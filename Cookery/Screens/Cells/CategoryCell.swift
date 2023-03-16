//
//  CategoryCell.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-13.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    private let categoryImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "cloud")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 2
                layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(categoryName: String, imageName: String) {
        categoryLabel.text = categoryName
        categoryImageView.image = UIImage(named: imageName)
    }
    

    
    private func setupViews() {
        layer.cornerRadius = 10
        addSubview(categoryLabel)
        addSubview(categoryImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            categoryLabel.heightAnchor.constraint(equalToConstant: 16),
            
            
            categoryImageView.topAnchor.constraint(equalTo: topAnchor,constant: 0),
            categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            categoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            categoryImageView.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: 0)
        ])
    }
}
