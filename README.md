# Banking System

## Description
This project implements a basic banking system that allows users to create accounts, deposit, withdraw, and check balances. The system supports two account types: Saving Account and Current Account, along with features to manage transactions and calculate interest.

## Features
- User management with the ability to create and manage multiple accounts.
- Deposit and withdrawal transactions with success and failure handling.
- Monthly interest calculation for Saving Accounts.

## Technical Requirements
- **OOP Concepts**: Utilizes encapsulation, inheritance, and polymorphism.
- **SOLID Principles**: Follows SOLID principles for clean and maintainable code.
- **Clean Code**: Structured for readability and understandability.

## Implementation Details

### Enums
- **AccountType**: Represents account types (`saving`, `current`).
- **TransactionType**: Represents transaction types (`deposit`, `withdrawal`).
- **TransactionStatus**: Represents the status of a transaction (`success`, `failed`).

### Classes
- **User**: 
  - Manages user accounts.
  - **Methods**: 
    - `addAccount(_ account: Account)`: Adds an account to the user.
    - `getAccounts() -> [Account]`: Returns the list of accounts.

- **Account** (base class):
  - Manages balance and transactions.
  - **Methods**: 
    - `deposit(amount: Double) -> Transaction`: Processes a deposit and updates the balance.
    - `withdraw(amount: Double) -> Transaction`: Processes a withdrawal, updating the balance or failing as necessary.
    - `getTransactions() -> [Transaction]`: Returns the list of transactions.

- **SavingAccount** (inherits from `Account`):
  - Calculates monthly interest.
  - **Methods**: 
    - `calculateMonthlyInterest() -> Double`: Computes the monthly interest based on the balance and interest rate.

- **CurrentAccount** (inherits from `Account`):
  - Initializes with a balance.

- **Transaction**:
  - Logs transaction details.
  - **Methods**: 
    - `details() -> String`: Returns a string representation of the transaction details.
