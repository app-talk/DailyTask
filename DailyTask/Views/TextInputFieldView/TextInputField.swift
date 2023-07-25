//
//  TextInputField.swift
//  DailyTask
//
//  Created by Simon Peter Ojok on 25/07/2023.
//

import UIKit

class TextInputField: UIView {
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        let view = loadNib()
        addSubview(view)
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.topAnchor.constraint(equalTo: topAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    private func loadNib() -> UIView {
        let bundleName = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundleName)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! UIView
        return view
    }

}
