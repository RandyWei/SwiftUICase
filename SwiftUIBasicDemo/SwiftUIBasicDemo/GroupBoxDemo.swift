//
//  GroupBoxDemo.swift
//  BasicDemo
//
//  Created by RandyWei on 2021/3/1.
//

import SwiftUI

struct FileItem: Hashable, Identifiable, CustomStringConvertible {
    var id: Self { self }
    var name: String
    var children: [FileItem]? = nil
    var description: String {
        switch children {
        case nil:
            return "📄 \(name)"
        case .some(let children):
            return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
        }
    }
}

let data =
  FileItem(name: "users", children:
    [FileItem(name: "user1234", children:
      [FileItem(name: "Photos", children:
        [FileItem(name: "photo001.jpg"),
         FileItem(name: "photo002.jpg")]),
       FileItem(name: "Movies", children:
         [FileItem(name: "movie001.mp4")]),
          FileItem(name: "Documents", children: [])
      ]),
     FileItem(name: "newuser", children:
       [FileItem(name: "Documents", children: [])
       ])
    ])

struct ToggleStates {
    var oneIsOn: Bool = false
    var twoIsOn: Bool = true
}

struct GroupBoxDemo: View {
    @State private var toggleStates = ToggleStates()
    @State private var topExpanded: Bool = true
    var body: some View {
        VStack{
            GroupBox(label: Text("Label"), content: {
                Text("Content")
            })
            .groupBoxStyle(DefaultGroupBoxStyle())
            
            OutlineGroup(data, children: \.children) { item in
                Text("\(item.description)")
            }
            .padding()
            
            DisclosureGroup("Items", isExpanded: $topExpanded) {
                    Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
                    Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
                    DisclosureGroup("Sub-items") {
                        Text("Sub-item 1")
                    }
                }
            .padding()
        }
    }
}

struct GroupBoxDemo_Previews: PreviewProvider {
    static var previews: some View {
        GroupBoxDemo()
    }
}
