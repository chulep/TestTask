//
//  MyCheckViewController.swift
//  TestTask
//
//  Created by Pavel Schulepov on 11.05.2022.
//

import UIKit

class MyCheckViewController: UIViewController {

    var textField = UITextField()
    var button = UIButton()
    var resultLabel = UILabel()
    var allertLabel = UILabel()
    private var compAttempts = Int()
    private var userAttempts = Int()
    private var compNumber = Int()
    private var userNumber = Int()
    
    init(compAttempts: Int) {
        super.init(nibName: nil, bundle: nil)
        self.compAttempts = compAttempts
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        compNumber = Int.random(in: 1...100)
    }
    
    func createUI() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        for i in [textField, button, resultLabel, allertLabel] {
            view.addSubview(i)
            i.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.backgroundColor = .white
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        textField.placeholder = "enter number"
        textField.addTarget(nil, action: #selector(edit), for: .allEvents)
        button.setTitle("Угадать", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(nil, action: #selector(EnterNumberViewController.check), for: .touchUpInside)
        button.alpha = 0.5
        resultLabel.textAlignment = .center
        resultLabel.text = "Введите предполагаемый номер"
        allertLabel.text = ""
        allertLabel.textAlignment = .left
        allertLabel.textColor = .red
        allertLabel.font = UIFont.boldSystemFont(ofSize: 10)
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            resultLabel.heightAnchor.constraint(equalTo: resultLabel.widthAnchor, multiplier: 1/6),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 45),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            textField.heightAnchor.constraint(equalTo: textField.widthAnchor, multiplier: 1/6),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            allertLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 3),
            allertLabel.leftAnchor.constraint(equalTo: textField.leftAnchor),
            allertLabel.rightAnchor.constraint(equalTo: textField.rightAnchor),
            allertLabel.heightAnchor.constraint(equalTo: resultLabel.heightAnchor),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -165),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1/6),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func check() {
        userNumber = Int(textField.text ?? "0") ?? 0
        if userNumber != 0 {
            switch userNumber {
            case _ where userNumber > 100 || userNumber < 0:
                allertLabel.text = "Указанное число вне диапазона 1-100"
            case _ where userNumber > compNumber:
                resultLabel.text = "Меньше"
                allertLabel.text = ""
                userAttempts += 1
            case _ where userNumber < compNumber:
                resultLabel.text = "Больше"
                allertLabel.text = ""
                userAttempts += 1
            case _ where userNumber == compNumber:
                resultLabel.text = "Угадал"
                allertLabel.text = ""
                userAttempts += 1
                self.present(showWinAlert(), animated: true, completion: nil)
            default:
                break
            }
        }
    }
    
    @objc func edit() {
        if textField.text == "" {
            button.alpha = 0.5
            button.isUserInteractionEnabled = false
        } else {
            button.alpha = 1
            button.isUserInteractionEnabled = true
        }
    }
    
    func showWinAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Угадал", message: "Кол-во попыток: \(userAttempts)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Продолжить", style: .default) { action in
            let VC = FinishViewController(userAttempts: self.userAttempts, compAttempts: self.compAttempts)
            VC.modalPresentationStyle = .fullScreen
            self.present(VC, animated: true, completion: nil)
        }
        alert.addAction(action)
        return alert
    }

}
