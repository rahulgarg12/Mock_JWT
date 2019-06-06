//
//  Structs.swift
//  Mock_JWT
//
//  Created by Rahul Garg on 06/06/19.
//  Copyright © 2019 Rahul Garg. All rights reserved.
//

import Foundation

//MARK:- Network
struct HTTPHeader {
    let field: String
    let value: String
}

struct NetworkResponse<Body> {
    let statusCode: Int
    let body: Body
}
