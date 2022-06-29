//
//  PerfilMenuItemView.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 28/06/22.
//

import UIKit

class PerfilMenuItemView: BaseView {

    private struct Matrics {
        static let space: CGFloat = 10.0
        static let spaceImage: CGFloat = 3.5
        static let heightBoxView: CGFloat = 40
        static let widthBoxView: CGFloat = 400
        static let imageWidthHeight: CGFloat = 30.0
        static let heightLine: CGFloat = 0.4
    }
    
    private lazy var boxView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        return image
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: CustomFont.SizeDefault, weight: .bold)
        label.text = "Conta"
        label.textColor = CustomColor.Second
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.Main
        return view
    }()
    
    override func addElemented() {
        addSubview(self.boxView)
        self.boxView.addSubview(self.imageView)
        self.boxView.addSubview(self.labelName)
        self.boxView.addSubview(self.lineView)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.boxView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.boxView.topAnchor.constraint(equalTo: self.topAnchor),
            self.boxView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.boxView.heightAnchor.constraint(equalToConstant: Matrics.heightBoxView),
            self.boxView.widthAnchor.constraint(equalToConstant: Matrics.widthBoxView),
            
            self.imageView.leadingAnchor.constraint(equalTo: self.boxView.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.boxView.topAnchor, constant: Matrics.spaceImage),
            self.imageView.widthAnchor.constraint(equalToConstant: Matrics.imageWidthHeight),
            self.imageView.heightAnchor.constraint(equalToConstant: Matrics.imageWidthHeight),
            
            self.labelName.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: Matrics.space),
            self.labelName.centerYAnchor.constraint(equalTo: self.imageView.centerYAnchor),
            self.labelName.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor),
            
            self.lineView.leadingAnchor.constraint(equalTo: self.boxView.leadingAnchor),
            self.lineView.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor),
            self.lineView.bottomAnchor.constraint(equalTo: self.boxView.bottomAnchor),
            self.lineView.heightAnchor.constraint(equalToConstant: Matrics.heightLine),
            
        ])
    }
    
    public func setup(_ model: MenuModel) {
        self.imageView.image = UIImage(systemName: "\(model.imageName)")
        self.labelName.text = model.description
    }
}
