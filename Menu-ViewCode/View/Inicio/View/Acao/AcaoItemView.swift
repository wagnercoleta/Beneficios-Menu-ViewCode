//
//  AcaoItemView.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 27/06/22.
//

import UIKit

class AcaoItemView: BaseView {
    
    private struct Matrics {
        static let space: CGFloat = 10.0
        static let heightBoxViewAcao: CGFloat = 40
        static let heightImageAcao: CGFloat = 40
    }
    
    private lazy var boxView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageViewTransf: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "arrow.up.arrow.down.circle")
        image.tintColor = CustomColor.Main
        return image
    }()
    
    private lazy var labelTransf: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: CustomFont.SizeDefault, weight: .regular)
        label.text = "Transferir saldo entre benefícios"
        label.textColor = CustomColor.Second
        return label
    }()
    
    private lazy var imageViewArrowTransf: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "greaterthan")
        image.tintColor = CustomColor.Second
        return image
    }()
    
    override func addElemented() {
        addSubview(self.boxView)
        self.boxView.addSubview(self.imageViewTransf)
        self.boxView.addSubview(self.labelTransf)
        self.boxView.addSubview(self.imageViewArrowTransf)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.boxView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.boxView.topAnchor.constraint(equalTo: self.topAnchor),
            self.boxView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.boxView.heightAnchor.constraint(equalToConstant: Matrics.heightBoxViewAcao),
            
            self.imageViewTransf.leadingAnchor.constraint(equalTo: self.boxView.leadingAnchor),
            self.imageViewTransf.topAnchor.constraint(equalTo: self.boxView.topAnchor),
            self.imageViewTransf.centerYAnchor.constraint(equalTo: self.boxView.centerYAnchor),
            self.imageViewTransf.widthAnchor.constraint(equalToConstant: Matrics.heightImageAcao),
            self.imageViewTransf.heightAnchor.constraint(equalToConstant: Matrics.heightImageAcao),
            
            self.labelTransf.leadingAnchor.constraint(equalTo: self.imageViewTransf.trailingAnchor, constant: Matrics.space),
            self.labelTransf.centerYAnchor.constraint(equalTo: self.boxView.centerYAnchor),
            self.labelTransf.trailingAnchor.constraint(equalTo: self.imageViewArrowTransf.trailingAnchor, constant: -Matrics.space),
            
            self.imageViewArrowTransf.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor),
            self.imageViewArrowTransf.centerYAnchor.constraint(equalTo: self.boxView.centerYAnchor),
            self.imageViewArrowTransf.widthAnchor.constraint(equalToConstant: 15),
            self.imageViewArrowTransf.heightAnchor.constraint(equalToConstant: 25),
            
        ])
    }
   
    public func setup(imageName: String, description: String) {
        self.imageViewTransf.image = UIImage(systemName: "\(imageName)")
        self.labelTransf.text = description
    }
}
