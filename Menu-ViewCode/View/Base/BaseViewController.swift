//
//  BaseViewController.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class BaseViewController: UIViewController {

    var titleView: String
    var backgroundColorView: UIColor
    var imageView: UIImage?
    
    init(title: String, image: UIImage?, backgroundColor: UIColor? = nil){
        self.titleView = title
        self.imageView = image
        self.backgroundColorView = backgroundColor ?? .white
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = self.backgroundColorView
        self.title = self.titleView
    }
}
