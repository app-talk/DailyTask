//
//  TextInputField.swift
//  DailyTask
//
//  Created by Simon Peter Ojok on 25/07/2023.
//

import UIKit


@IBDesignable class TextInputField: UIView {
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var textInputContainer: UIView!
    @IBOutlet weak var leadingTagImage: UIImageView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var tailingTagImage: UIButton!
    
    @IBInspectable var supportsTextVisibility: Bool = false
    
    @IBInspectable var titleLabel: String {
        set(value) { inputLabel.text = value }
        get { inputLabel.text.orEmpty() }
    }
    
    @IBInspectable var placeholderText: String {
        set(value) { inputTextField.placeholder = value }
        get { inputTextField.placeholder.orEmpty() }
    }
    
    @IBInspectable var leadingImage: UIImage? {
        set(value) { leadingTagImage.image = value }
        get { leadingTagImage.image }
    }
    
    @IBInspectable var trailingImage: UIImage? {
        set(value) { tailingTagImage.setImage(value, for: .normal) }
        get { tailingTagImage.image(for: .normal) }
    }
    
    @IBInspectable var cornerRadius: Int {
        set(value) { textInputContainer.layer.cornerRadius = CGFloat(value) }
        get { Int(textInputContainer.layer.cornerRadius) }
    }
    
    @IBInspectable var isSecureTextEntry: Bool {
        set(value) { inputTextField.isSecureTextEntry = value }
        get { inputTextField.isSecureTextEntry }
    }
    
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        initializeAndConfigure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeAndConfigure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        inputLabel.prepareForInterfaceBuilder()
        textInputContainer.prepareForInterfaceBuilder()
        leadingTagImage.prepareForInterfaceBuilder()
        inputTextField.prepareForInterfaceBuilder()
        tailingTagImage.prepareForInterfaceBuilder()
        
        update()
    }
    
    func update() {
        tailingTagImage.isHidden = !supportsTextVisibility
    }
    
    func initializeAndConfigure() {
        guard let view = loadViewFromNib() else { return }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = bounds
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        update()
    }
    
    private func loadViewFromNib() -> UIView? {
        let nibName = String(describing: TextInputField.self)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
