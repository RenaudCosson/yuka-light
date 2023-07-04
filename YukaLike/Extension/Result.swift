//
//  Result.swift
//  YukaLike
//
//  Created by Renaud Cosson on 04/07/2023.
//

import Foundation

extension Result where Success == Data, Failure == HTTPRequestError {
    func resource<Resource: Decodable>(for type: Resource.Type) -> Result<Resource, HTTPRequestError> {
        return self
            .flatMap({
                do {
                    let resource: Resource = try JSONDecoder().decode(type, from: $0)
                    return .success(resource)
                } catch {
                    return .failure(.parsingError)
                }
            })
    }
}
