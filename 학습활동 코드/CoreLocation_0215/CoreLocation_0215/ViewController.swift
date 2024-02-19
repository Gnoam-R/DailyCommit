//
//  ViewController.swift
//  CoreLocation_0215
//
//  Created by Roh on 2/15/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    // 위치 데이터를 코드
    let locationManager = CLLocationManager()
    
//    static let shared = LocationService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        locationManager.delegate = self
        
        // 권한 요청
        locationManager.requestAlwaysAuthorization()

        // 위치 업데이트 시작
        locationManager.startUpdatingLocation()
        view.backgroundColor = .systemPink
        
        let cityName = "서울특별시 용두동 39-1"
        let geocoder = CLGeocoder()         // 주소를 변환해줌
        
        geocoder.geocodeAddressString(cityName) { (placemark, error) in
          guard error == nil else {return print(error!.localizedDescription)}//에러가 없으면 아래코드 실행
          guard let location = placemark?.first?.location else { return print("데이터가 없습니다.")}
          print(location.coordinate.latitude)
          print(location.coordinate.longitude)
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 위치를 받아서 필요한 코드를 작성
        let newLocation = locations.last
        print(newLocation)
        
    }
    
    
}
