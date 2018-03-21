//
//  ViewController.swift
//  IOS-Swift-ShareContent01
//
//  Created by Pooya Hatami on 2018-03-20.
//  Copyright © 2018 Pooya Hatami. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIDocumentInteractionControllerDelegate {

    final private let stringWithLink = "Please download this app here in App Store: https://google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func shareStringTapped(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: [stringWithLink], applicationActivities: nil)
        
        activityController.completionWithItemsHandler = { (nil, completed, _, error) in
            if completed {
                print("completed")
            } else {
                print("cancled")
            }
        }
        present(activityController, animated: true) {
            print("presented")
        }
    }
    
    
    @IBAction func shareImageTapped(_ sender: Any) {
        guard let image = UIImage(named: "shareME") else { return }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        activityController.completionWithItemsHandler = { (nil, completed, _, error) in
            if completed {
                print("completed")
            } else {
                print("cancled")
            }
        }
        present(activityController, animated: true) {
            print("presented")
        }
    }
    
    
    @IBAction func sharePDFTapped(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: "sharePDF", withExtension: "pdf") else { return }
        print(url)
        let controller = UIDocumentInteractionController(url: url)
        controller.delegate = self
        controller.presentPreview(animated: true)
    }
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
}

