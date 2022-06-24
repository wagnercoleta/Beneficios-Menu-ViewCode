//
//  InicioHeaderView.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class InicioHeaderView: BaseView {

    private struct Matrics {
        static let labelFontSize: CGFloat = 25.0
    }
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = self.getAttributedTextName(textWellcome: "Oi", textName: "Wagner")
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "eye")
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
        stack.addArrangedSubview(labelName)
        stack.addArrangedSubview(imageView)
        addSubview(stack)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.imageView.widthAnchor.constraint(equalToConstant: Matrics.labelFontSize + 15),
            self.imageView.heightAnchor.constraint(equalToConstant: Matrics.labelFontSize - 10),
            
            self.stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stack.heightAnchor.constraint(equalToConstant: Matrics.labelFontSize + 5)
            
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
