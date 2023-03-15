//
//  MainCell.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-13.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    var liked: Bool = false
    
    private let burgerImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let backgroundTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Egg Top Burger"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var favouriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "SaveInactive"), for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(favouriteButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func favouriteButtonPressed() {
        print("PRESSED")
        if liked {
            favouriteButton.setBackgroundImage(UIImage(named: "SaveInactive"), for: .normal)
            liked = false
        } else {
            favouriteButton.setBackgroundImage(UIImage(named: "SaveActive"), for: .normal)
            liked = true
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
    
    func configureCell(imageName: String) {
        burgerImageView.image = UIImage(named: imageName)
    }
    
    private func setupViews() {
        contentView.addSubview(burgerImageView)
        contentView.addSubview(favouriteButton)
        contentView.addSubview(backgroundTitleView)
        contentView.addSubview(nameLabel)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            burgerImageView.topAnchor.constraint(equalTo: topAnchor,constant: 0),
            burgerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            burgerImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            burgerImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            backgroundTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundTitleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundTitleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            
            nameLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: backgroundTitleView.centerXAnchor),
            
            favouriteButton.heightAnchor.constraint(equalToConstant: 35),
            favouriteButton.widthAnchor.constraint(equalToConstant: 35),
            favouriteButton.topAnchor.constraint(equalTo: burgerImageView.topAnchor, constant: 5),
            favouriteButton.leadingAnchor.constraint(equalTo: burgerImageView.trailingAnchor,constant: -40)
            
        ])
    }
    
    
}

