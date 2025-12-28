//
//  ViewController.swift
//  myApp
//
//  Created by Vicky on 25/12/25.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    var name = "Hello I'm a mirror"
    
    @IBAction func click(_ sender: Any) {
        nameLabel.text = field.text
        btn.setTitle("name changed", for: .normal)
    }
    
    @IBAction func toggleTheme(_ sender: UISwitch) {
           let isDark = sender.isOn
        view.backgroundColor = isDark ? .darkGray : .lightGray
        switchLabel.text = isDark ? "Change to Light Mode" : "Change to Dark Mode"
           UserDefaults.standard.set(isDark, forKey: "theme")
       }
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var navbtn: UIButton!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First Page"
        view.backgroundColor = .lightGray
        navigationController?.navigationBar.prefersLargeTitles = true
        field.delegate = self
        mySwitch.isOn = false
        btn.setTitle("click to start", for: .normal)
        field.placeholder = "Type Something"
        nameLabel.text = name
    }
    override func viewWillAppear(_ animated: Bool) {
        let theme = UserDefaults.standard.bool(forKey: "theme")
        view.backgroundColor = theme ? .darkGray : .lightGray
        switchLabel.text = theme ? "Change to Light Mode" : "Change to Dark Mode"
        mySwitch.isOn = theme
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if ( field.hasText == false ) {
            nameLabel.text = "TextField is Empty"
            return false
        }
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goto" ,
            let vc = segue.destination as? SecondViewController
        {
            vc.txt = nameLabel.text
            vc.completion = {text in self.nameLabel.text = text}
        }
    }

}
