//
//  ProductListModel.swift
//  Thirdwayv Task_4
//
//  Created by Zaghloul on 14/12/2022.
//

import Foundation
import CoreData

// MARK: - ProductListElement
struct ProductListModel: Codable {
    var id: Int?
    var productDescription: String?
    var image: ImageData?
    var price: Double?
    
}

// MARK: - Image
struct ImageData: Codable {
    let width, height: Int?
    let url: String?
}

