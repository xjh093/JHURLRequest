//
//  JHURLRequest.swift
//  JHURLRequest
//
//  Created by HaoCold on 2021/12/16.
//

import Foundation

enum JHURLRequestHttpMethod {
    case GET, POST
}

extension URLRequest {
    static func jh_request(_ url: String,
                           params: Dictionary<String, Any>,
                           method: JHURLRequestHttpMethod = .GET) -> URLRequest? {
        if url.isEmpty || !(url.hasPrefix("http://") || url.hasPrefix("https://")){
            return nil
        }
        
        var query: String = ""
        
        if !params.isEmpty {
            var keyValues: [String] = []
            
            for (key, value) in params {
                keyValues.append("\(key)=\(value)")
            }
            
            query = keyValues.joined(separator: "&")
            query = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        }
        
        if method == .POST {
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = "POST"
            request.httpBody = query.data(using: .utf8)
            return request
        }
        
        // method == .GET
        var s = url
        if !query.isEmpty {
            s = url + "?" + query
        }
        
        let request = URLRequest(url: URL(string: s)!)
        return request
    }
}
