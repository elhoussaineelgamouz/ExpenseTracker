//
//  Expense.swift
//  ExpenseTracker
//
//  Created by el houssaine el gamouz on 28/7/2025.
//
import Foundation

struct Expense: Identifiable, Equatable {
    let id: UUID
    let title: String
    let amount: Double
    let category: String
    let date: Date
}
