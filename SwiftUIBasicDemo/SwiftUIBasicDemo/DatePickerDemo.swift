//
//  DatePickerDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/30.
//

import SwiftUI

struct DatePickerDemo: View {
    
    @State var selection:Date = Date()
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        DatePicker(
                "Start Date",
                 selection: $selection,
                 in: dateRange,
                 displayedComponents: [.date, .hourAndMinute]
            )
    }
}

struct DatePickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerDemo()
    }
}
