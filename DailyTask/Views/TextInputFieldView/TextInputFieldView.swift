//
//  TextInputFieldView.swift
//  DailyTask
//
//  Created by Simon Peter Ojok on 24/07/2023.
//

import UIKit

@IBDesignable
class TextInputFieldView: UIView {
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "Full Name"
        label.textColor = UIColor(named: "LabelColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textInputBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "TextInputBackground")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var textInputStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var leadingImageIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "UserTag"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var editTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Type Email", attributes: [.foregroundColor : UIColor.white])

        textField.textColor = .white
        textField.textAlignment = .left
        return textField
    }()
    
    private lazy var passwordImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        return image
    }()
    
    @IBInspectable var isSecureTextField: Bool = false {
        didSet {
            initializeAndConfigure()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeAndConfigure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeAndConfigure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initializeAndConfigure()
        textLabel.prepareForInterfaceBuilder()
        textInputBackground.prepareForInterfaceBuilder()
        textInputStack.prepareForInterfaceBuilder()
        leadingImageIcon.prepareForInterfaceBuilder()
        editTextField.prepareForInterfaceBuilder()
        passwordImageView.prepareForInterfaceBuilder()
    }
    
    
    private func initializeAndConfigure() {
        addSubview(textLabel)
        addSubview(textInputBackground)
        
        textInputBackground.addSubview(textInputStack)
        
        editTextField.isSecureTextEntry = isSecureTextField
        if isSecureTextField {
            passwordImageView.image = UIImage(systemName: "eye")
        }
        
        textInputStack.addArrangedSubview(leadingImageIcon)
        textInputStack.addArrangedSubview(editTextField)
        
        if isSecureTextField {
            textInputStack.addArrangedSubview(passwordImageView)
        }
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: textLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textInputBackground.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            textInputBackground.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 9),
            textInputBackground.trailingAnchor.constraint(equalTo: textLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textInputStack.topAnchor.constraint(equalTo: textInputBackground.topAnchor, constant: 17),
            textInputStack.leadingAnchor.constraint(equalTo: textInputBackground.leadingAnchor, constant: 18),
            textInputBackground.trailingAnchor.constraint(equalTo: textInputStack.trailingAnchor, constant: 18),
            textInputBackground.bottomAnchor.constraint(equalTo: textInputStack.bottomAnchor, constant: 17)
        ])
        
        NSLayoutConstraint.activate([
            leadingImageIcon.heightAnchor.constraint(equalToConstant: 30),
            leadingImageIcon.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        if isSecureTextField {
            NSLayoutConstraint.activate([
                passwordImageView.heightAnchor.constraint(equalToConstant: 30),
                passwordImageView.widthAnchor.constraint(equalToConstant: 30)
            ])
        }
        
    }

}
