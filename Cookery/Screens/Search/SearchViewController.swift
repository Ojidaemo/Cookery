//
//  SearchViewController.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-13.
//

import UIKit

final class SearchViewController: UIViewController {
    
    private let searchView = SearchView()
    private let sections = CategoriesData.shared.pageData
    private let recipesManager = RecipesManager()
    var searchData: [Result] = []
    var currentRicepsArray: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchView.collectionView.delegate = self
        searchView.collectionView.dataSource = self
        searchView.searchBar.delegate = self
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(searchView)
        searchView.collectionView.register(MainCell.self, forCellWithReuseIdentifier: "MainCollectionViewCell")
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func search(for searchText: String) {
        recipesManager.searchRequest(for: searchText) { [weak self] RecipeTypesData in
            guard let self = self else { return }
            if let recievedData = RecipeTypesData.results {
                self.searchData.append(contentsOf: recievedData)
                DispatchQueue.main.async {
                    self.searchView.collectionView.reloadData()
                    }
                }
            }
        searchView.searchBar.text = ""
        searchView.searchLabel.isHidden = true
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCell
        else {
            return UICollectionViewCell()
        }
        cell.configureCell(searchData[indexPath.row])
        cell.favouriteButton.setBackgroundImage(UIImage(named: "SaveInactive"), for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailedViewController()
        guard let selectedID = searchData[indexPath.row].id else { return }
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

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            search(for: searchText)
        }
        searchBar.resignFirstResponder()
    }
}
