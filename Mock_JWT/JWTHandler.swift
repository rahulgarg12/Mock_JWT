//
//  JWTHandler.swift
//  Mock_JWT
//
//  Created by Rahul Garg on 06/06/19.
//  Copyright © 2019 Rahul Garg. All rights reserved.
//

import Foundation

class JWTHandler {
    
    init() {
        initTimer()
        fetchAndSaveToken()
    }
    
    
    //MARK:- Private Helpers
    private func initTimer() {
        let _ = Timer.scheduledTimer(timeInterval: TimeInterval().jwtRefreshTime,
                                     target: self,
                                     selector: #selector(fetchAndSaveToken),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    private func fetchJWT(with completion: @escaping (_ isSuccess: Bool, _ dict: [String:Any]?) -> ()) {
        let url = "\(APIList().mockApi)"
            + "?\(JSONKey().email)="
            + "&\(JSONKey().password)="
        
        let request = NetworkRequest(method: .post,
                                     url: url)
        
        NetworkClient().perform(request) { (result) in
            
            switch result {
            case .success(let response):
                do {
                    if let body = response.body,
                        let dict = try JSONSerialization.jsonObject(with: body,
                                                                    options: []) as? [String:Any] {
                        completion(true, dict)
                    } else {
                        completion(false, nil)
                    }
                } catch let error {
                    print("Failed to decode response with error \(error)")
                    completion(false, nil)
                }
                
            case .failure:
                print("Error performing network request")
                completion(false, nil)
            }
        }
    }
    
    
    //MARK:- Selectors
    @objc private func fetchAndSaveToken() {
        
        fetchJWT { (success, dict) in
            
            guard success,
                let token = dict?[JSONKey().jwt],
                !"\(token)".isEmpty
                else { return }
            
            StorageHandler.shared.addToDB(value: "\(token)", key: JSONKey().jwt)
        }
    }
}
