//
//  FavouriteViewModel.swift
//  QrChef
//
//  Created by Cynthia on 06/12/2022.
//

import Foundation

class FavouriteViewModel: ObservableObject {
    @Published var favourites = [Favourite.example]
    @Published var favourite = Favourite.example
    
    let baseUrl = "http://localhost:3000/api"
    
    // To GET an array with all Commands
    func getFavourites(token: String) async throws -> [Favourite] {
        
        guard let url = URL(string: "\(baseUrl)/favourite")
        else {
            throw ErrorMessage.badURL
        }
        print("1")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue(token, forHTTPHeaderField: "x-access-token")
        
        print("2")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ErrorMessage.noData
        }
        print("3")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        print("fin")
        let favourites = try decoder.decode([Favourite].self, from: data)
        print("Async decodedUser", favourites)
        
        return favourites
    }
    
    func getFavouriteByID(id: Int) async throws -> Favourite {
        
        guard let url = URL(string: "\(baseUrl)/favourite/\(id)")
        else {
            throw ErrorMessage.badURL
        }
        print("1")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        print("2")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ErrorMessage.noData
        }
        print("3")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        print("fin")
        let favourites = try decoder.decode(Favourite.self, from: data)
        print("Async decodedUser", favourites)
        return favourites
    }
    
    // MARK: Post all Commands
    func PostFavourite(token: String, restaurantId: Int) async throws -> Favourite {
        guard let url = URL(string: "\(baseUrl)/favourite")
        else {
            fatalError("Missing URL")
        }
        let body: [String: Int] = ["restaurantId": restaurantId]
        print("2")
        // ENVOI DE LA REQUETE SUR LE SERVER
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue(token, forHTTPHeaderField: "x-acesss-token")
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            throw ErrorMessage.badResponse
        }
        
        let decoder = JSONDecoder()
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let favourite = try decoder.decode(Favourite.self, from: data)
            print("success created: (message)")
            return favourite
        } catch {
            throw URLError(.badServerResponse)
        }
    }
    func DeleteFavourite(token: String, id: Int) async throws -> Favourite {
        guard let url = URL(string: "\(baseUrl)/favourite/\(id)")
        else {
            fatalError("Missing URL")
        }
        print("2")
        // ENVOI DE LA REQUETE SUR LE SERVER
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue(token, forHTTPHeaderField: "x-acesss-token")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            throw ErrorMessage.badResponse
        }
        
        let decoder = JSONDecoder()
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let favourite = try decoder.decode(Favourite.self, from: data)
            print("success created: (message)")
            return favourite
        } catch {
            throw URLError(.badServerResponse)
        }
    }
}
