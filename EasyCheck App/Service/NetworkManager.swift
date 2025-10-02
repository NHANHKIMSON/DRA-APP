//
//  NetworkManager.swift
//  EasyCheck App
//
//  Created by Apple on 10/1/25.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchUsers(completion: @escaping (Result<[User], AFError>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/users"
        AF.request(url)
            .validate()
            .responseDecodable(of: [User].self) { response in
                completion(response.result)
            }
    }
}
