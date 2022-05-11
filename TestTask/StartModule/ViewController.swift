//
//  ViewController.swift
//  TestTask
//
//  Created by Pavel Schulepov on 03.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var label = UILabel()
    var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        // Do any additional setup after loading the view.
    }
    
    func createUI() {
        for i in [label, button] {
            view.addSubview(i)
            i.translatesAutoresizingMaskIntoConstraints = false
        }
        
        label.text = "My Awesome Game"
        label.textAlignment = .center
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(nil, action: #selector(ViewController.start), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            label.heightAnchor.constraint(equalTo: label.widthAnchor, multiplier: 1/6),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -165),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            button.heightAnchor.constraint(equalTo: label.widthAnchor, multiplier: 1/6),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func start() {
        let VC = EnterNumberViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
    }

}

