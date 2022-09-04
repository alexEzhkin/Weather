//
//  NetworkManager.swift
//  Weather
//
//  Created by Alex on 29.07.22.
//

import Foundation

class NetworkManager<T: Codable> {
    static func fetch(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(String(describing: error!))
                completion(.failure(.error(errorMassage: error!.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch let error {
                print(String(describing: error))
                completion(.failure(.decodingError(errorMassage: error.localizedDescription)))
            }
            
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(errorMassage: String)
    case decodingError(errorMassage: String)
}
