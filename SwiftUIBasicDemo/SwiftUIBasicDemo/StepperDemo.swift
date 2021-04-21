//
//  StepperDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/26.
//

import SwiftUI

struct StepperDemo: View {
    
    @State var stepperValue = 0
    
    var body: some View {
        Stepper("Stepper\(stepperValue)", value: $stepperValue)
        
    }
}

struct StepperDemo_Previews: PreviewProvider {
    static var previews: some View {
        StepperDemo()
    }
}
