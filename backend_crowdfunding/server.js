const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');
const app = express();
app.use(cors());
const port = 3000;

// Configuration de la connexion à la base de données
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'crowdfunding'
});

db.connect(err => {
  if (err) {
    console.error('Erreur de connexion à la base de données : ' + err.stack);
    return;
  }
  console.log('Connecté à la base de données MySQL');
});

// Middleware pour analyser le corps des requêtes en JSON
app.use(bodyParser.json());

// API pour récupérer toutes les données de la table cagnotte
app.get('/api/cagnotte', (req, res) => {
  const query = 'SELECT * FROM cagnotte';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// API pour ajouter une nouvelle cagnotte
app.post('/api/cagnotte', (req, res) => {
  const nouvelleCagnotte = req.body;

  if (!nouvelleCagnotte.nom || !nouvelleCagnotte.description || !nouvelleCagnotte.prix) {
    res.status(400).json({ message: 'Les champs nom, description et prix sont obligatoires.' });
    return;
  }

  const query = 'INSERT INTO cagnotte (nom, description, prix) VALUES (?, ?, ?)';
  db.query(query, [nouvelleCagnotte.nom, nouvelleCagnotte.description, nouvelleCagnotte.prix], (err, results) => {
    if (err) throw err;
    res.json({ message: 'Nouvelle cagnotte ajoutée avec succès.' });
  });
});

// API pour récupérer toutes les données de la table categories
app.get('/api/categories', (req, res) => {
  const query = 'SELECT * FROM categories';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// API pour ajouter une nouvelle catégorie
app.post('/api/categories', (req, res) => {
  const nouvelleCategorie = req.body;

  if (!nouvelleCategorie.nom_Categories) {
    res.status(400).json({ message: 'Le champ nom_Categories est obligatoire.' });
    return;
  }

  const query = 'INSERT INTO categories (nom_Categories) VALUES (?)';
  db.query(query, [nouvelleCategorie.nom_Categories], (err, results) => {
    if (err) throw err;
    res.json({ message: 'Nouvelle catégorie ajoutée avec succès.' });
  });
});

// API pour récupérer toutes les données de la table paiement
app.get('/api/paiement', (req, res) => {
  const query = 'SELECT * FROM paiement';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// API pour ajouter un nouveau paiement
app.post('/api/paiement', (req, res) => {
  const nouveauPaiement = req.body;
   console.log("Requête reçue :", req.body);
  if (!nouveauPaiement.montant || !nouveauPaiement.numero_carte) {
    res.status(400).json({ message: 'Les champs montant et numero_carte sont obligatoires.' });
    return;
  }

  const query = 'INSERT INTO paiement (montant, numero_carte) VALUES (?, ?)';
  db.query(query, [nouveauPaiement.montant, nouveauPaiement.numero_carte], (err, results) => {
    if (err) throw err;
    res.json({ message: 'Nouveau paiement ajouté avec succès.' });
  });
});

// API pour récupérer toutes les données de la table utilisateur
app.get('/api/utilisateur', (req, res) => {
  const query = 'SELECT * FROM utilisateur';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// API pour ajouter un nouvel utilisateur
app.post('/api/utilisateur', (req, res) => {
  const nouvelUtilisateur = req.body;

  if (!nouvelUtilisateur.Nom || !nouvelUtilisateur.prenom || !nouvelUtilisateur.mot_de_passe) {
    res.status(400).json({ message: 'Les champs Nom, prenom et mot_de_passe sont obligatoires.' });
    return;
  }

  const query = 'INSERT INTO utilisateur (Nom, prenom, mot_de_passe) VALUES (?, ?, ?)';
  db.query(query, [nouvelUtilisateur.Nom, nouvelUtilisateur.prenom, nouvelUtilisateur.mot_de_passe], (err, results) => {
    if (err) throw err;
    res.json({ message: 'Nouvel utilisateur ajouté avec succès.' });
  });
});

// Écoute du serveur sur le port spécifié
app.listen(port, () => {
  console.log(`Serveur en cours d'exécution sur le port ${port}`);
});
