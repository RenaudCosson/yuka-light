//
//  APIError.swift
//  YukaLike
//
//  Created by Renaud Cosson on 10/08/2023.
//

import Foundation

public enum APIError: Error {
    case unexpectedFormat
    case loginError
    case notFound
}
