//
//  InicioHeaderView.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit
import PinLayout

class InicioHeaderView: BaseView {

    private struct Matrics {
        static let labelFontSize: CGFloat = 25.0
        static let heightBoxView: CGFloat = 40
        static let heightImageView: CGFloat = 25.0
        static let widthImageView: CGFloat = 40.0
        static let space: CGFloat = 10.0
    }
    
    private lazy var boxView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = self.getAttributedTextName(textWellcome: "Oi", textName: "Wagner")
        label.lineBreakMode = .byTruncatingTail
        label.textColor = CustomColor.Second
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "eye")
        image.contentMode = .scaleAspectFill
        return image
    }()

    private func getAttributedTextName(textWellcome: String, textName: String) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: textWellcome,
            attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: Matrics.labelFontSize, weight: .regular),
                NSAttributedString.Key.foregroundColor: CustomColor.Main ?? .black
            ]
        )
        
        attributedText.append(
            NSAttributedString(string: ", \(textName)",
                attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: Matrics.labelFontSize, weight: .bold),
                             NSAttributedString.Key.foregroundColor: CustomColor.Main ?? .black
                ]
            )
        )
        
        return attributedText
    }
    
    override func addElemented() {
        addSubview(self.boxView)
        addSubview(self.labelName)
        addSubview(self.imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.boxView.pin
            .top(pin.safeArea)
            .horizontally(pin.safeArea)
            .height(Matrics.heightBoxView)
        
        self.imageView.pin
            .centerRight(to: self.boxView.anchor.centerRight)
            .width(Matrics.widthImageView)
            .height(Matrics.heightImageView)
            .sizeToFit(.width)
        
        self.labelName.pin
            .centerLeft(to: self.boxView.anchor.centerStart)
            .left(to: self.boxView.edge.left)
            .right(to: self.imageView.edge.left)
            .sizeToFit(.width)
    }
    
    override func setupConstraint() {
        
//        NSLayoutConstraint.activate([
//
//            self.boxView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            self.boxView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//            self.boxView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            self.boxView.heightAnchor.constraint(equalToConstant: Matrics.heightBoxView),
//
//            self.labelName.leadingAnchor.constraint(equalTo: self.boxView.leadingAnchor),
//            self.labelName.centerYAnchor.constraint(equalTo: self.boxView.centerYAnchor),
//            self.labelName.trailingAnchor.constraint(equalTo: self.imageView.leadingAnchor, constant: Matrics.space),
//
//            self.imageView.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor),
//            self.imageView.centerYAnchor.constraint(equalTo: self.boxView.centerYAnchor),
//            self.imageView.widthAnchor.constraint(equalToConstant: Matrics.heightWidthImageView),
//            self.imageView.heightAnchor.constraint(equalToConstant: Matrics.heightWidthImageView),
//
//        ])
    }
}
