//
//  EndPointType.swift
//  Drama
//
//  Created by 정기욱 on 2020/01/04.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import Foundation


protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    
    var headers: HTTPHeaders? { get }
    
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }

}
// EndPointType을 채택하는 Router는
// 필수 var을 입력해야한다.


// 0. Enum DramaEndPoint를 만든다. (각종 Api URL 요구사항)
// 1. DramaEndPoint는 Extension을 통해서 DramaEndPointType 프로토콜을 채택한다.
// 2. baseURL( url 공통 부분 ) 과 path 각각의 enum 경우의 수마다 입력한다.
// 3. http Method를 각각의 경우에 정해준다. (GET, POST)
// 4. POST의 경우 Encoding 된 Body를 넣어주기 위해 task 부분에 추가해줘야한다.

