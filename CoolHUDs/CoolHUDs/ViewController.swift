//
//  ViewController.swift
//  CoolHUDs
//
//  Created by Ismayil Ismayilov on 12/29/22.
//

import UIKit
import JGProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showExample()
        }
    }
    
    private func showExample() {
        let hud = JGProgressHUD()
        hud.indicatorView = JGProgressHUDPieIndicatorView()
        hud.textLabel.text = "Downloading"
        hud.detailTextLabel.text = "0%"
        hud.show(in: view, animated: true)
        
        var progress: Float = 0.0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            progress += 0.1
            hud.setProgress(progress, animated: true)
            let value = progress / 0.1
            hud.detailTextLabel.text = "\(Int(value * 10))%"
            if progress > 1.0 {
                timer.invalidate()
                hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                hud.detailTextLabel.text = nil
                hud.textLabel.text = "Done!"
                hud.dismiss(afterDelay: 1, animated: true)
            }
        }
    }
}

