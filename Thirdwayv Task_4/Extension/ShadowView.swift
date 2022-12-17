//
//  UIView.swift
//  Thirdwayv Task_4
//
//  Created by Zaghloul on 14/12/2022.
//

import Foundation
import UIKit

class ShadowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeShadoView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeShadoView()
    }
    
    func makeShadoView() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.layer.shadowRadius = 8
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 0.2
        
    }
}
