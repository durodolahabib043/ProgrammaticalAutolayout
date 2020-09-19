//
//  FrenchToastViewController.swift
//  Autolayout comps.
//
//  Created by Steven Lipton on 2/17/18.
//  Copyright © 2018 Steven Lipton. All rights reserved.
//

import UIKit

class FrenchToastViewController: UIViewController {
    //MARK: - Properties and Actions
    // Configuration goes here
    var menuItem = "French Toast"
    var font = UIFont(name: "Avenir", size: 22)
    var labelFont = UIFont(name: "AvenirNext-DemiBold", size: 36.0)
    
    // Subviews
    var imageView = UIImageView()
    var label = UILabel()
    var backButton = UIButton(type: .system)
    var orderButton = UIButton(type: .system)
    //Actions
    @IBAction func backButton(_ sender:UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Setup Methods
    func addImageView(){
        let image = UIImage(named: menuItem)
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        // layout
    }
    
    func addLabel(){
        label.text = menuItem
        label.font = labelFont
        label.textColor = UIColor(named:menuItem + "Label")
        label.backgroundColor = UIColor(named:"WhiteLabelBackground")
        label.textAlignment = .left
        view.addSubview(label)
    }
    
    func addBackButton(){
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.font = font
        backButton.tintColor = UIColor(named:menuItem + "Background")
        backButton.backgroundColor = UIColor(named:menuItem + "Back")
        backButton.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    func addOrderButton(){
        orderButton.setTitle("Order", for: .normal)
        orderButton.titleLabel?.font = font
        orderButton.tintColor = UIColor(named:menuItem + "Background")
        orderButton.backgroundColor = UIColor(named:menuItem + "Button")
        orderButton.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        view.addSubview(orderButton)
    }
    
    func addViews(){
        view.backgroundColor = UIColor(named:menuItem + "Background")
        addImageView()
        addLabel()
        addBackButton()
        addOrderButton()
    }
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = menuItem
        addViews()
        layoutViews()
    }
    
    
    //MARK: - Layout
    
    //Layout your views here
    func layoutViews(){
        var constraint = [NSLayoutConstraint]()
        viewRespectsSystemMinimumLayoutMargins = false // disable margin AL

        view.directionalLayoutMargins.trailing = 0.0


        //MARK: - label
        label.translatesAutoresizingMaskIntoConstraints = false// MAKE SURE TO ADD THIS AT ALL TIMES
        //label.top = view.safeAreatop + 40
        constraint += [NSLayoutConstraint (item: label, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 40)]
        //label.leading = view.marginguide + 40
        constraint += [NSLayoutConstraint (item: label, attribute: .leading, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: . leading, multiplier: 1.0, constant: 0)]

        //label.trailing = view.marginguide + 40
        constraint += [NSLayoutConstraint (item: label, attribute: .trailing, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: . trailing, multiplier: 1.0, constant: 0)]

        //label.height = view.height *0.10
        constraint += [NSLayoutConstraint (item: label, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.1, constant: 0)]


        //MARK: - imageView
        /// ImageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //image.top = view.safeAreatop + 20
        constraint += [NSLayoutConstraint (item: imageView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0)]
        //image.leading = view.safeAreatop + 20
        constraint += [NSLayoutConstraint (item: imageView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant:0 )]
        //image.trailing = view.safeAreatop + 20
        constraint += [NSLayoutConstraint (item: imageView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0)]

        //image.button = view.safeAreatop + 20
        constraint += [NSLayoutConstraint (item: imageView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 20)]




        //MARK: - backButton
        backButton.translatesAutoresizingMaskIntoConstraints = false
        //backButton.leading = orderButton.trailing
        constraint += [NSLayoutConstraint (item: backButton, attribute: .leading, relatedBy: .equal, toItem: orderButton, attribute: . trailing, multiplier: 1.0, constant: 0)]

        //backButton.trailing = label.trailing
        constraint += [NSLayoutConstraint (item: backButton, attribute: .trailing, relatedBy: .equal, toItem: label, attribute: .trailing, multiplier: 1.0, constant: 0)]

        //backButton.bottom = orderButton.top
        constraint += [NSLayoutConstraint (item: backButton, attribute: .bottom, relatedBy: .equal, toItem: view.layoutMarginsGuide , attribute: .bottom, multiplier: 1.0, constant: 0)]

        //orderButton.height = view.height * 0.10
        constraint += [NSLayoutConstraint (item: backButton, attribute: .height, relatedBy: .equal, toItem: view , attribute: .height, multiplier: 0.10, constant: 0)]


        //MARK: - orderButton
        orderButton.translatesAutoresizingMaskIntoConstraints = false

        //orderButton.leading = label.leading
        constraint += [NSLayoutConstraint (item: orderButton, attribute: .leading, relatedBy: .equal, toItem: label, attribute: . leading, multiplier: 1.0, constant: 0)]

        //orderButton.trailing = backButton.leading
        constraint += [NSLayoutConstraint (item: orderButton, attribute: .trailing, relatedBy: .equal, toItem: backButton, attribute: .leading, multiplier: 1.0, constant: 0)]

        //orderButton.bottom = viewMargin.bottom
        constraint += [NSLayoutConstraint (item: orderButton, attribute: .bottom, relatedBy: .equal, toItem: view.layoutMarginsGuide , attribute: .bottom, multiplier: 1.0, constant: 0)]

        //orderButton.height = view.height * 0.10
        constraint += [NSLayoutConstraint (item: orderButton, attribute: .height, relatedBy: .equal, toItem: view , attribute: .height, multiplier: 0.10, constant: 0)]

        //orderButton.Width = backButton.Width *0.5
        constraint += [NSLayoutConstraint (item: orderButton, attribute: .width, relatedBy: .equal, toItem: backButton , attribute: .width, multiplier: 1.0, constant: 0)]



        view.addConstraints(constraint)
        
    }
    
    
    
}
















