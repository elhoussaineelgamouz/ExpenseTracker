//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by el houssaine el gamouz on 28/7/2025.
//

enum ExpenseFilter {
    case all
    case byCategory(String)
    case aboveAmount(Double)
}

import Foundation

class ExpenseViewModel: ObservableObject {
    
    @Published var expenses: [Expense] = []
    
    var total: Double {
           expenses.reduce(0) { $0 + $1.amount }
       }
    
    func addExpense(_ expense: Expense) {
        expenses.append(expense)
    }
    
    func removeExpense(id: UUID) {
        expenses.removeAll { $0.id == id }
    }
    
    func expenses(for category: String) -> [Expense] {
        expenses.filter { $0.category == category }
    }
    
}
