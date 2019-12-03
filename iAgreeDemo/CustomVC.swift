//
//  CustomVC.swift
//  iAgreeDemo
//
//  Created by Dmitry Kocherovets on 28.11.2019.
//  Copyright © 2019 Dmitry Kocherovets. All rights reserved.
//

import UIKit
import ReduxVM
import DeclarativeTVC
import RedSwift
import iAgreeLib

enum CustomVCModule {

    struct Props: Properties, Equatable {

    }

    class Presenter: PresenterBase<Props, State> {

        override func reaction(for box: StateBox<State>) -> ReactionToState {
            return .props
        }

        override func props(for box: StateBox<State>) -> Props? {

            return Props(
            )
        }
    }
}

class CustomVC: VC<CustomVCModule.Props, CustomVCModule.Presenter> {

    @IBOutlet private weak var flashButton: UIButton!
    @IBOutlet private weak var rotateButton: UIButton!
    @IBOutlet private weak var cameraView: UIView!
    @IBOutlet private weak var photoView: UIImageView!

    private var iAgree: IAgree?

    override func viewDidLoad() {
        super.viewDidLoad()

        iAgree = IAgree(cameraView: cameraView)
        iAgree?.delegate = self
        
        updateTitles()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func render() {

        guard let _ = props else { return }
    }

    @IBAction func closeAction(_ sender: Any) {

        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }

    @IBAction func rotateAction(_ sender: Any) {

        iAgree?.switchPosition()
    }

    @IBAction func flashAction(_ sender: Any) {

        switch iAgree?.flashMode {
        case .off: iAgree?.set(flashMode: .on)
        case .on: iAgree?.set(flashMode: .auto)
        case .auto: iAgree?.set(flashMode: .off)
        case .none:
            iAgree?.set(flashMode: .auto)
        @unknown default:
            iAgree?.set(flashMode: .auto)
        }

        updateTitles()
    }

    @IBAction func takeAction(_ sender: Any) {

        iAgree?.capturePhoto()
    }

    func updateTitles() {
        switch iAgree?.flashMode {
        case .off: flashButton.setTitle("Flash Off", for: .normal)
        case .on: flashButton.setTitle("Flash On", for: .normal)
        case .auto: flashButton.setTitle("Flash Auto", for: .normal)
        case .none:
            flashButton.setTitle("Flash Auto", for: .normal)
        @unknown default:
            flashButton.setTitle("Flash Auto", for: .normal)
        }
    }
}

extension CustomVC: IAgreeDelegate {
    
    public func session(id: String, photo: UIImage) {
        print(id)
        photoView.image = photo
    }
}
