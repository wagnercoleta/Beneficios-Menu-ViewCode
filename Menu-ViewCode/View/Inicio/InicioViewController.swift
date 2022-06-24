//
//  InicioViewController.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class InicioViewController: BaseViewController {

    private var screen: InicioScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.screen = InicioScreen()
        self.view = self.screen
    }
}
