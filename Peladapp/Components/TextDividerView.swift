//
//  TextDividerView.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 18/04/24.
//

import UIKit

final class TextDividerView: UIView {
    
    lazy var leftLineView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rightLineView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 12
        view.addArrangedSubview(leftLineView)
        view.addArrangedSubview(textLabel)
        view.addArrangedSubview(rightLineView)
        view.alignment = .center
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
    
    private func setupComponents(){
        addSubview(mainStackView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            leftLineView.widthAnchor.constraint(equalTo: rightLineView.widthAnchor)
        ])
    }
    
    func setup(withText text: String){
        textLabel.text = text
    }
}
