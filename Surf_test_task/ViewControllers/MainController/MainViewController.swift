//
//  MainViewController.swift
//  Surf_test_task
//
//  Created by Vladimir Beliakov on 09.02.2023.
//

import UIKit

final class MainViewController: UIViewController {

    private let baseView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.sendRequestButtonPassesToVC().addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
        view.addSubview(baseView)
        
    }
    
    @objc private func sendButtonPressed() {
        let alert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно принята!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Отлично!", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
