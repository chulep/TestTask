//
//  CompCheckViewController.swift
//  TestTask
//
//  Created by Pavel Schulepov on 03.05.2022.
//

import UIKit

class CompCheckViewController: UIViewController {
    
    var label = UILabel()
    var resultLabel = UILabel()
    var buttonBigger = UIButton()
    var buttonSmaller = UIButton()
    var buttonEqual = UIButton()
    var stackView = UIStackView()
    private var number = Int()
    private var compCheckCurrentNumber = Int()
    
    init(number: Int) {
        super.init(nibName: nil, bundle: nil)
        self.number = number
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        compCheckNumber()
    }
    
    func createUI() {
        view.backgroundColor = .white
        label.text = "My Awesome Game"
        label.textAlignment = .center
        resultLabel.textAlignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        buttonBigger.addTarget(nil, action: #selector(CompCheckViewController.biggerCompCheckNumber), for: .touchUpInside)
        buttonSmaller.addTarget(nil, action: #selector(CompCheckViewController.smallerCompCheckNumber), for: .touchUpInside)
        buttonBigger.setTitle(">", for: .normal)
        buttonSmaller.setTitle("<", for: .normal)
        
        for s in [buttonEqual, buttonSmaller, buttonBigger] {
            s.backgroundColor = .blue
            stackView.addArrangedSubview(s)
        }
        
        for i in [label, stackView, resultLabel] {
            view.addSubview(i)
            i.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            label.heightAnchor.constraint(equalTo: label.widthAnchor, multiplier: 1/6),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resultLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 65),
            resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            resultLabel.heightAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1/6),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -165),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            stackView.heightAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1/6),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func tap() {
        let VC = MyCheckViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
    }
    
    func compCheckNumber() {
        let number = Int.random(in: 1...100)
        compCheckCurrentNumber = number
        resultLabel.text = "\(number)"
    }
    
    @objc func biggerCompCheckNumber() {
        let number = Int.random(in: compCheckCurrentNumber...100)
        compCheckCurrentNumber = number
        resultLabel.text = "\(number)"
    }
    
    @objc func smallerCompCheckNumber() {
        let number = Int.random(in: 1...compCheckCurrentNumber)
        compCheckCurrentNumber = number
        resultLabel.text = "\(number)"
    }
    
}
