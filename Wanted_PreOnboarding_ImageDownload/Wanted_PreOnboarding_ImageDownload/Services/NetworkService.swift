//
//  NetworkService.swift
//  Wanted_PreOnboarding_ImageDownload
//
//  Created by 한택환 on 2023/03/02.
//

import Foundation

final class NetworkService {
    func getImage(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getImage(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                //TODO: 이미지 지정 들어갈 부분
            }
        }
    }
}
