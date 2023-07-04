//
//  HTTPClient.swift
//  YukaLike
//
//  Created by Renaud Cosson on 04/07/2023.
//

import Foundation

class HTTPClient {

    private let urlSession = URLSession.shared

    func get<Resource: Decodable>(_ type: Resource.Type,
                                  endpoint: Endpoint,
                                  completion: @escaping (Result<Resource, HTTPRequestError>) -> Void) {
        guard let url = URL(string: endpoint.path) else {
            completion(.failure(.invalidUrl))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        execute(request) { dataResult in
            completion(dataResult.resource(for: type))
        }
    }

    private func execute(_ request: URLRequest, completion: @escaping (Result<Data, HTTPRequestError>) -> Void) {
        urlSession.dataTask(with: request) { data, response, _ in
            guard let httpResponse = response as? HTTPURLResponse else {
                fatalError("Missing HTTPURLResponse !")
            }
            if let error = HTTPRequestErrorMapper().map(response: httpResponse) {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(.parsingError))
                return
            }
            completion(.success(data))
        }.resume()
    }
    
    func downloadImage(endpoint: Endpoint, completion: @escaping (Result<URL, HTTPRequestError>) -> Void) {
            guard let url = URL(string: endpoint.path) else {
                completion(.failure(.invalidUrl))
                return
            }
            
            let task = urlSession.downloadTask(with: url) { (location, response, error) in
                if let _ = error {
                    completion(.failure(.invalidUrl))
                } else if let location = location,
                          let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let destinationURL = documentsPath.appendingPathComponent(url.lastPathComponent)
                    do {
                        try FileManager.default.moveItem(at: location, to: destinationURL)
                        completion(.success(destinationURL))
                    } catch {
                        completion(.failure(.notFound))
                    }
                }
            }
            task.resume()
        }
}
