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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchView.collectionView.delegate = self
        searchView.collectionView.dataSource = self
        searchView.searchBar.delegate = self
        setUpView()
        searchView.collectionView.isHidden = true
    }
    
    private func setUpView() {
        view.addSubview(searchView)
        searchView.collectionView.register(MainCell.self, forCellWithReuseIdentifier: "ExampleCollectionViewCell")
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func search(for searchText: String) {
        print("Searching for '\(searchText)'...")
        searchView.searchBar.text = ""
        searchView.searchLabel.isHidden = true
        searchView.collectionView.isHidden = false
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            search(for: searchText)
        }
        searchBar.resignFirstResponder()
    }
}
