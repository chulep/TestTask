//
//  FinishViewController.swift
//  TestTask
//
//  Created by Pavel Schulepov on 11.05.2022.
//

import UIKit

class FinishViewController: UIViewController {
    
    var scoreLabel = UILabel()
    var myScoreLabel = UILabel()
    var compScoreLabel = UILabel()
    var winnerLabel = UILabel()
    var button = UIButton()
    
    init(userAttempts: Int, compAttempts: Int) {
        super.init(nibName: nil, bundle: nil)
        self.compScoreLabel.text = "Попытки компьютера: \(compAttempts)"
        self.myScoreLabel.text = "Мои попытки: \(userAttempts)"
        if userAttempts > compAttempts {
            winnerLabel.text = "Комп выиграл"
        } else {
            winnerLabel.text = "Ты выиграл"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        for i in [scoreLabel, myScoreLabel, compScoreLabel, winnerLabel] {
            i.translatesAutoresizingMaskIntoConstraints = false
            i.textAlignment = .center
            view.addSubview(i)
        }
        button.backgroundColor = .blue
        button.setTitle("Новая игра", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextGame), for: .allEvents)
        view.addSubview(button)
        
        
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            scoreLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            scoreLabel.heightAnchor.constraint(equalTo: scoreLabel.widthAnchor, multiplier: 1/6),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            myScoreLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20),
            myScoreLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            myScoreLabel.heightAnchor.constraint(equalTo: myScoreLabel.widthAnchor, multiplier: 1/6),
            myScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            compScoreLabel.topAnchor.constraint(equalTo: myScoreLabel.bottomAnchor, constant: 20),
            compScoreLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            compScoreLabel.heightAnchor.constraint(equalTo: compScoreLabel.widthAnchor, multiplier: 1/6),
            compScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            winnerLabel.topAnchor.constraint(equalTo: compScoreLabel.bottomAnchor, constant: 20),
            winnerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            winnerLabel.heightAnchor.constraint(equalTo: winnerLabel.widthAnchor, multiplier: 1/6),
            winnerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -165),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            button.heightAnchor.constraint(equalTo: scoreLabel.widthAnchor, multiplier: 1/6),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func nextGame() {
        let VC = EnterNumberViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
    }
    
}
