//
//  NetworkManager.swift
//  ItemListing-MVVM
//
//  Created by Audrey Aurelia Chang on 10/09/22.
//

import Foundation

//MARK: Function to fetch data from API
class NetworkManager{
    public func getProducts(completion: @escaping(Result<[Item], Error>)->()){
        let itemURL = URL(string: "https://fakestoreapi.com/products")!
        let urlrequest = URLRequest(url: itemURL)
        let task = URLSession.shared.dataTask(with: urlrequest) { data, _, error in
            if let data = data {
                do{
                    let result = try JSONDecoder().decode([Item].self, from: data)
                    completion(.success(result))
                }catch{
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
