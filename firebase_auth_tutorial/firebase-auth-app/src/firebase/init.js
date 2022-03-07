// Import the functions you need from the SDKs you need
import firebase from 'firebase/compat/app';
import 'firebase/compat/auth'
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "<apiKey>",
  authDomain: "<authDomain>",
  projectId: "<projectId>",
  storageBucket: "<storageBucket>",
  messagingSenderId: "<messagingSenderId>",
  appId: "<appId>",
  measurementId: "<measurementId>"
};

// Initialize Firebase app
const app = firebase.initializeApp(firebaseConfig);

// Initialize and configure Firebase Authentication
export const auth = firebase.auth(app)
export const signInProvider = new firebase.auth.GoogleAuthProvider(app)
signInProvider.setCustomParameters({prompt: 'select_account'});