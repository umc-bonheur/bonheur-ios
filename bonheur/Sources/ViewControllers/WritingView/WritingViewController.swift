//
//  WritingViewController.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/28.
//

import UIKit

class WritingViewController: UIViewController {

    let backgroundView: UIView = {
            let bg = UIView()
            bg.backgroundColor = UIColor(red: 0.956, green: 1, blue: 0.892, alpha: 1)
            bg.layer.cornerRadius = 15
            
            return bg
        }()
        
        let textView: UITextView = {
            let tv = UITextView()
            tv.text = "오늘은 어떤 행복한 일이 있었나요?"
            tv.textColor = .lightGray
            tv.font = UIFont(name: "SFPro-Regular", size: 14)
            tv.layer.cornerRadius = 15
            tv.textContainerInset = UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
            
            return tv
        }()
        
        lazy var submitButton: UIButton = {
            let button = UIButton(type: .custom)
            button.setTitle("기록하기", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont(name: "SFPro-Medium", size: 16)
            button.layer.cornerRadius = 13
            
            button.backgroundColor = UIColor(red: 0.743, green: 0.75, blue: 0.743, alpha: 1)
            
            button.isEnabled = false
            button.addTarget(self, action: #selector(submitButtonDidTapped), for: .touchUpInside)
            
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "오늘의 행복"
        setup()
        makeAutoLayout()
        
        textView.delegate = self
    }
    
    func setup() {
            backgroundView.addSubview(textView)
            
            view.addSubview(backgroundView)
            view.addSubview(textView)
            view.addSubview(submitButton)
            
            view.backgroundColor = .white
            
        }
        
    func makeAutoLayout() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 104),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -108),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 251),
            textView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 19),
            textView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -19),
            textView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20)
        ])
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: textView.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 18),
            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -37),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 62),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -62)
        ])
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func submitButtonDidTapped() {
            navigationController?.popViewController(animated: true)
    }

}
