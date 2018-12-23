//
//  TransactionDetailTableViewCell.swift
//  Kumbara
//
//  Created by Gamze on 12/23/18.
//  Copyright © 2018 gamzerd. All rights reserved.
//

import UIKit
import MapKit

class TransactionDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var transactionNameLabel: UILabel!
    
    /**
     * Setups cell.
     * @param transaction: transaction object to set cell.
     */
    func setup(with transaction: Transaction) {
        descriptionLabel.text = "Balance: " + transaction.post_transaction_balance + " £"
        transactionNameLabel.text = transaction.description
        if let location = transaction.location {
            self.showMap(location: location, description: transaction.description)
        } else {
            self.showNoLocation()
        }
    }
    
    func showNoLocation() {
        self.mapView.isHidden = true
        self.errorLabel.isHidden = false
    }
    
    func showMap(location: Location, description: String) {
        
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        
        let theSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let pointLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(Double(location.latitude)!, Double(location.longitude)!)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: pointLocation, span: theSpan)
        mapView.setRegion(region, animated: true)
        
        let pinLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(Double(location.latitude)!, Double(location.longitude)!)
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = pinLocation
        objectAnnotation.title = description
        self.mapView.addAnnotation(objectAnnotation)
        
    }
}
