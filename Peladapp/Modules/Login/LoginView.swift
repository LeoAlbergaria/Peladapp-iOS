//
//  LoginView.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 05/04/24.
//

import UIKit

class LoginView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .boldSystemFont(ofSize: 30.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem-vindo de volta\nSentimos sua falta!"
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 26.0)
        label.textColor = .black.withAlphaComponent(0.4)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 18
        view.axis = .vertical
        view.addArrangedSubview(titleLabel)
        view.addArrangedSubview(subtitleLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var usernameTextField: TextFieldWithPlaceholderOnTop = {
        let textField = TextFieldWithPlaceholderOnTop()
        textField.placeholderLabel.text = "E-mail"
        textField.textField.placeholder = "leonardo@gmail.com"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField: TextFieldWithPlaceholderOnTop = {
        let textField = TextFieldWithPlaceholderOnTop()
        textField.placeholderLabel.text = "Senha"
        textField.textField.placeholder = "******"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var textFieldsStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 14
        view.axis = .vertical
        view.addArrangedSubview(usernameTextField)
        view.addArrangedSubview(passwordTextField)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 66
        view.axis = .vertical
        view.addArrangedSubview(titleStackView)
        view.addArrangedSubview(textFieldsStackView)
        view.addArrangedSubview(UIView())
        view.addArrangedSubview(loginButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents(){
        backgroundColor = .white
        addSubview(mainStackView)
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
