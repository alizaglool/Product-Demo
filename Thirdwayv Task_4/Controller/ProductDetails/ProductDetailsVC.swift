//
//  ProductDetailsVC.swift
//  Thirdwayv Task_4
//
//  Created by Zaghloul on 14/12/2022.
//

import UIKit

class ProductDetailsVC: UIViewController {

    //MARK: - OUTLET
    @IBOutlet weak var productImageDetails: UIImageView!
    @IBOutlet weak var productDescriptionDetails: UILabel!
    
    //MARK: - VARABLE
    var productDetails: Products?
    
    //MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product Details"
        UIView.animate(withDuration: 3.0) {
            self.productImageDetails.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        setupUI()
    }
    
    func setupUI(){
        productImageDetails.convertDataToImage(data: productDetails?.image?.url ?? Data() )
        productDescriptionDetails.text = productDetails?.productDescription
    }
}
