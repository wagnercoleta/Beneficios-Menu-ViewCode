//
//  ItemBeneficioView.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 24/06/22.
//

import UIKit

class BeneficioItemView: BaseView {
    
    private struct Matrics {
        static let space: CGFloat = 25.0
        static let heightBoxView: CGFloat = 200
        static let widthBoxView: CGFloat = 150
        static let heightWidthImageView: CGFloat = 45
    }
    
    private lazy var boxView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.borderColor = CustomColor.Main?.cgColor
        view.backgroundColor = CustomColor.Main
        return view
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        return image
    }()
    
    private lazy var labelValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: CustomFont.SizeDefault, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: CustomFont.SizeDefault, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    override func addElemented() {
        self.stack.addArrangedSubview(self.labelValue)
        self.stack.addArrangedSubview(self.labelDescription)
        self.boxView.addSubview(self.imageView)
        self.boxView.addSubview(self.stack)
        addSubview(self.boxView)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.boxView.topAnchor.constraint(equalTo: self.topAnchor),
            self.boxView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.boxView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.boxView.heightAnchor.constraint(equalToConstant: Matrics.heightBoxView),
            self.boxView.widthAnchor.constraint(equalToConstant: Matrics.widthBoxView),
            
            self.imageView.topAnchor.constraint(equalTo: self.boxView.topAnchor, constant: Matrics.space),
            self.imageView.leadingAnchor.constraint(equalTo: self.boxView.leadingAnchor, constant: Matrics.space),
            self.imageView.widthAnchor.constraint(equalToConstant: Matrics.heightWidthImageView),
            self.imageView.heightAnchor.constraint(equalToConstant: Matrics.heightWidthImageView),
            
            self.stack.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            self.stack.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor),
            self.stack.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor),
            self.stack.bottomAnchor.constraint(equalTo: self.boxView.bottomAnchor, constant: -Matrics.space)
        ])
    }
   
    public func setup(imageName: String, value: Decimal, description: String, backgroudColor: UIColor) {
        self.imageView.image = UIImage(systemName: "\(imageName)")
        self.labelValue.text = formattedValue(value)
        self.labelDescription.text = description
        self.boxView.backgroundColor = UIColor(cgColor: backgroudColor.cgColor)
    }
}
