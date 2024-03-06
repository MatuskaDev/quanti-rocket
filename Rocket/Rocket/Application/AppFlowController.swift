//
//  AppFlowController.swift
//  Rocket
//
//  Created by Lukáš Matuška on 06.03.2024.
//

import UIToolkit
import Rockets

final class AppFlowController: FlowController {
    
    func start() {
        presentRockets()
    }
    
    // MARK: Private
    private func presentRockets() {
        let fc = RocketsFlowController(navigationController: navigationController)
        let rootVC = startChildFlow(fc)
        navigationController.viewControllers = [rootVC]
    }
}
