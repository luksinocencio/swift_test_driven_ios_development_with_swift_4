import UIKit
import CoreLocation

class InputViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    
    lazy var geocoder = CLGeocoder()
    
    var itemManager: ItemManager?
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save() {
        guard let titleString = titleTextField.text, titleString.count > 0 else { return }
        
        let date: Date?
        
        if let dateText = self.dateTextField.text, dateText.count > 0 {
            date = dateFormatter.date(from: dateText)
        } else {
            date = nil
        }
        
        let descriptionString = descriptionTextField.text
        if let locationName = locationTextField.text, locationName.count > 0 {
            if let address = addressTextField.text, address.count > 0 {
                geocoder.geocodeAddressString(address) { [unowned self] (placeMarks, error) -> Void in
                    let placeMark = placeMarks?.first
                    
                    let item = ToDoItem(
                        title: titleString,
                        itemDescription: descriptionString,
                        timestamp: date?.timeIntervalSince1970,
                        location: Location(
                            name: locationName,
                            coordinate: placeMark?.location?.coordinate))
                    
                    DispatchQueue.main.async(execute: {
                        self.itemManager?.add(item)
                        self.dismiss(animated: true)
                    })
                }
            } else {
                let item = ToDoItem(title: titleString,
                                    itemDescription: descriptionString,
                                    timestamp: date?.timeIntervalSince1970,
                                    location: nil)
                self.itemManager?.add(item)
                dismiss(animated: true)
            }
        } else {
            let item = ToDoItem(
                title: titleString,
                itemDescription: descriptionString,
                timestamp: date?.timeIntervalSince1970)
            
            self.itemManager?.add(item)
            dismiss(animated: true)
        }
    }
}
