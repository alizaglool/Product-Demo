//
//  Products+CoreDataProperties.swift
//  Thirdwayv Task_4
//
//  Created by Zaghloul on 16/12/2022.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var id: Int16
    @NSManaged public var price: Double
    @NSManaged public var productDescription: String?
    @NSManaged public var image: Image?

}

extension Products : Identifiable {

}
