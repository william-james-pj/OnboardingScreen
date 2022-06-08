//
//  SlideScreen2.swift
//  OnboardingScreen
//
//  Created by Pinto Junior, William James on 07/06/22.
//

import UIKit

class SlideScreen2: UIView {
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewStackAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let imageViewPrimary: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    fileprivate let stackText: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let labelTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: "Card")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelSubTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(named: "Card")
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let viewImageAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate lazy var buttonStart: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get started", for: .normal)
        button.setTitleColor(UIColor.darkText, for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    func configView(backgroudColor: UIColor, title: String, subTitle: String, image: UIImage) {
        self.backgroundColor = backgroudColor
        self.labelTitle.text = title
        self.labelSubTitle.text = subTitle
        self.imageViewPrimary.image = image
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        
        stackBase.addArrangedSubview(imageViewPrimary)
        
        stackBase.addArrangedSubview(stackText)
        stackText.addArrangedSubview(labelTitle)
        stackText.addArrangedSubview(labelSubTitle)
        
        stackText.addArrangedSubview(viewImageAux)
        viewImageAux.addSubview(buttonStart)
        
        stackBase.addArrangedSubview(viewStackAux)
        
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 56),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageViewPrimary.heightAnchor.constraint(equalToConstant: 150),
            
            viewImageAux.heightAnchor.constraint(equalToConstant: 50),
            
            buttonStart.widthAnchor.constraint(equalToConstant: 120),
            buttonStart.topAnchor.constraint(equalTo: viewImageAux.topAnchor),
            buttonStart.bottomAnchor.constraint(equalTo: viewImageAux.bottomAnchor),
            buttonStart.centerXAnchor.constraint(equalTo: viewImageAux.centerXAnchor),
        
        ])
    }
}

