//
//  ViewController.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-13.
//

import UIKit

class MainViewController: UIViewController {
    
    private let sections = CategoriesData.shared.pageData
    private let mainView = MainView()
    private let recipesManager = RecipesManager()
    var categoriesData: [Result] = []
    var currentRecipesArray: [Recipe] = []

    let selectedCategory = "random"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        recipesManager.categoriesRequest(for: selectedCategory) { [weak self] RecipeTypesData in
            guard let self = self else { return }
            if let recievedData = RecipeTypesData.results {
                self.categoriesData.append(contentsOf: recievedData)
                DispatchQueue.main.async {
                    self.mainView.collectionView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(DataStorage.favoriteRecipes)
        DispatchQueue.main.async {
            self.mainView.collectionView.reloadData()
        }
    }
    
    private func setUpView() {
        
        view.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0)
        ])
        
        mainView.collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "PopularCollectionViewCell")
        mainView.collectionView.register(MainCell.self, forCellWithReuseIdentifier: "MainCollectionViewCell")
        mainView.collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
        mainView.collectionView.collectionViewLayout = createLayout()
    }
}

//MARK: - Create Layout

//создаем лэяут секций, созданных ниже
extension MainViewController {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .category(_):
                return self.createCategorySection()
            case .recipe(_):
                return self.createMainSection()
            }
        }
    }
    
    // функция для настройки секций
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat,
                                     supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]
    ) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        return section
    }
    
    //секци с категориями
    private func createCategorySection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.30), heightDimension: .fractionalHeight(0.85)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.15)), subitems: [item])
        group.interItemSpacing = .fixed(5)
        let section = createLayoutSection(group: group,
                                          behavior: .paging,
                                          interGroupSpacing: 0,
                                          supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: -10)
        return section
    }
    
    // нижняя секция
    private func createMainSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.33)), subitems: [item])
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 10,
                                          supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    //создаем айтем для массива supplementaryItems
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
        
    }
    
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
}

//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //определяем сколько в каждой секции айтемов
        if section == 0 {
            return sections[0].count
        } else {
            return categoriesData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // при помощи свича перебираем все категории и настраиваем ячейку
        switch sections[indexPath.section] {
            
        case .category(let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as? CategoryCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(categoryName: category[indexPath.row].title, imageName: category[indexPath.row].image)
            return cell
            
        case .recipe(_):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCell
            else {
                return UICollectionViewCell()
            }
            let recipe = categoriesData[indexPath.row]
            if DataStorage.favoriteRecipes.contains(recipe) {
                //cell.liked = true
                cell.favouriteButton.setBackgroundImage(UIImage(named: "SaveActive"), for: .normal)
            } else {
                //cell.liked = false
                cell.favouriteButton.setBackgroundImage(UIImage(named: "SaveInactive"), for: .normal)
            }

            cell.configureCell(categoriesData[indexPath.row])
            return cell
            
        }
    }
    
    // запрашиввает отображение доп обьекта
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "HeaderSupplementaryView",
                                                                         for: indexPath) as! HeaderSupplementaryView
            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let vc = DetailedViewController()
            guard let selectedID = categoriesData[indexPath.row].id else { return }
            recipesManager.detailsRequest(for: selectedID) { [weak self] recipesData in
                guard let self = self else { return }
                let recivedData = recipesData
                self.currentRecipesArray.append(recivedData)
                DispatchQueue.main.async {
                    vc.detailedView.configure(self.currentRecipesArray)
                }
            }
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            categoriesData.removeAll()
            let selectedCategory = CategoriesData().category.items[indexPath.row].title
            recipesManager.categoriesRequest(for: selectedCategory) { [weak self] RecipeTypesData in
                guard let self = self else { return }
                if let recievedData = RecipeTypesData.results {
                    self.categoriesData.append(contentsOf: recievedData)
                    DispatchQueue.main.async {
                        self.mainView.collectionView.reloadData()
                    }
                }
            }
        }
    }
}
