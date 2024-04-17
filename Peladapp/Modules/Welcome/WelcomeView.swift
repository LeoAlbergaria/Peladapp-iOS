//
//  WelcomeView.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 15/04/24.
//

import UIKit

protocol WelcomeViewDelegate: AnyObject {
    func registerButtonClick()
    func loginButtonClick()
}

class WelcomeView: UIView {
    
    weak var delegate: WelcomeViewDelegate?
    
    // MARK: - Components
    
    lazy var appLogoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "soccerball.inverse"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem-vindo ao\nPeladapp!"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 30.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Seu app para organizar e\nmarcar sua pelada de lei"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 8
        view.axis = .vertical
        view.addArrangedSubview(titleLabel)
        view.addArrangedSubview(subtitleLabel)
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 24
        view.axis = .vertical
        view.addArrangedSubview(loginButton)
        view.addArrangedSubview(registerButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 60
        view.axis = .vertical
        view.addArrangedSubview(titleStackView)
        view.addArrangedSubview(buttonStackView)
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
    
    // MARK: - Setup
    func setupComponents(){
        backgroundColor = .white
        addSubview(appLogoImageView)
        addSubview(mainStackView)
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            appLogoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            appLogoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            appLogoImageView.heightAnchor.constraint(equalToConstant: 160),
            appLogoImageView.widthAnchor.constraint(equalToConstant: 160),
            
            mainStackView.topAnchor.constraint(equalTo: appLogoImageView.bottomAnchor, constant: 50),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            mainStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    //MARK: -  Actions
    
    @objc func registerAction(){
        delegate?.registerButtonClick()
    }
    
    @objc func loginAction(){
        delegate?.loginButtonClick()
    }
}

