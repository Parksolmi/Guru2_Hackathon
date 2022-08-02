//
//  ViewController.swift
//  Moyeola
//
//  Created by 박솔미 on 2022/07/29.
//

import UIKit
import NMapsMap
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: NMFMapView!
    @IBOutlet weak var naverMapView: NMFNaverMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //사용자 UI
        naverMapView.showCompass = true
        naverMapView.showZoomControls = true
        naverMapView.showLocationButton = true
        
        view.addSubview(naverMapView)
        
        
        //현재 좌표 가져오기
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //사용자 위치 허용 받는 팝업
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            NSLog("위치 서비스 On")
            //위치 정보 받아오기 시작
            locationManager.startUpdatingLocation()
            print(locationManager.location?.coordinate)
            
            //현 위치로 카메라 이동
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0))
            
            cameraUpdate.animation = .easeIn
            mapView.moveCamera(cameraUpdate)
            
            let marker = NMFMarker()
            marker.position = NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0)
            marker.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
            marker.mapView = mapView
            
        } else {
            NSLog("위치 서비스 Off")
        }
        
        //지도를 서브뷰로 넣기
        view.addSubview(mapView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        marker.mapView = mapView
    }
    
    
    //위치 정보 계속 업데이트
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        NSLog("didUpdateLocations")
        if let location = locations.first {
            NSLog("위도: \(location.coordinate.latitude)")
            NSLog("경도: \(location.coordinate.latitude)")
        }
    }
    
    //위도 경도 받아오기 에러
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
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

