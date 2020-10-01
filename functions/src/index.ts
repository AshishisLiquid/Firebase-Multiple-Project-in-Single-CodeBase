import * as functions from 'firebase-functions';
var admin = require("firebase-admin");
var serviceAccount = {
  //Put your Firebase config
};
const cors = require('cors');
const corsHandler = cors({
  origin: "*"
});
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: //Url of database
});
// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

export const helloWorld = functions.https.onRequest(async (req, res) => {
  corsHandler(req, res, async () => {
    const testData = await admin.firestore().collection('Testing').doc('test').get();
    if(testData.data() === undefined){
      res.status(403).send({error : "Invalid Document"});
    }
    res.send(testData.data());
  });
});
