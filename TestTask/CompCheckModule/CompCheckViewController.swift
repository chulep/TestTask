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
    var stackView = UIStackView()
    private var userNumber = Int()
    private var leftNumber = 1
    private var rightNumber = 100
    private var compNumber = Int()
    private var attempts = Int()
    private var compBrainArray = [Int]()
    
    
    init(number: Int) {
        super.init(nibName: nil, bundle: nil)
        self.userNumber = number
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
        buttonBigger.setTitle("Больше", for: .normal)
        buttonSmaller.setTitle("Меньше", for: .normal)
        
        for s in [buttonSmaller, buttonBigger] {
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
    
    func compCheckNumber() {
        compNumber = Int.random(in: leftNumber...rightNumber)
    counter: for _ in compBrainArray {
        if compBrainArray.contains(compNumber) {
                compNumber = Int.random(in: leftNumber...rightNumber)
                continue counter
            }
        }
        compBrainArray.append(compNumber)
        
        attempts += 1
        resultLabel.text = "\(compNumber)"
        print("загаданное \(userNumber), предлагаемое \(compNumber), \(leftNumber)...\(rightNumber)")
        print("Мозг: \(compBrainArray)")
        if compNumber == userNumber {
            self.present(showWinAlert(), animated: true, completion: nil)
        }
    }
    
    @objc func biggerCompCheckNumber() {
        if userNumber > compNumber {
            leftNumber = compNumber
            compCheckNumber()
        }
    }
    
    @objc func smallerCompCheckNumber() {
        if userNumber < compNumber {
            rightNumber = compNumber
            compCheckNumber()
        }
    }
    
    func showWinAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Угадал", message: "Кол-во попыток: \(attempts)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Продолжить", style: .default) { action in
            let VC = MyCheckViewController()
            VC.modalPresentationStyle = .fullScreen
            self.present(VC, animated: true, completion: nil)
        }
        alert.addAction(action)
        return alert
    }
    
}
