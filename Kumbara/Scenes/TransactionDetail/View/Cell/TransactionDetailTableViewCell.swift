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
    
    @IBOutlet weak var emptyLocationLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    /**
     * Setups cell.
     * @param transaction: transaction object to set cell.
     */
    func setup(with transaction: Transaction) {
        balanceLabel.text = "Balance: " + transaction.postTransactionBalance + " £"
        descriptionLabel.text = transaction.description
        if let location = transaction.location {
            showMap(location: location, description: transaction.description)
        } else {
            showNoLocation()
        }
    }
    
    /**
     * Called when there is no location info.
     */
    private func showNoLocation() {
        mapView.isHidden = true
        emptyLocationLabel.isHidden = false
    }
    
    /**
     * Called when there is location to show in map.
     * @param location: location object to set map.
     * @param description: description string to set pin name.
     */
    private func showMap(location: Location, description: String) {
        
        let latDelta: CLLocationDegrees = 0.01
        let longDelta: CLLocationDegrees = 0.01
        
        let theSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let pointLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(Double(location.latitude)!, Double(location.longitude)!)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: pointLocation, span: theSpan)
        mapView.setRegion(region, animated: true)
        
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(Double(location.latitude)!, Double(location.longitude)!)
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = pinLocation
        objectAnnotation.title = description
        mapView.addAnnotation(objectAnnotation)
        
    }
}
