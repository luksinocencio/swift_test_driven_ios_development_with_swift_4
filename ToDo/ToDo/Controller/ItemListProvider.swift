import UIKit

class ItemListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        guard let itemManager = itemManager else {
            fatalError("ItemManagerFail")
        }
        
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        
        let item: ToDoItem
        
        switch section {
        case .toDo:
            item = itemManager.item(at: indexPath.row)
        case .done:
            item = itemManager.doneItem(at: indexPath.row)
        }
        
        cell.configCell(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        let buttonTitle: String
        switch section {
        case .toDo:
            buttonTitle = "Check"
        case .done:
            buttonTitle = "Uncheck"
        }
        
        return buttonTitle
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let itemManager = itemManager else { fatalError() }
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        switch section {
        case .toDo:
            itemManager.checkItem(at: indexPath.row)
        case .done:
            itemManager.uncheckItem(at: indexPath.row)
        }
        
        tableView.reloadData()
    }
}
