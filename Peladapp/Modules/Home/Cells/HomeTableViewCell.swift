//
//  HomeTableViewCell.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 18/04/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Components
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.circle")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Jogador 1"
        label.font = .boldSystemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var statusCircleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(iconImageView)
        view.addArrangedSubview(nameLabel)
        view.addArrangedSubview(statusCircleView)
        view.axis = .horizontal
        view.spacing = 12
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupComponents()
        setupConstraints()
    }
    
    // MARK: - Setup
    
    private func setupComponents() {
        addSubview(mainStackView)
        backgroundColor = .clear
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            
            statusCircleView.heightAnchor.constraint(equalToConstant: 10),
            statusCircleView.widthAnchor.constraint(equalToConstant: 10),
        ])
    }
    
    func configure(){
    }
}
