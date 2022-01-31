
import UIKit
import CoreLocation

class WeatherViewController: UIViewController{

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    var locationMng = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationMng.delegate = self
        searchTextField.delegate = self
        weatherManager.delegate = self
        
        
        locationMng.requestWhenInUseAuthorization()
        locationMng.requestLocation()
    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationMng.requestLocation()
    }
    
    
}


//MARK: -  UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate{
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != ""{
            return true
        }else{
            searchTextField.placeholder = "Type a location"
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = textField.text {
            let url = weatherManager.fetchUrl(city: city )
            
        }
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate{
    func didUpdateWeather(weather: WeatherModel) {
        
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.tempString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.name
        }
        
    }
}

extension WeatherViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last{
            let lat = location.coordinate.latitude
            let lng = location.coordinate.longitude
            print(lat)
            print(lng)
            
            weatherManager.fetchByCoordinate(lat: lat, lng: lng )
        }
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
}
