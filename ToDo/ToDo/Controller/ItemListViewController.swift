import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }
    
    @IBAction func addItem(_ sender: Any) {
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "InputViewController") as? InputViewController {
          
//          nextViewController.itemManager = itemManager
          
          present(nextViewController, animated: true, completion: nil)
        }
    }
}
