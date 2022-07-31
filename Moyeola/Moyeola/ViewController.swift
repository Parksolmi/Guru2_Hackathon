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
    
    /*
    //네비게이션 바
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }*/
    
}

