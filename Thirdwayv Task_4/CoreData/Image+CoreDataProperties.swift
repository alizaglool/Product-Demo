//
//  Image+CoreDataProperties.swift
//  Thirdwayv Task_4
//
//  Created by Zaghloul on 16/12/2022.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var width: Int16
    @NSManaged public var height: Int16
    @NSManaged public var url: Data?

}

extension Image : Identifiable {

}
