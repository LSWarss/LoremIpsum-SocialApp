//
//  UserDetailsViewController.swift
//  LoremIpsum-SocialApp
//
//  Created by Lukasz Stachnik on 16/11/2020.
//  Copyright © 2020 Warss. All rights reserved.
//

import UIKit
import MapKit

class UserDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var map: MKMapView!
    
    var user : User!
    
    let coordinatesING = CLLocationCoordinate2DMake(50.265450, 19.017950)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = self.user.name
        self.emailLabel.text = self.user.email
        self.phoneLabel.text = self.user.phone
        self.websiteLabel.text = self.user.website
        
        self.navigationItem.title = "User: \(self.user.username)"
        let photosBtn = UIBarButtonItem(title: "Photos", style: UIBarButtonItem.Style.plain, target: self, action: #selector(photoButtonSelector))
        self.navigationItem.rightBarButtonItem = photosBtn
        
        let centerLocation = CLLocationCoordinate2DMake(Double(user.address.geo.lat)!, Double(user.address.geo.lng)!)
       
        let mapSpan = MKCoordinateSpan.init(latitudeDelta:  0.01,longitudeDelta: 0.01)
        let mapRegion = MKCoordinateRegion.init(center: centerLocation, span: mapSpan)
        
        self.map.showsUserLocation = true
        self.map.setRegion(mapRegion, animated: true)
        

        
    }
    
    @objc func photoButtonSelector() {
        let photoVC = PhotosViewController()
        photoVC.user = self.user
        self.navigationController?.pushViewController(photoVC, animated: true)
    }

}
