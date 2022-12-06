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
    @Published var responseFavourite = ResponseFavourite(id: 1, userId: 1, restaurantId: 1)
    
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
    func PostFavourite(restaurantId: Int) async throws -> Favourite {
        //url
        print("1")
        guard let url = URL(string: "\(baseUrl)/favourite")
        else {
            fatalError("Missing URL")
        }
        //create req
        print("2")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        //add http body+headers
        let body: [String: Int] = ["restaurantId": restaurantId]
        let keychainItem = KeychainItem(service: "com.Cycy.QrChef", account: "accessToken")
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue(try keychainItem.readItem(), forHTTPHeaderField: "x-access-token")
//        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        print(keychainItem)
//        //encode
        urlRequest.httpBody = try? JSONEncoder().encode(body)
        //launch ses
        print(3)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        //decoder config
        print(data.description)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do{
            print("4")
            //decode
            let favorite = try decoder.decode(Favourite.self, from: data)
        print("success created: \(favorite)")
            //return swift
            print("6")
            return favorite
        } catch {
            print("5")
            throw URLError(.badServerResponse)
        }
    }
    func updateFavorite(token: String, id: Int, islike: Bool) async throws -> Favourite {
        //url
        guard let url = URL(string: "\(baseUrl)/favourite/\(id)")
        else {throw ErrorMessage.badURL}
        //create req
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        //add http body+headers
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue(token, forHTTPHeaderField: "x-acesss-token")
        //add params
        let params: [String: Any] = [ "islike": islike,
            "restaurantId": id
        ]
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        //open sess
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        //res
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            throw ErrorMessage.badResponse
        }
        //decode res
        let jsonDecoder = JSONDecoder()
//        do {
            let decoded = try jsonDecoder.decode(Favourite.self, from: data)
            //get res in swift
        print("success updated: \(decoded)")
            return decoded
//        } catch {
//            throw ErrorMessage.decodingError
//        }
    }
//    func PostFavourite(token: String, restaurantId: Int) async throws -> Favourite {
//        guard let url = URL(string: "\(baseUrl)/favourite")
//        else {
//            fatalError("Missing URL")
//        }
//        let body: [String: Int] = ["restaurantId": restaurantId]
//        print("post")
//        // ENVOI DE LA REQUETE SUR LE SERVER
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
//        urlRequest.addValue(token, forHTTPHeaderField: "x-acesss-token")
//        urlRequest.httpBody = try? JSONEncoder().encode(body)
//        let (data, response) = try await URLSession.shared.data(for: urlRequest)
//        print("post 2")
//        guard (response as? HTTPURLResponse)?.statusCode == 200
//        else {
//            throw ErrorMessage.badResponse
//        }
//        print("post 3")
//        let decoder = JSONDecoder()
//        do {
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            let favourite = try decoder.decode(Favourite.self, from: data)
//            print("success created: (message)")
//            return favourite
//        } catch {
//            throw URLError(.badServerResponse)
//        }
//    }
    func DeleteFavourite(token: String, id: Int) async throws -> Favourite {
        guard let url = URL(string: "\(baseUrl)/favourite/\(id)")
        else {
            fatalError("Missing URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"

        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        urlRequest.addValue(token, forHTTPHeaderField: "x-acesss-token")

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let favorite = try decoder.decode(Favourite.self, from: data)

        print("success deleted: \(favorite)")
        return favorite
    }
//    func DeleteFavourite(token: String, id: Int) async throws -> Favourite {
//        guard let url = URL(string: "\(baseUrl)/favourite/\(id)")
//        else {
//            fatalError("Missing URL")
//        }
//        print("2")
//        // ENVOI DE LA REQUETE SUR LE SERVER
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "DELETE"
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
//        urlRequest.addValue(token, forHTTPHeaderField: "x-acesss-token")
//        let (data, response) = try await URLSession.shared.data(for: urlRequest)
//
//        guard (response as? HTTPURLResponse)?.statusCode == 200
//        else {
//            throw ErrorMessage.badResponse
//        }
//
//        let decoder = JSONDecoder()
//        do {
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            let favourite = try decoder.decode(Favourite.self, from: data)
//            print("success created: (message)")
//            return favourite
//        } catch {
//            throw URLError(.badServerResponse)
//        }
//    }
}
