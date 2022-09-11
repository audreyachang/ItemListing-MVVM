//
//  DataManager.swift
//  ItemListing-MVVM
//
//  Created by Audrey Aurelia Chang on 11/09/22.
//

import UIKit

extension UIImageView{
    func loadImage(imageURL: URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
