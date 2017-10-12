//
//  RequestServices.swift
//  NFC-Smart-Home
//
//  Created by Garage on 10/12/17.
//  Copyright © 2017 Garage. All rights reserved.
//

import Foundation

class RequestServices {
    let TOKEN = "fQaRyKFD_XQHGDPsgOnGPjzGd6Le5aJK"
    
    func buildRequest(urlString: String, powered: Bool) -> URLRequest {
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.addValue("Bearer "+(TOKEN), forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let json: [String: Any] = ["desired_state": ["powered": powered]]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpBody = jsonData
        request.httpMethod = "PUT"
        
        return request;
    }
    
    func executeRequest(request: URLRequest) {
        let session = URLSession.shared;
        let task = session.dataTask(with: request)
        task.resume()
    }
}
