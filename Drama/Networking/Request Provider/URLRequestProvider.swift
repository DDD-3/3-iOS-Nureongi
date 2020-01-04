//
//  URLRequestProvider.swift
//  Drama
//
//  Created by 정기욱 on 2020/01/04.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import Foundation

protocol URLRequestProviderType: class {
    
    associatedtype EndPoint: EndPointType
    associatedtype Model: Codable
    
    func buildRequest(_ route: EndPoint, model: Model) throws -> URLRequest?
}


class URLRequstProvider<EndPoint: EndPointType, Model: Codable>: URLRequestProviderType {
    
    // EndPoint와 Model을 이용해서 Get Request 또는 Post Request를 만든다.
    func buildRequest(_ route: EndPoint, model: Model? = nil) throws -> URLRequest? {
       var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path))
           
       request.httpMethod = route.httpMethod.rawValue
        
       do {
            switch route.task {
                
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
          
            case .requestBody(let bodyEncoding):
                guard let model = model else { return nil }
                try bodyEncoding.encode(urlRequest: &request, model: model)
                
            case .requestBodyAndHeaders(let bodyEncoding, let addtionHeaders):
                guard let model = model else { return nil }
                self.addHeaders(addtionHeaders, request: &request)
                try bodyEncoding.encode(urlRequest: &request, model: model)
                
            }
        
            return request
        
        } catch {
            throw error
        }
    }
    
     private func addHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
         guard let headers = additionalHeaders else { return }
         for (key, value) in headers {
             request.setValue(value, forHTTPHeaderField: key)
         }
     }
    
}

//class URLRequestProvider<EndPoint: EndPointType, Model: Codable>: URLRequestProviderType {
//
//    private var task: URLSessionTask?
//
//    func request(_ route: EndPoint, model: Model) -> URLRequest {
//        let session = URLSession.shared
//
//    }
//
//
//}

