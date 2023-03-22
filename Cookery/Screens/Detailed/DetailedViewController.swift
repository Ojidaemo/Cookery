//
//  DetailedViewController.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-15.
//

import UIKit

class DetailedViewController: UIViewController {
    
    let detailedView = DetailedView()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(detailedView)
    }
}

extension DetailedViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            detailedView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            detailedView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            detailedView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            detailedView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -2000)
        ])
    }
}
