//
//  WritingViewController+TextViewDelegate.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/28.
//

import UIKit

extension WritingViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "오늘은 어떤 행복한 일이 있었나요?"
            textView.textColor = .lightGray

            self.submitButton.backgroundColor = UIColor(red: 0.743, green: 0.75, blue: 0.743, alpha: 1)
            self.submitButton.isEnabled = false
        } else {
            self.submitButton.backgroundColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
            self.submitButton.isEnabled = true
        }
    }
}
