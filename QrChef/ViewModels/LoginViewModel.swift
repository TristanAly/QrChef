//
//  LoginViewModel.swift
//  QrChef
//
//  Created by apprenant1 on 04/12/2022.
//

import Foundation

enum Page {
    case page1
    case page2
    case page3
}

class LoginViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var username = "User1"
    @Published var email = ""
    @Published var password = "User1"
    @Published var signin: SignInResponse?
    @Published var show: Bool = false
    @Published var showAlert: Bool = false
    @Published var invalidAttempts = 0
    @Published var newPage: Page = .page2
    @Published var showSheet: Bool = false
   
    
    
    let baseUrl = "http://localhost:3000"
    //MARK: SignUP
    func signUp(userName: String, email: String, password: String) async throws -> User {
        
        
        guard let url = URL(string: "\(baseUrl)/api/auth/signup")
        else {
            fatalError("Missing URL")
        }
        
        let body: [String : String] = ["username": userName ,"email" : email ,"password" : password]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONEncoder().encode(body)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let user = try decoder.decode(User.self, from: data)
        
        print("success user created: \(user)")
        
        return user
        
        
    }
    
    //MARK: SignIn
    func signIn(username: String, password: String ) async throws -> (SignInResponse?) {
        guard let url = URL(string: "\(baseUrl)/api/auth/signin")
        else {
            fatalError("Missing URL")
        }
        
        // CREATION DES PARAMETRES DE LA REQUÊTE
        let body: [String: String] = ["username" : username,
                                      "password" : password]
        print("2")
        // ENVOI DE LA REQUETE SUR LE SERVER
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONEncoder().encode(body)
        print("3")
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            print("4")
            let response = try decoder.decode(SignInResponse?.self, from: data)
            
//                        DispatchQueue.main.async {
//                            self.verifyToken(token: response!.accessToken,username: response!.username)
//                        }
            
            print("success \(String(describing: response))")
            let keychainItem = KeychainItem(service: "com.Cycy.QrChef", account: "accessToken")
            try keychainItem.saveItem(response!.accessToken)
            
            return response
//                    } catch {
//                        DispatchQueue.main.async {
//                            self.show = false
//                        }
//                    }
//                    return signin ?? nil
        }
        
        //MARK: VerifyToken
//            func verifyToken(token: String, username: String) {
//                if token != Optional(nilLiteral: ()) && username == username {
//                    self.show = true
//                    print("view Message")
//                }
//            }
    }
}
