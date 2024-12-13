importScripts(
  'https://www.gstatic.com/firebasejs/9.18.0/firebase-app-compat.js'
);
importScripts(
  'https://www.gstatic.com/firebasejs/9.18.0/firebase-messaging-compat.js'
);
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries
// import { initializeApp } from 'firebase/app';
// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyAKw2AhpRdQjobRUhD2dkYVs96y_Rl5wT8",
  authDomain: "haian-container.firebaseapp.com",
  projectId: "haian-container",
  storageBucket: "haian-container.firebasestorage.app",
  messagingSenderId: "778353578504",
  appId: "1:778353578504:web:1a8b24b1a755b45c7777bd",
  measurementId: "G-DSG3Z7223D"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
// Optional:
const messaging = firebase.messaging();
// messaging.onBackgroundMessage((message) => {
//   console.log("onBackgroundMessage", message);
// });