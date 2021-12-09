//
//  ViewController.swift
//  ContainerView
//  https://www.youtube.com/watch?v=t5hj90i96Ow
//  Created by Htet Moe Phyu on 09/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topView_height: NSLayoutConstraint!
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerFirstView: UIView!
    @IBOutlet weak var containerSecondView: UIView!
    
    var secondVC : SecondViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        topView.isHidden = true
        containerFirstView.isHidden = true
        containerSecondView.isHidden = true
    }
    
   
    @IBAction func firstViewBtnPressed(_ sender: UIButton) {
        containerFirstView.isHidden  = false
        containerSecondView.isHidden = true
        topView.isHidden = false
        
        titleLabel.text = "First View"
    }
    
    @IBAction func secondBtnPressed(_ sender: UIButton) {
        if let vc = secondVC {
            vc.fetchData() // to avoid stack without need
        }
        
        containerFirstView.isHidden  = true
        containerSecondView.isHidden = false
        topView.isHidden = false
        
        titleLabel.text = "Second View"
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        topView.isHidden = true
        containerFirstView.isHidden = true
        containerSecondView.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toSecondVC"){
            if let destinationVC = segue.destination as? SecondViewController {
                self.secondVC = destinationVC
            }
        }
    }
}

