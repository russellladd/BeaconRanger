//
//  ViewController.swift
//  Test
//
//  Created by Russell Ladd on 10/7/16.
//  Copyright © 2016 GRL5. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController, UITableViewDataSource, CLLocationManagerDelegate {
    
    var rangedBeacons = [CLBeacon]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    let uuid = UUID(uuidString: "816850E2-9A4A-48DD-9D9C-590B0D7CA79F")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "com.MHacks.Workshop")
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startRangingBeacons(in: beaconRegion)
    }
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rangedBeacons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Beacon Cell", for: indexPath)
        
        cell.textLabel!.text = rangedBeacons[indexPath.row].major.description
        
        return cell
    }
    
    let locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
        print("Found beacons: " + beacons.description)
        
        rangedBeacons = beacons
    }
    
    func locationManager(_ manager: CLLocationManager, rangingBeaconsDidFailFor region: CLBeaconRegion, withError error: Error) {
        
        print("Error: " + error.localizedDescription)
    }
    
    let peripheralManager = CBPeripheralManager()
    
    @IBAction func broadcastSwitchChanged(_ broadcastSwitch: UISwitch) {
        
        if broadcastSwitch.isOn {
            
            let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 11, identifier: "com.MHacks.Workshop")
            
            let peripheralData = beaconRegion.peripheralData(withMeasuredPower: nil).copy() as! [String: Any]
            
            peripheralManager.startAdvertising(peripheralData)
            
        } else {
            
            peripheralManager.stopAdvertising()
        }
    }
}
