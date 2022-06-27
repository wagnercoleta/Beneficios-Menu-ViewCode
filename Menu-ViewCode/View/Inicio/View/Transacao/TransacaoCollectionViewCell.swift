//
//  TransacaoCollectionViewCell.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 27/06/22.
//

import UIKit

class TransacaoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TransacaoCollectionViewCell"
 
    private var viewCell: TransacaoItemView!
    
    private func addElemented() {
        self.viewCell = TransacaoItemView()
        self.viewCell.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.viewCell)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.contentView.leadingAnchor.constraint(equalTo: self.viewCell.leadingAnchor),
            self.contentView.topAnchor.constraint(equalTo: self.viewCell.topAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.viewCell.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.viewCell.bottomAnchor)
            
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElemented()
        self.setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(_ model: TransacaoModel) {
        self.viewCell.setup(model)
    }
}
