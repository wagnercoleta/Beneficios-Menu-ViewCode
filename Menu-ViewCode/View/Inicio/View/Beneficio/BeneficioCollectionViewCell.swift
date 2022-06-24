//
//  BeneficioCollectionViewCell.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 24/06/22.
//

import UIKit

class BeneficioCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BeneficioCollectionViewCell"
    
    private var viewCell: BeneficioItemView!
    
    private func addElemented() {
        self.viewCell = BeneficioItemView()
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
    
    public func setup(_ beneficioItem: BeneficioItem) {
        self.viewCell.setup(imageName: beneficioItem.imageName,
                            value: beneficioItem.value,
                            description: beneficioItem.description,
                            backgroudColor: beneficioItem.backgroudColor)
    }
}
