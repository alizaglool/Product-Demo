//
//  ViewController.swift
//  Thirdwayv Task_4
//
//  Created by Zaghloul on 14/12/2022.
//

import UIKit
import Network
import CoreData
class ProductListVC: UIViewController {

//MARK: - OUTLET
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    //MARK: - varable
    var productList: [ProductListModel] = [ProductListModel]()
    // VAR Core Data
    lazy var coreDataStack = CoreDataStack(modelName: "ProductListData")
    var fetchRequest: NSFetchRequest<Products>?
    var products: [Products] = []
    var asyncFetchRequest: NSAsynchronousFetchRequest<Products>?
    //MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
      return UIStatusBarStyle.lightContent
    }
}
extension ProductListVC {
    
    private func setupUI(){
        collectionSetupUI()
        getProductList()
    }
}


