//
//  ViewController.swift
//  JYTools
//
//  Created by JYYQLin on 2024/10/13.
//

import UIKit

class ViewController: JY_Base_Controller {

    private lazy var yq_navigationBar: UIView = UIView()
    private lazy var yq_view: UIView = UIView()
}

extension ViewController {
    override func yq_setInterface() {
        super.yq_setInterface()
        
        yq_content_view.addSubview(yq_view)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(yq_view_tap))
    }
    
    override func yq_setNavigationBar() {
        super.yq_setNavigationBar()
        
        view.addSubview(yq_navigationBar)
    }
    
    override func yq_setSubviewsFrame() {
        super.yq_setSubviewsFrame()
        
        yq_navigationBar.frame.origin = {
            yq_navigationBar.frame.size = CGSize(width: view.frame.width, height: yq_current_device.yq_navigationBar_height())
            
            yq_navigationBar.backgroundColor = UIColor.yq_random().withAlphaComponent(0.85)
            
            return CGPoint(x: 0, y: yq_current_device.yq_statusBar_height())
        }()
        
        yq_view.frame.origin = {
            yq_view.frame.size = CGSize(width: yq_content_view.frame.width, height: yq_content_view.frame.height)
            
            yq_view.backgroundColor = UIColor.yq_random().withAlphaComponent(0.85)
            
            return CGPoint(x: 0, y: 0)
        }()
    }
    
    @objc private func yq_view_tap() {
        yq_retry_request_click()
    }
    
    override func yq_retry_request_click() {
        super.yq_retry_request_click()
        
        let randomTime = arc4random_uniform(3)
        let randomTime2 = arc4random_uniform(randomTime)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(randomTime + randomTime2)) { [weak self] in
            
            self?.yq_controller_status = .yq_data_loaded
        }
    }
    
}


