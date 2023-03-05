//
//  ImageCollectionViewCell.swift
//  Wanted_PreOnboarding_ImageDownload
//
//  Created by 한택환 on 2023/03/03.
//

import UIKit
import SnapKit

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
        button.layer.cornerRadius = 8
        return button
    }()
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.backgroundColor = .systemGray
        progressView.progressTintColor = .systemBlue
        progressView.layer.cornerRadius = 1
        progressView.progress = 0.5
        return progressView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setLoadButtonLayout()
        setImageViewLayout()
        setProgressViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension ImageCollectionViewCell {
    func setImageViewLayout() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(100)
        }
    }
    
    func setProgressViewLayout() {
        self.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.trailing.equalTo(loadButton.snp.leading)
            make.leading.equalTo(imageView.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
            
        }
    }
    
    func setLoadButtonLayout() {
        self.addSubview(loadButton)
        loadButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
    }
}
