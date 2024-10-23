# Banking System

## Description
This project implements a basic banking system that allows users to create accounts, deposit, withdraw, and check balances. The system supports two account types: Saving Account and Current Account, with features to manage transactions and calculate interest.

## Features
- User management with the ability to create and manage multiple accounts.
- Deposit and withdrawal transactions with handling for success and failure.
- Monthly interest calculation for Saving Accounts.

## Technical Requirements
- **OOP Concepts**: Utilizes encapsulation, inheritance, and polymorphism.
- **SOLID Principles**: Follows SOLID principles for clean and maintainable code.
- **Clean Code**: Code is structured for readability and understandability.

## Implementation Details

### Enums
- `AccountType`: Represents account types (`saving`, `current`).
- `TransactionType`: Represents transaction types (`deposit`, `withdrawal`).
- `TransactionStatus`: Represents the status of a transaction (`success`, `failed`).

### Classes
- **User**: 
  - Manages user accounts.
  - Methods: `addAccount()`, `getAccounts()`

- **Account** (base class):
  - Manages balance and transactions.
  - Methods: `deposit()`, `withdraw()`, `getBalance()`

- **SavingAccount** (inherits from `Account`):
  - Calculates monthly interest.
  - Method: `calculateMonthlyRate()`

- **CurrentAccount** (inherits from `Account`):
  - Initializes with a balance.

- **Transaction**:
  - Logs transaction details.
  - Method: `transactionDetails()`

