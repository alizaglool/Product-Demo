//
//  ProductListVC + CachData.swift
//  Thirdwayv Task_4
//
//  Created by Zaghloul on 15/12/2022.
//

import UIKit
import CoreData


extension ProductListVC {
   
//MARK: - GET DATA FROM CORE DATA
    func fetchDataFromCoreData(){
        defer {
            DispatchQueue.main.async {
                self.productCollectionView.reloadData()
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        }
        let productFetchRequest: NSFetchRequest<Products> = Products.fetchRequest()
        fetchRequest = productFetchRequest

        asyncFetchRequest = NSAsynchronousFetchRequest<Products>(
          fetchRequest: productFetchRequest
        ) { [unowned self] result in
          guard let products = result.finalResult else {
            return
          }
          self.products = products
          self.productCollectionView.reloadData()
            
        }
        do {
          guard let asyncFetchRequest = asyncFetchRequest else {
            return
          }
          try coreDataStack.managedContext.execute(asyncFetchRequest)
          // Returns immediately, cancel here if you want
        } catch let error as NSError {
          print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
//MARK: - SAVE DATA FOR CORE DATA
    func saveDataToCoreData(productList: [ProductListModel]){
        defer {
            self.fetchDataFromCoreData()
            
        }
        for list in productList {
            
            let image = Image(context: coreDataStack.managedContext)
            image.height = Int16(list.image?.height ?? 0)
            image.width = Int16(list.image?.width ?? 0)
            guard let url = URL(string: list.image?.url ?? "") else {return}
                        if let data = try? Data(contentsOf: url){
                            if let imageData = UIImage(data: data){
                                let imageContext = imageData.jpegData(compressionQuality: 0.7)
                                image.url = imageContext
                                }
                            }
            let product = Products(context: coreDataStack.managedContext)
            product.id = Int16(list.id ?? 0)
            product.productDescription = list.productDescription
            product.price = list.price ?? 0
            product.image = image
                           
        }
        coreDataStack.saveContext()
    }
    
//MARK: - DELETE ALL DATA FORM CORE DATA
    func deleteAllRecord(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Products")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try coreDataStack.managedContext.execute(deleteRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
