# Booking Apartments Application 

Welcome to the README file of Booking Apartments Application. This mobile app is written in Flutter main language, that allows users to easily find, book, manage apartments, manage account information with SQLite database. The app provides a user-friendly interface for users to search for available apartments, make transactions, and manage their profiles.

## Table of Contents

  - [Features and UI](#features-and-ui)
  - [Database Management](#database-management)
  - [Usage](#usage)
  - [Conclusion](#conclusion)
  - [License](#license)

### Features and UI
The app's user interface includes several screens and functionalities:

1. **Authentication:**
   - Users can sign in or create an account using their email.
   - Secure password input and email validation are implemented.
     
   ![Signin](/imageGithub/signin.png)
   
2. **Create Account**
   - Account creation results in a new entry in the SQLite database.

  ![Create Account](/imageGithub/createAccount.png)
  
3. **Find Apartment:**
   - Users can view a list of available apartments categorized as "All Apartments," "Recommended," and "New."
   - Each apartment listing displays essential information.
   - Tapping on an apartment leads to the Apartment Info screen.
  
   ![Find Apartments](/imageGithub/findApartments.png)

4. **Apartment Info:**
   - Detailed information about the selected apartment is displayed.
   - Users can book the apartment and initiate a transaction.
   - The booking status is linked to the transaction history in the database.
  
   ![Apartment Info](/imageGithub/apartmentInfo.png)

5. **Settings:**
   - Users can edit their profiles, change passwords, and manage payment methods.
   - Changes made to the profile and password are reflected in the SQLite database.
  
   ![Settings](/imageGithub/settings.png)

6. **Payment:**
   - Users can view their transaction history and navigate to top-up, withdraw, or book now.
   - The app tracks transaction history and updates the user's account balance.
  
   ![Payment](/imageGithub/payment.png)
   
7. **Tree Folder**
   - My folder structure along with SQlite content to create database.
     
  ```javascript
    Future _createDB(Database db, int version) async {
        const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
        const textType = 'TEXT NOT NULL';
        const doubleType = 'DOUBLE NOT NULL';

        await db.execute('''
              CREATE TABLE $tableAccounts ( 
                  ${AccountFields.id} $idType, 
                  ${AccountFields.username} $textType,
                  ${AccountFields.password} $textType,
                  ${AccountFields.email} $textType,
                  ${AccountFields.name} $textType,
                  ${AccountFields.phoneNumber} $textType,
                  ${AccountFields.amountMoney} $doubleType
              )
       ''');
  }
  ```

   ![Tree Folder](/imageGithub/treeFolder.png)


### Database Management

The app utilizes SQLite for its two main databases:

1. **Accounts Database:**
   - Stores user account information, including username, password, and email.
   - Account creation, profile editing, and password changes update the database.

2. **Transaction History Database:**
   - Records all transactions, including booking, top-up, and withdrawal activities.
   - Transactions are associated with the respective user accounts and apartments.

## Usage

  1. Clone the repository:

  ```bash
      $ git clone https://github.com/szhin/apartment-manager.git
  ```

  2. Install the required dependencies:

  ```bash
      $ cd booking-apartments-app
      $ flutter pub get
  ```
  3. Run the app:

  ```bash
      $ flutter run
  ```

## Conclusion
  
  Thank you for exploring the Booking Apartments Application. We hope you enjoy using my mobile application. If you have any questions or need further assistance, please don't hesitate to reach out. Have a nice day! 😇🌱🍀🦋
  
  My contact: uzumakinarutoshin@gmail.com
  
## License

  This project is licensed under the MIT License.
