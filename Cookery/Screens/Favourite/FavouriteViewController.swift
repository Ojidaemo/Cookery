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
    private let recipesManager = RecipesManager()
    var currentRicepsArray: [Recipe] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        favouriteView.collectionView.delegate = self
        favouriteView.collectionView.dataSource = self
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(DataStorage.favoriteRecipes.count)
        DispatchQueue.main.async {
            self.favouriteView.collectionView.reloadData()
        }
    }
    
    private func setUpView() {
        view.addSubview(favouriteView)
        favouriteView.collectionView.register(MainCell.self, forCellWithReuseIdentifier: "MainCollectionViewCell")
        NSLayoutConstraint.activate([
            favouriteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favouriteView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            favouriteView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            favouriteView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


extension FavouriteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataStorage.favoriteRecipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCell
        else {
            return UICollectionViewCell()
        }
        cell.liked = true
        let recipe = DataStorage.favoriteRecipes[indexPath.row]
        if DataStorage.favoriteRecipes.contains(recipe) {
            //cell.liked = true
            cell.favouriteButton.setBackgroundImage(UIImage(named: "SaveActive"), for: .normal)
        } else {
            //cell.liked = false
            cell.favouriteButton.setBackgroundImage(UIImage(named: "SaveInactive"), for: .normal)
        }
        cell.configureCell(recipe)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailedViewController()
        guard let selectedID = DataStorage.favoriteRecipes[indexPath.row].id else { return }
        recipesManager.detailsRequest(for: selectedID) { [weak self] recipesData in
            guard let self = self else { return }
            let recivedData = recipesData
            self.currentRicepsArray.append(recivedData)
            DispatchQueue.main.async {
                vc.detailedView.configure(self.currentRicepsArray)
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: view.frame.height / 3.64)
    }
}

