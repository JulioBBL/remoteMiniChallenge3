//
//  MembersViewController.swift
//  RemoteMC3
//
//  Created by Cassia Aparecida Barbosa on 19/05/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import Foundation
import UIKit

class MemberViewController: UIViewController {
	
	var viewModel: MemberViewModel?
	var notification: Notification?
	
	@IBOutlet var memberName: UILabel!
	@IBOutlet var memberImage: UIImageView!
	@IBOutlet var memberEmail: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.viewModel = MemberViewModel(notification: self.notification!)
		setUpScreen()
		self.title = viewModel?.getProjectName()
    }
	
	func setUpScreen() {
		memberImage.layer.cornerRadius = 125
		memberImage.image = UIImage(named: viewModel?.getMemberImage() ?? "personalColored")
		memberName.text = viewModel?.getMemberName()
		memberEmail.text = viewModel?.getMemberEmail()
	}
	
	@IBAction func aceptAction(_ sender: Any) {
	//TODO: Aceitar no servidor
//		realod da UI do NotificationController
        viewModel?.answerRequisition(answer: true)
//        self.dismiss(animated: true, completion: nil)
		self.navigationController?.popToRootViewController(animated: false)
//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
//		
//		let vc = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as? NotificationViewController
//		
////		specificVC?.project = viewModel.getProject(forCategoryAt: categorySelected, forProjectAt: indexPath.row)
//		
//		self.show(vc ?? NotificationViewController(), sender: nil)
//		self.modalPresentationStyle = .none
	}
	
	@IBAction func denyAction(_ sender: Any) {
	//TODO: Negar no servidor
		//		realod da UI do NotificationController
        viewModel?.answerRequisition(answer: false)
//        self.dismiss(animated: true, completion: nil)
		self.navigationController?.popToRootViewController(animated: false)
//		parentVC.reloadUI()
	}
}
