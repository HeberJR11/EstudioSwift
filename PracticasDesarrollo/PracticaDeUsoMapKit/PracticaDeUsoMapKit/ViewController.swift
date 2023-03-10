//
//  ViewController.swift
//  PracticaDeUsoMapKit
//
//  Created by MacBook on 10/01/23.
//

import UIKit
import MapKit

// Se debe implementar el protocolo CLLocationManagerDelegate
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    @IBOutlet weak var myMapKit: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Seleccionar la presisicion con la que devuelva las coordenadas
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        // Solicitar autorizacion
        manager.requestWhenInUseAuthorization()
        // Actualizacion de las coordenadas, cada que se mueva de ubicacion
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            renderMap(location: location)
        }
    }
    
    func renderMap(location: CLLocation) {
        let cordenates = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: cordenates, latitudinalMeters: 2000, longitudinalMeters: 2000)
        
        myMapKit.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = cordenates
        pin.title = "Aqui estoy"
        pin.subtitle = "Lat: \(location.coordinate.latitude) Long: \(location.coordinate.longitude)"
        myMapKit.addAnnotation(pin)
    }


}

