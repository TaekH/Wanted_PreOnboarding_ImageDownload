//
//  ImageCollectionViewCell.swift
//  Wanted_PreOnboarding_ImageDownload
//
//  Created by 한택환 on 2023/03/03.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    let imageView = UIImageView()
    
    let loadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Load", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setLoadButtonLayout()
        setImageViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension ImageCollectionViewCell {
    func setImageViewLayout() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    
    func setLoadButtonLayout() {
        self.addSubview(loadButton)
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            loadButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            loadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            loadButton.heightAnchor.constraint(equalToConstant: 20),
            loadButton.widthAnchor.constraint(equalToConstant: 70),
            
        ])
    }
}
