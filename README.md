# Firestore Import Export
A script that help to export Cloud Firestore database. 
this project is overwritten from [Firestore import export](https://github.com/dalenguyen/firestore-import-export).

** Firestore import export is not maintained. Your can try the [backup and restore from Firestore](https://github.com/dalenguyen/firestore-backup-restore) package instead!

# Requirements

You need [NODE](https://nodejs.org/en/download/) or something that can run JAVASCRIPT (JS) file.

Get **serviceAccount** JSON file from *Project Setting > SERVICE ACCOUNTS* in Firebase Console

Change the *databaseURL* when initializeApp with your own

# Setting Up

Download or clone this repository

```
git clone this project
```

Install NPM packages

```
npm install
```

Get **serviceAccount** JSON file from *Project Setting > SERVICE ACCOUNTS* in Firebase Console
*Change the *databaseURL* when initializeApp with your own

# Export database from Firestore

This will help you create a backup of your collection and subcollection from Firestore to a JSON file name **firestore-export.json**

```
node export.js <your-collection-name> <sub-collection-name-(optional)>
```

