//
//  NetworkService.swift
//  Wanted_PreOnboarding_ImageDownload
//
//  Created by 한택환 on 2023/03/02.
//

import Foundation

final class NetworkService {
    func getImage(completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let index = Int.random(in: 0...10)
        guard let url = URL(string: "https://source.unsplash.com/random/\(index))") else { return }
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
