//
//  JoinPeladaView.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 18/04/24.
//

import UIKit

protocol JoinPeladaViewDelegate: AnyObject {
}

class JoinPeladaView: UIView {
    
    weak var delegate: JoinPeladaViewDelegate?
    
    // MARK: - Components
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pelada"
        label.font = .boldSystemFont(ofSize: 30.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Percebemos que você não\npossui uma pelada ainda!"
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
    
    lazy var createPeladaButton: UIButton = {
        let button = UIButton()
        button.setTitle("Criar minha pelada", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
//        button.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var dividerView: TextDividerView = {
        let view = TextDividerView()
        view.setup(withText: "OR")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var peladaCodeTextField: TextFieldWithPlaceholderOnTop = {
        let textField = TextFieldWithPlaceholderOnTop()
        textField.placeholderLabel.text = "Código"
        textField.textField.placeholder = "XXX-XXX"
//        textField.setup(forType: .email)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var joinButton: UIButton = {
        let button = UIButton()
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var selectionStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 25
        view.axis = .vertical
        view.addArrangedSubview(createPeladaButton)
        view.addArrangedSubview(dividerView)
        view.addArrangedSubview(peladaCodeTextField)
        view.addArrangedSubview(joinButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 100
        view.axis = .vertical
        view.addArrangedSubview(titleStackView)
        view.addArrangedSubview(selectionStackView)
        view.addArrangedSubview(UIView())
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
        addSubview(mainStackView)
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            createPeladaButton.heightAnchor.constraint(equalToConstant: 50),
            joinButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func loginAction(){
//        guard let email = usernameTextField.textField.text,
//              let password = passwordTextField.textField.text else { return }
//        delegate?.loginAction(email: email, password: password)
    }
}

