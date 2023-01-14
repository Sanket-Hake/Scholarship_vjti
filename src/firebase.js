import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
import { getFirestore } from "firebase/firestore";
import { getStorage } from "firebase/storage";


const firebaseConfig = {
    apiKey: "AIzaSyBOhM_28cm1q1nKJEneftxSZUdCkpiRnyg",
    authDomain: "sanket-9dd56.firebaseapp.com",
    projectId: "sanket-9dd56",
    storageBucket: "sanket-9dd56.appspot.com",
    messagingSenderId: "14485262054",
    appId: "1:14485262054:web:0fd38131102d9da9037527"
  };

const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);
export const auth = getAuth();
export const storage = getStorage(app);