//
//  ProductListVC + FetchData.swift
//  Thirdwayv Task_4
//
//  Created by Zaghloul on 14/12/2022.
//

import Foundation

extension ProductListVC {
    
    func getProductList(){
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
           ServiesAPI.instance.fetchDate(url: ServiesAPI.instance.URLBased, complation: { (productLists: [ProductListModel]?, error) in
               if let error = error {
                   self.fetchDataFromCoreData()
                   DispatchQueue.main.async {
                       self.productCollectionView.reloadData()
                       self.activityIndicator.stopAnimating()
                       self.activityIndicator.isHidden = true
                   }
                   print(error)
               }
               guard let productLists = productLists else {  return  }
               self.productList.append(contentsOf: productLists)
               self.deleteAllRecord()
               self.saveDataToCoreData(productList: self.productList)             
           })
   }
}
