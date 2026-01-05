//
//  TblViewController.swift
//  myApp
//
//  Created by Vicky on 05/01/26.
//

import UIKit
struct Contact {
    let name: String
    let phone: String
    let city: String
}
let contacts: [Contact] = [
    Contact(name: "Vignesh Kumar", phone: "9876543210", city: "Chennai"),
    Contact(name: "Arjun Raj", phone: "9123456789", city: "Coimbatore"),
    Contact(name: "Karthik M", phone: "9988776655", city: "Madurai"),
    Contact(name: "Suresh Babu", phone: "9090909090", city: "Trichy"),
    Contact(name: "Priya Sharma", phone: "9012345678", city: "Bangalore"),
    Contact(name: "Ananya Rao", phone: "8899776655", city: "Hyderabad"),
    Contact(name: "Rahul Verma", phone: "9345612789", city: "Delhi"),
    Contact(name: "Sneha Iyer", phone: "9567891234", city: "Mumbai"),
    Contact(name: "Naveen Kumar", phone: "9786543211", city: "Salem"),
    Contact(name: "Meera Nair", phone: "9876123456", city: "Kochi")
]

class TblViewController: UIViewController {
    @IBOutlet weak var table : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }

}
extension TblViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension TblViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tblcell
        cell.name.text = contacts[indexPath.row].name
        cell.phone.text = contacts[indexPath.row].phone
        cell.city.text = contacts[indexPath.row].city
        return cell
    }
    
    
}
class tblcell : UITableViewCell {
    @IBOutlet weak var name : UILabel!
    @IBOutlet weak var phone : UILabel!
    @IBOutlet weak var city : UILabel!
}
