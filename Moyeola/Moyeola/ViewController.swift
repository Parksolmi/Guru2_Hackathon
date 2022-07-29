//
//  ViewController.swift
//  Moyeola
//
//  Created by 박솔미 on 2022/07/29.
//

import UIKit
import NMapsMap

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
        
    }

}

