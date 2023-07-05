//
//  HTTPRequestErrorMapper.swift
//  YukaLike
//
//  Created by Renaud Cosson on 04/07/2023.
//

import Foundation

struct HTTPRequestErrorMapper {
    func map(response: HTTPURLResponse) -> HTTPRequestError? {
        let statusCode = response.statusCode
        switch statusCode {
        case 200..<300:
            return nil
        case 400:
            return .badRequest
        case 401:
            return .unauthorized
        case 404:
            return .notFound
        case 500..<600:
            return .serverError
        default:
            return .generic
        }
    }
}
