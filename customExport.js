const { initializeFirebaseApp } = require('firestore-export-import')

const serviceAccount = require('./serviceAccountKey.json')

// If you want to pass settings for firestore, you can add to the options parameters
const options = {
  firestore: {
    host: 'localhost:8080',
    ssl: false,
  },
}
console.log('before app initialized')
// Initiate Firebase App
// appName is optional, you can omit it.
const appName = '[DEFAULT]'
initializeFirebaseApp(serviceAccount, appName, options)

// the appName & options are OPTIONAL
// you can initalize the app without them
// initializeFirebaseApp(serviceAccount)

const options2 = {
  docsFromEachCollection: 10, // limit number of documents when exporting
  refs: ['users'], // reference Path
}

const { backup } = require('firestore-export-import')
console.log('before backup start')
// Start exporting your data
backup('collection-name', options2).then((data) =>
  console.log(JSON.stringify(data))
)