//
//  FavouriteView.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-16.
//

import UIKit

final class FavouriteView: UIView {

    let collectionView: UICollectionView = {
       let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -27),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            
        ])
    }
}
