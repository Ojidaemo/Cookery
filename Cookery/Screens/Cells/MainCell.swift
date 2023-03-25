//
//  MainCell.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-13.
//

import UIKit
import Kingfisher

class MainCell: UICollectionViewCell {
    
    var liked: Bool = false
    private var currentRecipe: Result?
//    var favouriteVC = FavouriteViewController()

    
    private let recipeImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 20
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
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Egg Top Burger"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var favouriteButton: UIButton = {
        let button = UIButton()
        button.tintColor = .red
        button.addTarget(self, action: #selector(favouriteButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func favouriteButtonPressed() {
        if liked {
            favouriteButton.setBackgroundImage(UIImage(named: "SaveInactive"), for: .normal)
            liked = false
            DataStorage.favoriteRecipes.removeAll{ $0 == currentRecipe }
            print("Массив избранное =", DataStorage.favoriteRecipes)
        } else {
            favouriteButton.setBackgroundImage(UIImage(named: "SaveActive"), for: .normal)
            liked = true
            DataStorage.favoriteRecipes.append(currentRecipe!)
            print("Массив избранное =", DataStorage.favoriteRecipes)
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
    
    public func configureCell(_ recipe: Result) {
        self.nameLabel.text = recipe.title
        guard let imageURL = recipe.image else { return }
        self.recipeImageView.kf.setImage(with: URL(string: imageURL))
        self.currentRecipe = recipe
    }
    
    public func configureForRandomCell(_ recipe: Recipe) {
        self.nameLabel.text = recipe.title
        let imageURL = recipe.image
        self.recipeImageView.kf.setImage(with: URL(string: imageURL))
    }
    
    private func setupViews() {
        contentView.addSubview(recipeImageView)
        contentView.addSubview(favouriteButton)
        contentView.addSubview(backgroundTitleView)
        contentView.addSubview(nameLabel)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: topAnchor,constant: 0),
            recipeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            recipeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            recipeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            backgroundTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundTitleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundTitleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            
            nameLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundTitleView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: backgroundTitleView.trailingAnchor, constant: -5),
            
            favouriteButton.heightAnchor.constraint(equalToConstant: 35),
            favouriteButton.widthAnchor.constraint(equalToConstant: 35),
            favouriteButton.topAnchor.constraint(equalTo: recipeImageView.topAnchor, constant: 5),
            favouriteButton.leadingAnchor.constraint(equalTo: recipeImageView.trailingAnchor,constant: -40)
            
        ])
    }
    
    
}

