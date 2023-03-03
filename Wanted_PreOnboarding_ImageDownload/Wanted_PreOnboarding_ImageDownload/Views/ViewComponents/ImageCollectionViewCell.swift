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
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension ImageCollectionViewCell {
    func setLayout() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        self.addSubview(loadButton)
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            loadButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            loadButton.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 120),
            loadButton.widthAnchor.constraint(equalToConstant: 70),
        ])
    }
}
