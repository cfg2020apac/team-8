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
app.use(express.static('http://localhost:3000/service-worker.js'))

app.get("/", (req, res) => {
  return res.status(200).send("Hello World!");
});

app.post("/write-doc", async (req, res) => {
  const { collection, documentId, documentValue } = req.body;
  const docRef = db.collection(collection).doc(documentId);
  try {
    const r = await docRef.set(documentValue);
    console.log("Write Success", r);
    return res.status(200).end();
  } catch (e) {
    console.error("Write Failure", r);
    return res.status(500).end();
  }
});

app.post("/add-user", async (req, res) => {
  const { email, password, userDetails } = req.body;
  const docRef = db.collection("users").doc(email);
  try {
    const r = await docRef.set(userDetails);
    console.log("Write Success", r);
    return res.status(200).end();
  } catch (e) {
    console.error("Write Failure", r);
    return res.status(500).end();
  }
});


// get event
app.get("/event", async (req, res) => {
  const { documentId } = req.query;
  const docRef = db.collection("events").doc(documentId);
  try {
    const r = await docRef.get();
    console.log("Read Success", r);
    return res.status(200).send({
      name: r.id,
      value: r.data(),
    });
  } catch (e) {
    console.error("Read Failure", e);
    return res.status(500).end();
  }
});

//add event
app.post("/event", async (req, res) => {
  
})
exports.api = functions.https.onRequest(app);
