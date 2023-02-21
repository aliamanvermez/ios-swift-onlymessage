//
//  ViewController.swift
//  OnlyMessage
//
//  Created by Ali Amanvermez on 19.02.2023.
//

import UIKit
import SnapKit
class OMLoginViewController: UIViewController {

    var textFieldEmail = UITextField()
    var textFieldPassword = UITextField()
    var buttonSignUp = UIButton()
    var buttonLogIn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bg_login")
        view.addSubviews(textFieldEmail,textFieldPassword,textFieldPassword,buttonLogIn,buttonSignUp)
        createUI()
    }
    
    func createUI() {
        textFieldEmail.borderStyle = .line
        textFieldEmail.layer.borderColor = UIColor.systemGray.cgColor
        textFieldEmail.placeholder = "Email"
        textFieldEmail.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.top.equalToSuperview().offset(100)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        textFieldPassword.borderStyle = .line
        textFieldPassword.layer.borderColor = UIColor.systemGray.cgColor
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.placeholder = "Password"
        textFieldPassword.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.top.equalTo(textFieldEmail.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        buttonLogIn.setRoundedButton(button: buttonLogIn)
        buttonLogIn.setTitle("Log In", for: .normal)
        buttonLogIn.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.top.equalTo(textFieldPassword.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        buttonSignUp.setTitle("Sign Up", for: .normal)
        buttonSignUp.setTitleColor(UIColor.systemBlue, for: .normal)
        buttonSignUp.addTarget(self, action: #selector(buttonSignUpClicked), for: .touchUpInside)
        buttonSignUp.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.top.equalTo(buttonLogIn.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    @objc func buttonSignUpClicked(){
        let vc = OMSignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }


}

