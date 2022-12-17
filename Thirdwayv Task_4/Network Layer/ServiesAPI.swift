//
//  ServiesAPI.swift
//  Thirdwayv Task_4
//
//  Created by Zaghloul on 14/12/2022.
//

import Foundation

class ServiesAPI {
    
    static let instance = ServiesAPI()
    
    let URLBased = "https://run.mocky.io/v3/958ffa32-6df9-4712-ad07-2963d79dded9"
    
    func fetchDate<T: Decodable>(url: String, complation: @escaping (T?, Error?)-> Void){
        
        guard let URL = URL(string: url) else{ return }
        let session = URLSession.shared
        var requst = URLRequest(url: URL)
                
        let task = session.dataTask(with: requst) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? " ")
                return
            }
            let decoder = JSONDecoder()
            do{
                let dateResponce = try? decoder.decode(T.self, from: data)
                complation(dateResponce, nil)
            }catch let jsonError{
                complation(nil, jsonError)
            }
        }
        task.resume()
    }
}
