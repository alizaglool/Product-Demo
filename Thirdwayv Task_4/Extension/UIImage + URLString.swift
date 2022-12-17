//
//  UIImage + URLString.swift
//  Task URLSession
//
//  Created by Zaghloul on 09/09/2022.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImageFromURL(urlString: String){
        
        guard let url = URL(string: urlString) else {return}
                if let data = try? Data(contentsOf: url){
                    if let image = UIImage(data: data){
                            self.image = image
                    }
                }
    }
    
    func convertDataToImage(data: Data){
        
        if let image = UIImage(data: data){
            self.image = image
        }
    }

}
