//
//  HTTPTask.swift
//  Drama
//
//  Created by 정기욱 on 2020/01/04.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

/*
    추후에 추가할 수 있는 것
    body에 파라미터가 필요할 경우 추가해 줄 수 있다
*/

public enum HTTPTask {
    
    case request // 그냥 URLResquest를 생성해서 Get을 받는 방식
    
    // URL을 사용해서 URLRequest를 만들고 POST를 위해 body를 추가해주는 방식
    case requestBody(bodyEncoding: HTTPBodyEncoder)
    
    // 헤더까지 추가해주는 방식
    case requestBodyAndHeaders(bodyEndoing: HTTPBodyEncoder, addtionHeaders: HTTPHeaders)
}


