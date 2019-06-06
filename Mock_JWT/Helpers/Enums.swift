//
//  Enums.swift
//  Mock_JWT
//
//  Created by Rahul Garg on 06/06/19.
//  Copyright © 2019 Rahul Garg. All rights reserved.
//

import Foundation

//MARK:- Network
enum HTTPMethod: String {
    case post = "POST"
}

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailure
}

enum APIResult<Body> {
    case success(NetworkResponse<Body>)
    case failure(APIError)
}
