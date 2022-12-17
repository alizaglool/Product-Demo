//
//  ProdectListCell.swift
//  Thirdwayv Task_4
//
//  Created by Zaghloul on 14/12/2022.
//

import UIKit
import Combine

class ProdectListCell: UICollectionViewCell {
    
    //MARK: - OUTLET
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productPrice: UILabel!
    @IBOutlet private weak var productDescription: UILabel!
    
    //MARK: - VARABLE
    private var cancellable: AnyCancellable?
    private var animator: UIViewPropertyAnimator?
    
    var Description: String = ""{
        didSet { self.productDescription.text = Description }
    }
    
    var price: String? {
        didSet{ self.productPrice.text = price }
    }
    
    var image: Data? {
        didSet{
            self.productImage.convertDataToImage(data: image ?? Data() )
            self.productImage.layer.cornerRadius = 5
        }
    }
}
