//
//  SecondViewController.swift
//  myApp
//
//  Created by Vicky on 25/12/25.
//

import UIKit

class SecondViewController: UIViewController {
    var titleText = "Second Screen"
    @IBAction func backClick(_ sender: UIButton) {
        print("Entered")
        completion?("Hello via Closure");
        navigationController?.popViewController(animated: true)
    }
    var completion : ((String) -> Void)?
    var txt : String? = "";
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var btnnn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = titleText
        lbl.text = txt
        btnnn.setTitle("Faaaa", for: .normal)
        if (lbl?.text == nil  || lbl.text?.count == 0) {
            let alert = UIAlertController(title: "Empty", message: "Message not received", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title : "Ok" , style : .default))
            present(alert, animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        let theme = UserDefaults.standard.bool(forKey: "theme")
        view.backgroundColor = theme ? .darkGray : .lightGray
    }


}
