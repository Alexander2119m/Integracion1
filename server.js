// server.js
const express = require('express');
const app = express();


app.get('/', (req, res) => {
  res.send('Integracion de sistemas y plataformas 8vo "A"');
});

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
  console.log(`Servidor escuchando en el puerto ${PORT}`);
});

