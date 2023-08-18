//
//  SearchNetworkRepository.swift
//  YukaLike
//
//  Created by Renaud Cosson on 10/08/2023.
//

import Foundation
import Alamofire

public class SearchNetworkRepository: SearchRepository {

    private let baseURLProvider: BaseURLProvider
    private let session: Session

    public init(baseURLProvider: BaseURLProvider, session: Session) {
        self.baseURLProvider = baseURLProvider
        self.session = session
    }

    public func getProduct(eanCode: String, completion: ((Result<Product, Error>) -> Void)?) {
        let decoder = JSONDecoder()
        session.request(
            baseURLProvider.baseURL + eanCode,
            method: .get
        )
        .validate()
        .responseDecodable(of: RESTResponse.self, decoder: decoder) { response in
            switch response.result {
            case let .failure(error):
                if response.response?.statusCode == 401 {
                    completion?(.failure(APIError.loginError))
                } else {
                    completion?(.failure(error))
                }
            case let .success(restProduct):
                let product = SearchMapper(restProduct: restProduct.product).map()
                completion?(.success(product))
            }
        }
    }
}
