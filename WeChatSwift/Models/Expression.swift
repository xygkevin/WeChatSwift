//
//  Expression.swift
//  WeChatSwift
//
//  Created by xushuifeng on 2019/7/10.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import Foundation

struct Expression: Codable {
    var icon: String
    var zh: String
    var code: String
}

extension Expression {
    
    static func all() -> [Expression] {
        guard let path = Bundle.main.path(forResource: "Expressions", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return []
        }
        
        do {
            let expressions = try JSONDecoder().decode([Expression].self, from: data)
            return expressions
        } catch {
            print(error)
        }
        return []
    }
    
}