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
    private var transactions: [Transaction] = []
    
    init(balance: Double, accountType: AccountType) {
        self.balance = balance
        self.accountType = accountType
    }
    
    func getBalance() -> Double {
        return balance
    }
    
    func updateBalance(_ balance: Double) {
        self.balance = balance
    }
    
    func makeTransaction(_ transaction: Transaction) {
        transactions.append(transaction)
    }
    
    func getTransactions() -> [Transaction] {
        return transactions
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

struct DepositManger {
    func deposit(
        account: Account,
        amount: Double
    ) -> Transaction {
        let newBalance = account.getBalance() + amount
        account.updateBalance(newBalance)
        let transaction = Transaction(type: .deposit, amount: amount, status: .success)
        account.makeTransaction(transaction)

        return transaction
    }
}

struct WithdrawalManager {
    func withdraw(
        account: Account,
        amount: Double
    ) -> Transaction {
        if amount <= account.getBalance() {
            let newBalance = account.getBalance() - amount
            account.updateBalance(newBalance)
            let transaction = Transaction(type: .withdrawal, amount: amount, status: .success)
            account.makeTransaction(transaction)

            return transaction
        } else {
            let transaction = Transaction(type: .withdrawal, amount: amount, status: .failed)
            account.makeTransaction(transaction)

            return transaction
        }
    }
}

final class Transaction {
    var date: Date
    var type: TransactionType
    var amount: Double
    var status: TransactionStatus
    
    init(type: TransactionType, amount: Double, status: TransactionStatus) {
        self.date = Date()
        self.type = type
        self.amount = amount
        self.status = status
    }
    
    func transactionDetails() -> String {
        return "Date: \(date), Type: \(type), Amount: \(amount), Status: \(status)"
    }
}

let user = User(name: "Dalia")

let savingAccount = SavingAccount(rate: 0.07, balance: 5000)
user.addAccount(account: savingAccount)

let currentAccount = CurrentAccount(balance: 2000)
user.addAccount(account: currentAccount)

let primaryAccount = user.getAccounts()[0]
let secondaryAccount = user.getAccounts()[1]

let withdrawalManager = WithdrawalManager()
let depositeManager = DepositManger()

let withdrawalTransaction1 = depositeManager.deposit(
    account: primaryAccount,
    amount: 15000
)
print("Transaction Status: [\(withdrawalTransaction1.status)]")

let withdrawalTransaction2 = withdrawalManager.withdraw(
    account: primaryAccount,
    amount: 20000
)
print("Transaction Status: [\(withdrawalTransaction2.status)]")

let transaction3 = withdrawalManager.withdraw(
    account: secondaryAccount,
    amount: 20000
)
print("Transaction: [\(transaction3.status)]")

print("\(user.name) Transactions:")
for account in user.getAccounts() {
    for transaction in account.getTransactions() {
        print(transaction.transactionDetails())
    }
}

let monthlyInterest = savingAccount.calculateMonthlyRate()
print("Monthly Interest: \(monthlyInterest)")
