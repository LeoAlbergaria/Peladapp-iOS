//
//  UserView.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 22/04/24.
//

import UIKit

protocol UserViewDelegate: AnyObject {
    func logoutAction()
}

class UserView: UIView {
    
    weak var delegate: UserViewDelegate?
    
    // MARK: - Components
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "User"
        label.font = .boldSystemFont(ofSize: 30.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sair", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 26
        view.axis = .vertical
        view.addArrangedSubview(titleLabel)
        view.addArrangedSubview(logoutButton)
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
        ])
    }
    
    @objc func logoutAction(){
        delegate?.logoutAction()
    }
}


