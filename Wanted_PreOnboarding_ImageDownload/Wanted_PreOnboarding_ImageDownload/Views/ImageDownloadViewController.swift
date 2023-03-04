//
//  ViewController.swift
//  Wanted_PreOnboarding_ImageDownload
//
//  Created by 한택환 on 2023/03/02.
//

import UIKit

final class ImageDownloadViewController: UIViewController {
    
    private var imagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20 * 2, height: 80)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var imageSet: [UIImage?] = Array(repeating: UIImage(systemName: "photo"), count: 5) {
        didSet {
            imagesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configure()
        setLayout()
        // Do any additional setup after loading the view.
    }
}

extension ImageDownloadViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        
        cell.loadButton.tag = indexPath.item
        cell.imageView.image = imageSet[indexPath.item]
        return cell
    }
}

private extension ImageDownloadViewController {
    func setLayout() {
        self.view.addSubview(imagesCollectionView)
        NSLayoutConstraint.activate([
            imagesCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imagesCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            imagesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imagesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func configure() {
        imagesCollectionView.dataSource = self
    }
}
