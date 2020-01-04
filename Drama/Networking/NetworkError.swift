//
//  NetworkError.swift
//  Drama
//
//  Created by 정기욱 on 2020/01/02.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    
    // 나중에 추가
    case invalidURL
    case invalidData
    case invalidResponse
    case decodingFailed
    case responseUnsuccessful
    case unknownErr
}
