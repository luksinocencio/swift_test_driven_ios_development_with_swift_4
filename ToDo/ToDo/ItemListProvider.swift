import UIKit

class ItemListDataProvider: NSObject, UITableViewDataSource {
    
    enum Section: Int {
        case toDo
        case done
    }
    
    var itemManager: ItemManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemManager = itemManager else { return 0 }
        guard let itemSection = Section(rawValue: section) else {
            fatalError()
        }
        
        let numberORows: Int
        
        switch itemSection {
        case .toDo:
            numberORows = itemManager.toDoCount
        case .done:
            numberORows = itemManager.doneCount
        }
        
        return numberORows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ItemCell()
    }
}
