const functions = require("firebase-functions");
const admin = require("firebase-admin");
const express = require("express");
const cors = require("cors");

// const serviceAccount = require("./for-change-292011-e309d6a3b734.json");

// admin.initializeApp({
//   credential: admin.credential.cert(serviceAccount)
// });
admin.initializeApp();
const db = admin.firestore();

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());

app.get("/", (req, res) => {
  return res.status(200).send("Hello World!");
});

// app.post("/write-doc", async (req, res) => {
//   const { collection, documentId, documentValue } = req.body;
//   const docRef = db.collection(collection).doc(documentId);
//   try {
//     const r = await docRef.set(documentValue);
//     console.log("Write Success", r);
//     return res.status(200).end();
//   } catch (e) {
//     console.error("Write Failure", r);
//     return res.status(500).end();
//   }
// });

app.post("/add-volunteer", async (req, res) => {
  const { userDetails } = req.body;
  try {
  const r = await db.collection("users").add(userDetails);
    console.log("Write Success", r);
    return res.status(200).end();
  } catch (e) {
    console.error("Write Failure", r);
    return res.status(500).end();
  }
});

app.post("/add-event", async (req, res) => {
  const { eventDetails } = req.body;
  try {
  const r = await db.collection("events").add(eventDetails);
    console.log("Write Success", r);
    return res.status(200).end();
  } catch (e) {
    console.error("Write Failure", r);
    return res.status(500).end();
  }
});

app.get("/get-events", async (req, res) => {
  try {
    const snapshot = await db.collection("events").get();
    return res.status(200).send(snapshot.docs.map(doc => doc.data()))
  } catch (e) {
    console.error("Get Failure", e);
    return res.status(500).end();
  }
});

app.get("/get-authentication-match", async (req, res) => {
  const { username, password } = req.body;
  console.log(req);
  try {
    const allUsers = await db.collection("users").get();
    const allUsersInArray = allUsers.docs.map(doc => doc.data());
    var isAuthenticated = false;
    for (var eachUserObject of allUsersInArray) {
      console.log(eachUserObject.username,username);
      console.log(eachUserObject.password,password);

      if (eachUserObject.username === username && eachUserObject.password === password) {
        console.log("pass");
        isAuthenticated = true;
      }
    }
    return res.status(200).send(isAuthenticated)
  } catch (e) {
    console.error("Get Failure", e);
    return res.status(500).end();
  }
});

exports.api = functions.https.onRequest(app);
