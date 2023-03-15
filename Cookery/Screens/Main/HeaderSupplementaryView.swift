//
//  HeaderSupplementaryViewCollectionReusableView.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-14.
//

import UIKit

class HeaderSupplementaryView: UICollectionReusableView {
    
    private let headerLabel: UILabel = {
       let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(headerLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(categoryName: String) {
        headerLabel.text = categoryName
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
    
        ])
    }
    
}
