//
//  ApiManager.swift
//  Test task
//
//  Created by Vova on 31.03.2022.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
}

// MARK: - Extension
extension NetworkManager {
    func fetchDataNews(url: String, completion: @escaping (News?) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Description not found")
                return
            }
            do {
                let miniPost = try JSONDecoder().decode(News.self, from: data)
                DispatchQueue.main.async {
                    completion(miniPost)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchDataPost(url: String, completion: @escaping (Post?) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Description not found")
                return
            }
            do {
                let PostClass = try JSONDecoder().decode(Post.self, from: data)
                DispatchQueue.main.async {
                    completion(PostClass)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
