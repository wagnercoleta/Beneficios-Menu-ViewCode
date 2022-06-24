//
//  BaseView.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 24/06/22.
//

import UIKit

class BaseView: UIView {

    func addElemented() {
        preconditionFailure("addElemented() has not been implemented")
    }
    
    func setupConstraint() {
        preconditionFailure("setupConstraint() has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElemented()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
