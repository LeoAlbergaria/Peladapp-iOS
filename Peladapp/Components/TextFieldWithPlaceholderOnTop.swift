//
//  TextFieldWithPlaceholderOnTop.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 12/04/24.
//

import UIKit

final class TextFieldWithPlaceholderOnTop: UIView {
    
    lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 4
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var eyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        button.tintColor = .black
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(eyeButtonAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponents(){
        addSubview(placeholderLabel)
        addSubview(textField)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: topAnchor),
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            
            textField.topAnchor.constraint(equalTo: placeholderLabel.bottomAnchor, constant: 6),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setup(forType type: TextFieldType){
        switch type {
        case .email:
            textField.keyboardType = .emailAddress
            textField.textContentType = .emailAddress
            textField.autocapitalizationType = .none
        case .password:
            textField.textContentType = .password
            textField.autocapitalizationType = .none
            textField.isSecureTextEntry = true
            setupPasswordSecureTextButton()
        }
    }
    
    func setupPasswordSecureTextButton(){
        textField.rightView = eyeButton
        textField.rightViewMode = .always
    }
    
    @objc func eyeButtonAction(){
        eyeButton.isSelected.toggle()
        textField.isSecureTextEntry.toggle()
    }
}

enum TextFieldType {
    case email
    case password
}
