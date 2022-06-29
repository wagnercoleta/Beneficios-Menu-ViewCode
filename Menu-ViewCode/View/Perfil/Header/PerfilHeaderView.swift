//
//  PerfilHeaderView.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 28/06/22.
//

import UIKit

class PerfilHeaderView: BaseView {
    
    private struct Matrics {
        static let space: CGFloat = 10.0
        static let imageWidthHeight: CGFloat = 90.0
    }
    
    private lazy var boxView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.Main
        view.layer.cornerRadius = 55
        view.layer.maskedCorners = [.layerMaxXMaxYCorner] //borda inferior direita
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.02).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.crop.circle")
        image.tintColor = CustomColor.Second
        return image
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: CustomFont.SizeDefault + 5.0, weight: .bold)
        label.text = "Wagner"
        label.textColor = CustomColor.Second
        return label
    }()
    
    override func addElemented() {
        addSubview(self.boxView)
        self.boxView.addSubview(self.imageView)
        self.boxView.addSubview(self.labelName)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.boxView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.boxView.topAnchor.constraint(equalTo: self.topAnchor),
            self.boxView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.boxView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: Matrics.space),
            self.imageView.centerXAnchor.constraint(equalTo: self.boxView.centerXAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: Matrics.imageWidthHeight),
            self.imageView.heightAnchor.constraint(equalToConstant: Matrics.imageWidthHeight),
            
            self.labelName.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            self.labelName.centerXAnchor.constraint(equalTo: self.boxView.centerXAnchor),
            
        ])
    }
}
