//
//  FavouriteViewController.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-16.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    private let favouriteView = FavouriteView()
    private let sections = CategoriesData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        favouriteView.collectionView.delegate = self
        favouriteView.collectionView.dataSource = self
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(favouriteView)
        favouriteView.collectionView.register(MainCell.self, forCellWithReuseIdentifier: "ExampleCollectionViewCell")
        NSLayoutConstraint.activate([
            favouriteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favouriteView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            favouriteView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            favouriteView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


extension FavouriteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExampleCollectionViewCell", for: indexPath) as? MainCell
        else {
            return UICollectionViewCell()
        }
        cell.configureCell(imageName: "foodImage")
        cell.favouriteButton.setBackgroundImage(UIImage(named: "SaveInactive"), for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailedViewController()
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: view.frame.height / 3.64)
    }
}

