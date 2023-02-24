import { initializeApp } from 'firebase/app'
import { getFirestore } from 'firebase/firestore'
import { getStorage } from 'firebase/storage'

const firebaseConfig = {
  apiKey: 'AIzaSyDxvpf5MQM8CsIpZR99Ctqq78jneW2fVIw',
  authDomain: 'hqtrivia-fda09.firebaseapp.com',
  projectId: 'hqtrivia-fda09',
  storageBucket: 'hqtrivia-fda09.appspot.com',
  messagingSenderId: '864921514573',
  appId: '1:864921514573:web:0a6ead983f850b658b2204',
}

const app = initializeApp(firebaseConfig)
export const db = getFirestore(app)
export const storage = getStorage(app)
