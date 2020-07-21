//
//  AddViewController.swift
//  TestServer REST API Test
//
//  Created by 김기현 on 2020/07/21.
//  Copyright © 2020 김기현. All rights reserved.
//

import UIKit
import Alamofire

class AddViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textViewSetup()
        setToolbar()
        
    }
    
    func textViewSetup() {
        contentTextView.layer.borderWidth = 1
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
        contentTextView.text = "내용입력"
        contentTextView.textColor = UIColor.lightGray
        
        contentTextView.delegate = self
    }
    
    func setToolbar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
    }

    @objc func save() {
        let alertController = UIAlertController(title: "저장", message: "저장하시겠습니까?", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "확인", style: .default) { (reuslt) in
            
        }
        
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
        
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddViewController: UITextViewDelegate {
    func setupTextView() {
        if contentTextView.text == "내용입력" {
            contentTextView.text = ""
            contentTextView.textColor = UIColor.black
        } else if contentTextView.text == "" {
            contentTextView.text = "내용입력"
            contentTextView.textColor = UIColor.lightGray
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        setupTextView()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if contentTextView.text == "" {
            setupTextView()
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            contentTextView.resignFirstResponder()
        }
        
        return true
    }
}
