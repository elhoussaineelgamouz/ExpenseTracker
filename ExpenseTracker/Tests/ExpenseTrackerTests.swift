//
//  ExpenseTrackerTests.swift
//  ExpenseTrackerTests
//
//  Created by el houssaine el gamouz on 28/7/2025.
//

import XCTest
import Testing
@testable import ExpenseTracker

final class ExpenseTrackerTests: XCTestCase  {
    
    var viewModel: ExpenseViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = ExpenseViewModel()
    }
    
    func testTotalCalculationWithMultipleExpenses() {
        viewModel.addExpense(Expense(id: UUID(), title: "Groceries", amount: 50.0, category: "Food", date: Date()))
        viewModel.addExpense(Expense(id: UUID(), title: "Taxi", amount: 20.0, category: "Transport", date: Date()))
        XCTAssertEqual(viewModel.total, 70.0)
    }
    
    func testRemoveExpense() {
        let expense1 = Expense(id: UUID(), title: "Rent", amount: 1000, category: "Housing", date: Date())
        let expense2 = Expense(id: UUID(), title: "Coffee", amount: 5, category: "Food", date: Date())
        
        viewModel.addExpense(expense1)
        viewModel.addExpense(expense2)
        
        viewModel.removeExpense(id: expense1.id)
        
        XCTAssertEqual(viewModel.expenses.count, 1)
        XCTAssertEqual(viewModel.expenses.first?.title, "Coffee")
        XCTAssertEqual(viewModel.total, 5.0)
    }
    
    func testFilterExpensesByCategory() {
        viewModel.addExpense(Expense(id: UUID(), title: "Bus", amount: 2, category: "Transport", date: Date()))
        viewModel.addExpense(Expense(id: UUID(), title: "Dinner", amount: 20, category: "Food", date: Date()))
        viewModel.addExpense(Expense(id: UUID(), title: "Lunch", amount: 15, category: "Food", date: Date()))
        
        let foodExpenses = viewModel.expenses(for: "Food")
        XCTAssertEqual(foodExpenses.count, 2)
        XCTAssertTrue(foodExpenses.allSatisfy { $0.category == "Food" })
    }
    
    func testAddingDuplicateTitlesButDifferentIDs() {
        
        let expense1 = Expense(id: UUID(), title: "Dinner", amount: 25, category: "Food", date: Date())
        let expense2 = Expense(id: UUID(), title: "Dinner", amount: 30, category: "Food", date: Date())
        
        viewModel.addExpense(expense1)
        viewModel.addExpense(expense2)
        
        XCTAssertEqual(viewModel.expenses.count, 2)
        XCTAssertEqual(viewModel.total, 55.0)
        
    }
    
    
}
