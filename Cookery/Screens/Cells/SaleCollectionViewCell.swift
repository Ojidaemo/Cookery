//
//  SaleCollectionViewCell.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-13.
//

import UIKit

class SaleCollectionViewCell: UICollectionViewCell {
    
    private let saleImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(imageName: String) {
        saleImageView.image = UIImage(named: imageName)
    }
    
    
    private func setupViews() {
        addSubview(saleImageView)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            saleImageView.topAnchor.constraint(equalTo: topAnchor,constant: 0),
            saleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            saleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            saleImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
