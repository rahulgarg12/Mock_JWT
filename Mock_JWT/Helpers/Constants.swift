//
//  Constants.swift
//  Mock_JWT
//
//  Created by Rahul Garg on 06/06/19.
//  Copyright © 2019 Rahul Garg. All rights reserved.
//

import Foundation

//MARK:- JSON Key
struct JSONKey {
    let jwt = "jwt"
    let password = "password"
    let email = "email"
}

//MARK:- Timer (seconds)
struct TimeInterval {
    let jwtRefreshTime:Double = 300
}
