//
//  Encoder.swift
//  Drama
//
//  Created by 정기욱 on 2020/01/04.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import Foundation


public typealias Parameters = [String:Any]

public protocol HTTPBodyEncoderType {
    func encode<Model:Encodable> (urlRequest: inout URLRequest, model: Model) throws
}


public struct HTTPBodyEncoder: HTTPBodyEncoderType {
    
    public func encode<Model>(urlRequest: inout URLRequest, model: Model) throws where Model : Encodable {
        do {
            
            let encodedData = try JSONEncoder().encode(model)
                    
            urlRequest.httpBody = encodedData
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}


