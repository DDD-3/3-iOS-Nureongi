//
//  NetworkManager.swift
//  Drama
//
//  Created by 정기욱 on 2020/01/02.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    // DramaAPI -> EndPointType 프로토콜 채택 -> Enum으로 확장
    
    // URL Request Provider를 이용해 URL Request 생성
    // 1. GET 일 경우 그냥 request 요청
    // 2. POST 일 경우 buildRequest(_ route: EndPoint, model: Model? = nil)
    // 를 이용해 모델 주입.
    
    func request<T: Decodable>(url: URL, type: T.Type, completionHandler completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // 오류가 발생하면 바로 에러
            if let error = error {
                print(error)
                completion(.failure(.unknownErr))
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.responseUnsuccessful))
                return
            }

            do {
                let decoder = JSONDecoder()
                
                let genericValue = try decoder.decode(type, from: data)
                completion(.success(genericValue))
               
            } catch {
                completion(.failure(.decodingFailed))
            }
            
        }
        task.resume()
    }
}


/*
 NetworkManager.shared.fetchJson(url: url, type: 모델.self) { (result) in
                switch result {
                case .success(let model):
                    self.list =  model
                case .failure(let err):
                    print(err)
                }
}
 */
