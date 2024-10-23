/*
 Banking System
 Description: Create a basic banking system that allows users to create accounts, deposit, withdraw, and check balances.
 Acceptance Criteria:
 1- Classes for Account (Saving Account & Current Account), Transaction and User
 2- Account Types should be ENUM
 3- Saving can calculate interest per month ((Balance * Rate) / 12)
 Technical Requirements:
 1- OOP Concepts
 2- SOLID Principles
 3- Clean Code
 */

import Foundation

enum AccountType {
    case saving
    case current
}

enum TransactionType {
    case deposit
    case withdrawal
}

enum TransactionStatus {
    case success
    case failed
}

final class User {
    var name: String
    private var accounts: [Account] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addAccount(account: Account) {
        accounts.append(account)
    }
    
    func getAccounts() -> [Account] {
        return accounts
    }
}

class Account {
    private var balance: Double
    var accountType: AccountType
    var transactions: [Transaction] = []
    
    init(balance: Double, accountType: AccountType) {
        self.balance = balance
        self.accountType = accountType
    }
    
    func deposit(amount: Double) -> Transaction {
        balance += amount
        let transaction = Transaction(date: Date(), type: .deposit, amount: amount, status: .success)
        transactions.append(transaction)
        return transaction
    }
    
    func withdraw(amount: Double) -> Transaction {
        if amount <= balance {
            balance -= amount
            let transaction = Transaction(date: Date(), type: .withdrawal, amount: amount, status: .success)
            transactions.append(transaction)
            return transaction
        } else {
            let transaction = Transaction(date: Date(), type: .withdrawal, amount: amount, status: .failed)
            transactions.append(transaction)
            return transaction
        }
    }
    
    func getBalance() -> Double {
        return balance
    }
}

final class Transaction {
    var date: Date
    var type: TransactionType
    var amount: Double
    var status: TransactionStatus
    
    init(date: Date, type: TransactionType, amount: Double, status: TransactionStatus) {
        self.date = date
        self.type = type
        self.amount = amount
        self.status = status
    }
    
    func transactionDetails() -> String {
        return "Date: \(date), Type: \(type), Amount: \(amount), Status: \(status)"
    }
}

final class SavingAccount: Account {
    var rate: Double
    
    init(rate: Double, balance: Double) {
        self.rate = rate
        super.init(balance: balance, accountType: .saving)
    }
    
    func calculateMonthlyRate() -> Double {
        return (getBalance() * rate) / 12
    }
}

final class CurrentAccount: Account {
    init(balance: Double) {
        super.init(balance: balance, accountType: .current)
    }
}

let savingAccount = SavingAccount(rate: 0.07, balance: 5000)
let user1 = User(name: "Dalia")
user1.addAccount(account: savingAccount)

let transaction1 = user1.getAccounts()[0].withdraw(amount: 20000)
let transaction2 = user1.getAccounts()[0].deposit(amount: 15000)
let transaction3 = user1.getAccounts()[0].withdraw(amount: 25000)

let currentAccount = CurrentAccount(balance: 2000)
user1.addAccount(account: currentAccount)
let transaction4 = user1.getAccounts()[1].deposit(amount: 15000)

print("\(user1.name) Transactions:")
for account in user1.getAccounts() {
    for transaction in account.transactions {
        print(transaction.transactionDetails())
    }
}

let rate1 = savingAccount.calculateMonthlyRate()
print("Monthly Interest: \(rate1)")
