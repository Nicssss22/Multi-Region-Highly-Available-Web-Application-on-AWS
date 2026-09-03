const express = require('express');

// Read the deployment identity shown to the learner.
const app = express();
const port = process.env.PORT || 8080;
const region = process.env.AWS_REGION || 'local';
const version = process.env.APP_VERSION || 'test';

// Expose the app result and a lightweight health check.
app.get('/', (request, response) => {
  response.send(`Multi-Region App | Region: ${region} | Version: ${version}`);
});
app.get('/health', (request, response) => response.status(200).send('healthy'));

// Listen on the port used by the container.
app.listen(port, () => console.log(`Listening on port ${port}`));