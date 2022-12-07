//
//  UserViewModel.swift
//  QrChef
//
//  Created by apprenant1 on 07/12/2022.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var user = User.example
    let baseUrl = "http://localhost:3000/api"
    
    // MARK: USER
    func getUser() async throws -> User {
        
        guard let url = URL(string: "\(baseUrl)/user")
        else { fatalError("Couldn't not find URL") }
        print("1")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let keychainItem = KeychainItem(service: "com.Cycy.QrChef", account: "accessToken")
        urlRequest.addValue(try keychainItem.readItem(), forHTTPHeaderField: "x-access-token")
        print("2")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        print("3")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        print("fin")
        let users = try decoder.decode(User.self, from: data)
        print("Async decodedUser", users)
        return users
    }
}
