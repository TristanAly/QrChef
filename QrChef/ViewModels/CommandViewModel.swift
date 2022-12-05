//
//  CommandVIewModel.swift
//  QrChef
//
//  Created by Cynthia on 05/12/2022.
//

import SwiftUI
import SwiftUI
import CoreImage.CIFilterBuiltins
import UniformTypeIdentifiers

enum ErrorMessage: Error {
    case noData
    case decodingError
    case badURL
    case badResponse
    
    var localizedDescription: String {
        switch self {
            case .noData:
                return "No data"
            case .decodingError:
                return "Error while decoding error"
            case .badURL:
                return "Missing URL"
            case .badResponse:
                return "Bad response"
        }
    }
}

class CommandViewModel: ObservableObject {
    @Published var command = [Command.example]
    
    let baseUrl = "http://localhost:3000/api"
    
    // To GET an array with all Commands
    func getCommands(token: String) async throws -> [Command] {
        
        guard let url = URL(string: "\(baseUrl)/commands")
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
        let commands = try decoder.decode([Command].self, from: data)
        print("Async decodedUser", commands)
        return commands
    }
    
    func getCommandByID(id: Int) async throws -> Command {
        
        guard let url = URL(string: "\(baseUrl)/commands/\(id)")
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
        let commands = try decoder.decode(Command.self, from: data)
        print("Async decodedUser", commands)
        return commands
    }
}

let context = CIContext()
let filter = CIFilter.qrCodeGenerator()
func generateQRCode(from string: String) -> UIImage {
    let data = Data(string.utf8)
    filter.setValue(data, forKey: "inputMessage")

    if let outputImage = filter.outputImage {
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        }
    }

    return UIImage(systemName: "xmark.circle") ?? UIImage()
}

struct FilesDocuments: FileDocument {
    
    static var readableContentTypes: [UTType] { [.plainText] }
    
    var message: String
    
    init(message: String) {
        self.message = message
    }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        message = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: message.data(using: .utf8)!)
    }
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Command]

    init() {
        self.people = [Command.example]
    }
}

enum FilterType {
    case none
    //, contacted, uncontacted
}
