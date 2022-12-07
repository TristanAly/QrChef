//
//  UserViewModel.swift
//  QrChef
//
//  Created by apprenant1 on 07/12/2022.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var user = [User]()
    let baseUrl = "http://localhost:3000/api"
    
    // MARK: USER
    func getUser() async throws -> [User] {
        
        guard let url = URL(string: "\(baseUrl)/user") else {
            throw ErrorMessage.badURL
        }
        print("1")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let keychainItem = KeychainItem(service: "com.Cycy.QrChef", account: "accessToken")
        urlRequest.addValue(try keychainItem.readItem(), forHTTPHeaderField: "x-access-token")
        print(keychainItem)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        print(response)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ErrorMessage.noData
        }
        print("3")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        print("fin")
        let users = try decoder.decode([User].self, from: data)
        print("Async decodedUser", users)
        return users
    }
    func getUserById(id: Int) async throws -> [User] {
        
        guard let url = URL(string: "\(baseUrl)/user/\(id)") else {
            throw ErrorMessage.badURL
        }
        print("1")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let keychainItem = KeychainItem(service: "com.Cycy.QrChef", account: "accessToken")
        urlRequest.addValue(try keychainItem.readItem(), forHTTPHeaderField: "x-access-token")
        print(keychainItem)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        print(response)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ErrorMessage.noData
        }
        print("3")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        print("fin")
        let users = try decoder.decode([User].self, from: data)
        print("Async decodedUser", users)
        return users
    }
}
