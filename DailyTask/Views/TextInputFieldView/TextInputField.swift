//
//  TextInputField.swift
//  DailyTask
//
//  Created by Simon Peter Ojok on 25/07/2023.
//

import UIKit


@IBDesignable class TextInputField: UIView {
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        initializeAndConfigure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeAndConfigure()
    }
    
    private func initializeAndConfigure() {
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
    }
    
    private func loadViewFromNib() -> UIView? {
        let nibName = String(describing: TextInputField.self)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
