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
        view.backgroundColor = .white
        
        scoreLabel.text = "Score:"
        myScoreLabel.text = "1"
        compScoreLabel.text = "2"
        winnerLabel.text = "you win"
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            scoreLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            scoreLabel.heightAnchor.constraint(equalTo: scoreLabel.widthAnchor, multiplier: 1/6),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            myScoreLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 65),
            myScoreLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            myScoreLabel.heightAnchor.constraint(equalTo: myScoreLabel.widthAnchor, multiplier: 1/6),
            myScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            compScoreLabel.topAnchor.constraint(equalTo: myScoreLabel.bottomAnchor, constant: 65),
            compScoreLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            compScoreLabel.heightAnchor.constraint(equalTo: compScoreLabel.widthAnchor, multiplier: 1/6),
            compScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            winnerLabel.topAnchor.constraint(equalTo: compScoreLabel.bottomAnchor, constant: 65),
            winnerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            winnerLabel.heightAnchor.constraint(equalTo: winnerLabel.widthAnchor, multiplier: 1/6),
            winnerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
}
