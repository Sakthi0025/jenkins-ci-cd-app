const express = require('express');
const app = express();

const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('🚀 Hello from Jenkins CI/CD Project running on Docker & EC2!');
});

app.listen(port, () => {
  console.log(`App running at http://localhost:${port}`);
});
