//
//  PhotosCollectionViewController.swift
//  LoremIpsum-SocialApp
//
//  Created by Lukasz Stachnik on 16/11/2020.
//  Copyright © 2020 Warss. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate  {

    
    //MARK: Outlets
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Properties
    
    
    var user : User!
    var collectionData = ["1 😀", "2 😃", "3 🤣", "4 😉","5 🥲","6 😌","7 👍🏻","8 🥰"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
        
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath as IndexPath) as! PhotosCollectionViewCell
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
       
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
    }
      
    
}

//MARK: Flow layout delegate

extension PhotosViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfColumns : CGFloat = 3
        let width = collectionView.frame.size.width
        let xInsets: CGFloat = 10
        let cellSpacing : CGFloat = 5
        
        
        return CGSize(width: (width/numberOfColumns) - (xInsets + cellSpacing), height: CGFloat(width/numberOfColumns) - (xInsets + cellSpacing))
    }
    
}
