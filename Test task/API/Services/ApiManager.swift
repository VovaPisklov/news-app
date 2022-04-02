//
//  ApiManager.swift
//  Test task
//
//  Created by Vova on 31.03.2022.
//

import Foundation

class NetworkManager {
    
    // MARK: - Public properties
    static let shared = NetworkManager()
    
    // MARK: - Private properties
    private let urlAdress = "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/main.json"
    
    private init() {}
}

// MARK: - Extension
extension NetworkManager {
    func fetchData(completion: @escaping (News?) -> Void) {
        guard let url = URL(string: urlAdress) else { return }
        
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
}






