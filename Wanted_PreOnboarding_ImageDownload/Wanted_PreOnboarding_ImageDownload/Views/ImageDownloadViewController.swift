//
//  ViewController.swift
//  Wanted_PreOnboarding_ImageDownload
//
//  Created by 한택환 on 2023/03/02.
//

import UIKit
import SnapKit

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
        return collectionView
    }()
    
    var imageSet: [UIImage?] = Array(repeating: UIImage(systemName: "photo"), count: 5) {
        didSet {
            imagesCollectionView.reloadData()
        }
    }
    
    let loadAllButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Load All Images", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    func downloadImage(_ index: Int) {
        NetworkService().getImage() { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.imageSet[index] = UIImage(data: data)
            }
        }
    }
    
    @objc func loadButtonPressed(_ sender: UIButton) {
        if imageSet[sender.tag] == UIImage(systemName: "photo") {
            downloadImage(sender.tag)
        }
        else { imageSet[sender.tag] =  UIImage(systemName: "photo")  }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configure()
        setLayout()
    }
}

extension ImageDownloadViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        
        cell.loadButton.tag = indexPath.item
        cell.loadButton.addTarget(self, action: #selector(loadButtonPressed), for: .touchUpInside)
        cell.imageView.image = imageSet[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20 * 2, height: 100)
    }
}

private extension ImageDownloadViewController {
    func setLayout() {
        self.view.addSubview(imagesCollectionView)
        imagesCollectionView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-200)
        }
        
        self.view.addSubview(loadAllButton)
        loadAllButton.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width - 20 * 2)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(imagesCollectionView.snp.bottom).offset(30)
        }
    }
    
    func configure() {
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
    }
}
