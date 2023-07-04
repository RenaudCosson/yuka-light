//
//  HTTPRequestError.swift
//  YukaLike
//
//  Created by Renaud Cosson on 04/07/2023.
//

import Foundation

enum HTTPRequestError: Error {
    case invalidUrl
    case parsingError
    case badRequest
    case unauthorized
    case notFound
    case serverError
    case generic
}
