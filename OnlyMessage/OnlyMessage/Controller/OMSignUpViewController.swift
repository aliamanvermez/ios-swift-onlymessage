//
//  OMSignUpViewController.swift
//  OnlyMessage
//
//  Created by Ali Amanvermez on 20.02.2023.
//

import UIKit
import FirebaseAuth
import Photos
import PhotosUI
class OMSignUpViewController: UIViewController{
    
    var imageViewProfileImage = UIImageView()
    var textFieldEmail = UITextField()
    var textFieldPassword = UITextField()
    var textFieldAgainPassword = UITextField()
    var textFieldName = UITextField()
    var textFieldSurname = UITextField()
    var textFieldUsername = UITextField()
    var buttonSignUp = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(imageViewProfileImage,textFieldEmail,textFieldPassword,textFieldName,textFieldSurname,textFieldUsername,textFieldAgainPassword, buttonSignUp)
        view.backgroundColor = UIColor(named: "bg_login")
        createUI()
    }
    
    func createUI() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewProfileImageTapped))
        imageViewProfileImage.addGestureRecognizer(tapGestureRecognizer)
        imageViewProfileImage.image = UIImage(named: "image_user_empty")
        imageViewProfileImage.contentMode = .scaleAspectFill
        imageViewProfileImage.isUserInteractionEnabled = true
        imageViewProfileImage.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalToSuperview().offset(100)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        textFieldEmail.borderStyle = .line
        textFieldEmail.layer.borderColor = UIColor.systemBlue.cgColor
        textFieldEmail.backgroundColor = .cyan
        textFieldEmail.placeholder = "Email"
        textFieldEmail.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.top.equalTo(imageViewProfileImage.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        textFieldUsername.borderStyle = .line
        textFieldUsername.layer.borderColor = UIColor.systemGray.cgColor
        textFieldUsername.placeholder = "Username"
        textFieldUsername.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.top.equalTo(textFieldEmail.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        textFieldName.borderStyle = .line
        textFieldName.layer.borderColor = UIColor.systemGray.cgColor
        textFieldName.placeholder = "Name"
        textFieldName.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.top.equalTo(textFieldUsername.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        textFieldSurname.borderStyle = .line
        textFieldSurname.layer.borderColor = UIColor.systemGray.cgColor
        textFieldSurname.placeholder = "Surname"
        textFieldSurname.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.top.equalTo(textFieldName.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        
        
        textFieldPassword.borderStyle = .line
        textFieldPassword.layer.borderColor = UIColor.systemBlue.cgColor
        textFieldPassword.backgroundColor = .cyan
        textFieldPassword.placeholder = "Password"
        textFieldPassword.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.top.equalTo(textFieldSurname.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        textFieldAgainPassword.borderStyle = .line
        textFieldAgainPassword.layer.borderColor = UIColor.systemGray.cgColor
        textFieldAgainPassword.placeholder = "Verify password"
        textFieldAgainPassword.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.top.equalTo(textFieldPassword.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        buttonSignUp.setRoundedButton(button: buttonSignUp)
        buttonSignUp.setTitle("Sign Up", for: .normal)
        buttonSignUp.addTarget(self, action: #selector(buttonSignUpClicked), for: .touchUpInside)
        buttonSignUp.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.top.equalTo(textFieldAgainPassword.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
    }
    @objc func buttonSignUpClicked() {
        if textFieldEmail != nil && textFieldPassword != nil {
            Auth.auth().createUser(withEmail: textFieldEmail.text!, password: textFieldPassword.text!) { data, error in
                if error != nil {
                    print(error?.localizedDescription ?? "Error")
                } else {
                    print("Giriş Yapıldı")
                }
            }
        }
        
        let vc = OMLoginViewController()
        present(vc, animated: true)
        
    }
    
    
    @objc func imageViewProfileImageTapped() {
        var configuration = PHPickerConfiguration()
             configuration.filter = .images
             configuration.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configuration)
        let pickerDelegate = PHPickerDelegate()
             picker.delegate = pickerDelegate
             present(picker, animated: true)
    }
    


}

