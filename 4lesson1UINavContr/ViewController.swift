//
//  ViewController.swift
//  4lesson1UINavContr
//
//  Created by Aiturgan Kurmanbekova on 9/2/24.
//

import UIKit

class ViewController: UIViewController {
    private let boysImage: UIImageView = {
        let image = UIImageView()
        image.image = .boy
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let firstLabel: UILabel = {
        let firstLabel = UILabel()
        firstLabel.text = "Welcome Back"
        firstLabel.font = .systemFont(ofSize: 30, weight: .bold)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        return firstLabel
    }()
    
    private let secondLabel: UILabel = {
        let secondLabel = UILabel()
        secondLabel.text = "Sign in to continue"
        secondLabel.font = .systemFont(ofSize: 16, weight: .regular)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        return secondLabel
    }()
    
    private let whiteBottomView: UIView = {
        let whiteBottomView = UIView()
        whiteBottomView.backgroundColor = .white
        whiteBottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        whiteBottomView.layer.cornerRadius = 20
        whiteBottomView.translatesAutoresizingMaskIntoConstraints = false
        return whiteBottomView
    }()
    
    private let employeeLabel: UILabel = {
        let employeeLabel = UILabel()
        employeeLabel.text = "Employee id/Email"
        employeeLabel.font = .systemFont(ofSize: 12, weight: .regular)
        employeeLabel.textColor = UIColor(hex: "#A5A5A5")
        employeeLabel.translatesAutoresizingMaskIntoConstraints = false
        return employeeLabel
    }()
    
    private var employeeTF: UITextField = {
        let employeeTF = UITextField()
        employeeTF.placeholder = "erp1253@gmail.com"
        employeeTF.translatesAutoresizingMaskIntoConstraints = false
        employeeTF.addTarget(nil, action: #selector(check), for: .editingChanged)
        return employeeTF
    }()
    
    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.font = .systemFont(ofSize: 12, weight: .regular)
        passwordLabel.textColor = UIColor(hex: "#A5A5A5")
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
    
    private let passwordTF: UITextField = {
        let passwordTF = UITextField()
        passwordTF.placeholder = "123456789"
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.addTarget(nil, action: #selector(check), for: .editingChanged)
        return passwordTF
    }()
    
    private let eyeButton: UIButton = {
        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(.eye, for: .normal)
        eyeButton.tintColor = .systemGray
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.addTarget(nil, action: #selector(eyeBtnTppd), for: .touchUpInside)
        return eyeButton
    }()
    
    private let forgotPswBtn: UIButton = {
        let forgotPswBtn = UIButton(type: .system)
        forgotPswBtn.setTitle("Forgot Password?", for: .normal)
        forgotPswBtn.setTitleColor(.systemBlue, for: .normal)
        forgotPswBtn.translatesAutoresizingMaskIntoConstraints = false
        return forgotPswBtn
    }()
    
    private let checkButton: UIButton = {
        let checkButton = UIButton(type: .system)
        checkButton.setImage(.check, for: .normal)
        checkButton.tintColor = .white
        checkButton.layer.borderWidth = 1
        checkButton.layer.borderColor = UIColor.black.cgColor
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.addTarget(nil, action: #selector(checkBtnTppd), for: .touchUpInside)
        return checkButton
    }()
    
    private let checkLabel: UILabel = {
        let checkLabel = UILabel()
        checkLabel.text = "Remember Me"
        checkLabel.font = .systemFont(ofSize: 18, weight: .bold)
        checkLabel.translatesAutoresizingMaskIntoConstraints = false
        return checkLabel
    }()
    
    private let signInButton: UIButton = {
        let signInButton = UIButton(type: .system)
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.layer.cornerRadius = 14
        signInButton.backgroundColor = .blue
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(nil, action: #selector(signInBtnTppd), for: .touchUpInside)
        return signInButton
    }()
    
    private let newAccountLabel: UILabel = {
        let newAccLabel = UILabel()
        newAccLabel.text = "Don't have an Account?"
        newAccLabel.font = .systemFont(ofSize: 13, weight: .medium)
        newAccLabel.translatesAutoresizingMaskIntoConstraints = false
        return newAccLabel
    }()
    
    private let signUpButton: UIButton = {
        let signUpBtn = UIButton(type: .system)
        signUpBtn.setTitle("Sign Up", for: .normal)
        signUpBtn.setTitleColor(.systemBlue, for: .normal)
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        return signUpBtn
    }()
    
    let errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.text = "Please, fill in all Fields!(<5)"
        errorLabel.font = .systemFont(ofSize: 12, weight: .bold)
        errorLabel.textColor = .white
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()
    
    @objc func check() {
        textFieldValueValidate(textField: employeeTF)
        textFieldValueValidate(textField: passwordTF)
        
        if employeeTF.text?.count ?? 0 >= 5 && passwordTF.text?.count ?? 0 >= 5 {
            signInBtnTppd()
        } else {
            errorLabel.textColor = .systemGray
        }
    }
    
    private func textFieldValueValidate(textField: UITextField) {
        if textField.text?.count ?? 0 <= 5 {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.systemGray6.cgColor
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#048494")
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(boysImage)
        NSLayoutConstraint.activate(
            [boysImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
             boysImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
             boysImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             boysImage.heightAnchor.constraint(equalToConstant: 256),
             boysImage.widthAnchor.constraint(equalToConstant: 350)
            ])
        
        view.addSubview(firstLabel)
        NSLayoutConstraint.activate(
            [firstLabel.topAnchor.constraint(equalTo: boysImage.bottomAnchor),
             firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             firstLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        view.addSubview(secondLabel)
        NSLayoutConstraint.activate(
            [secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor),
             secondLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             secondLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        view.addSubview(whiteBottomView)
        NSLayoutConstraint.activate(
            [whiteBottomView.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 10),
             whiteBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             whiteBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             whiteBottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             whiteBottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3/5)
            ])
        
        whiteBottomView.addSubview(employeeLabel)
        NSLayoutConstraint.activate(
            [employeeLabel.topAnchor.constraint(equalTo: whiteBottomView.topAnchor, constant: 40),
             employeeLabel.leadingAnchor.constraint(equalTo: whiteBottomView.leadingAnchor, constant: 23),
             employeeLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        whiteBottomView.addSubview(employeeTF)
        NSLayoutConstraint.activate(
            [employeeTF.topAnchor.constraint(equalTo: employeeLabel.bottomAnchor, constant: 16),
             employeeTF.leadingAnchor.constraint(equalTo: whiteBottomView.leadingAnchor, constant: 23),
             employeeTF.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        whiteBottomView.addSubview(passwordLabel)
        NSLayoutConstraint.activate(
            [passwordLabel.topAnchor.constraint(equalTo: employeeTF.bottomAnchor, constant: 45),
             passwordLabel.leadingAnchor.constraint(equalTo: whiteBottomView.leadingAnchor, constant: 23),
             passwordLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        whiteBottomView.addSubview(passwordTF)
        NSLayoutConstraint.activate(
            [passwordTF.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 16),
             passwordTF.leadingAnchor.constraint(equalTo: whiteBottomView.leadingAnchor, constant: 23),
             passwordTF.heightAnchor.constraint(equalToConstant: 20),
             passwordTF.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        whiteBottomView.addSubview(errorLabel)
        whiteBottomView.addSubview(forgotPswBtn)
        NSLayoutConstraint.activate(
            [errorLabel.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 5),
             errorLabel.leadingAnchor.constraint(equalTo: whiteBottomView.leadingAnchor, constant: 23)
            ])
        
        whiteBottomView.addSubview(eyeButton)
        NSLayoutConstraint.activate(
            [eyeButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 16),
             eyeButton.trailingAnchor.constraint(equalTo: whiteBottomView.trailingAnchor, constant: -23),
             eyeButton.heightAnchor.constraint(equalToConstant: 18),
             eyeButton.widthAnchor.constraint(equalToConstant: 18)
            ])
        
        whiteBottomView.addSubview(forgotPswBtn)
        NSLayoutConstraint.activate(
            [forgotPswBtn.topAnchor.constraint(equalTo: eyeButton.bottomAnchor, constant: 18),
             forgotPswBtn.trailingAnchor.constraint(equalTo: whiteBottomView.trailingAnchor, constant: -23),
             forgotPswBtn.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        whiteBottomView.addSubview(checkButton)
        NSLayoutConstraint.activate(
            [checkButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 40),
             checkButton.leadingAnchor.constraint(equalTo: whiteBottomView.leadingAnchor, constant: 23),
             checkButton.heightAnchor.constraint(equalToConstant: 20),
             checkButton.widthAnchor.constraint(equalToConstant: 20)
            ])
        
        whiteBottomView.addSubview(checkLabel)
        NSLayoutConstraint.activate(
            [checkLabel.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 40),
             checkLabel.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 10),
             checkLabel.heightAnchor.constraint(equalToConstant: 20),
             checkLabel.widthAnchor.constraint(equalToConstant: 125)
            ])
        
        whiteBottomView.addSubview(signInButton)
        NSLayoutConstraint.activate(
            [signInButton.topAnchor.constraint(equalTo: checkLabel.bottomAnchor, constant: 40),
             signInButton.centerXAnchor.constraint(equalTo: whiteBottomView.centerXAnchor),
             signInButton.heightAnchor.constraint(equalToConstant: 40),
             signInButton.widthAnchor.constraint(equalToConstant: 168)
            ])
        
        whiteBottomView.addSubview(newAccountLabel)
        NSLayoutConstraint.activate(
            [newAccountLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 50),
             newAccountLabel.leadingAnchor.constraint(equalTo: whiteBottomView.leadingAnchor, constant: 23),
             newAccountLabel.heightAnchor.constraint(equalToConstant: 16)
            ])
        
        whiteBottomView.addSubview(signUpButton)
        NSLayoutConstraint.activate(
            [signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 50),
             signUpButton.leadingAnchor.constraint(equalTo: newAccountLabel.trailingAnchor),
             signUpButton.heightAnchor.constraint(equalToConstant: 16)
            ])
        
    }
    
    @objc private func signInBtnTppd() {
        if employeeTF.layer.borderColor == UIColor.systemGray6.cgColor
            && passwordTF.layer.borderColor == UIColor.systemGray6.cgColor && checkButton.tintColor == .systemBlue {
            let vc = SuccessVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func checkBtnTppd() {
        checkButton.tintColor = .systemBlue
    }
    
    @objc func eyeBtnTppd() {
        eyeButton.tintColor = .black
        passwordTF.text = "******"
        
    }

}

