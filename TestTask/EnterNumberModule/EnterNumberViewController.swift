//
//  EnterNumberViewController.swift
//  TestTask
//
//  Created by Pavel Schulepov on 03.05.2022.
//

import UIKit

class EnterNumberViewController: UIViewController {

    var textField = UITextField()
    var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        // Do any additional setup after loading the view.
    }
    
    func createUI() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        for i in [textField, button] {
            view.addSubview(i)
            i.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.backgroundColor = .white
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        textField.placeholder = "enter number"
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(nil, action: #selector(EnterNumberViewController.check), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            textField.heightAnchor.constraint(equalTo: textField.widthAnchor, multiplier: 1/6),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -165),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1/6),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func check() {
        let VC = CompCheckViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
    }

}
