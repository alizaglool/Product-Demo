//
//  ProductListVC + UICollectionView.swift
//  Thirdwayv Task_4
//
//  Created by Zaghloul on 14/12/2022.
//

import UIKit

//MARK: - Collection SetUP

extension ProductListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionSetupUI(){
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        if let layout = productCollectionView.collectionViewLayout as? CustomLayoutCell {
          layout.delegate = self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProdectListCell", for: indexPath) as? ProdectListCell {
            let list = products[indexPath.row]
            cell.Description = list.productDescription ?? ""
            cell.price = "\(list.price)$"
            cell.image = list.image?.url 
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedproductList = products[indexPath.row]
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsVC") as? ProductDetailsVC {
            vc.productDetails = selectedproductList
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    //MARK: - Pagination
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        if indexPath.row == products.count - 1 {
            getProductList()
        }
    }
}
//MARK: - Custom Cell CollectionView
extension ProductListVC: CustomLayoutDelegate {

    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        return CGFloat( products[indexPath.item].image?.height ?? 0 )
    }

}

