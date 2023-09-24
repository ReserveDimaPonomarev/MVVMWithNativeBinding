//
//  ViewController.swift
//  TestMVVM
//
//  Created by Дмитрий Пономарев on 30.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    var count = 0
    let button = UIButton()
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(label)
        makeActionForButton()
        setViews()
        bind()
    }
    
    func setViews() {
        button.center = view.center
        button.backgroundColor = .blue
        button.bounds.size = CGSize(width: 200, height: 70)
        button.layer.cornerRadius = 35
        button.clipsToBounds = true
        button.setTitle("Press me", for: .normal)
        
        label.text = "Count of presses"
        label.textColor = .black
        label.bounds.size = CGSizeMake(300, 100)
        label.textAlignment = .center
        label.center = view.center
        label.font = .boldSystemFont(ofSize: 30)
        label.center.y = button.center.y + 200
        label.numberOfLines = 0
        
    }
    
    func bind() {
        viewModel.observer.listener { [weak self] model in
            guard self?.label.text != nil else { return }
            self?.label.text = "Count of presses \(model.count)"
        }
    }
    
    func makeActionForButton() {
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    @objc func tap() {
        count += 1
        viewModel.makeNew(count: count)
    }
}

