const express = require('express');
const promClient = require('prom-client');

const app = express();

const register = new promClient.Registry();

promClient.collectDefaultMetrics({ register });

const requestCounter = new promClient.Counter({
  name: 'nodejs_requests_total',
  help: 'Total number of requests received',
  labelNames: ['method', 'status']
});

app.use((req, res, next) => {
  res.on('finish', () => {
    requestCounter.inc({ method: req.method, status: res.statusCode });
  });
  next();
});

app.get('/metrics', async (req, res) => {
  try {
    res.set('Content-Type', register.contentType);
    res.end(await register.metrics());
  } catch (ex) {
    res.status(500).end(ex);
  }
});

app.get('/', (req, res) => {
    res.send('Bumbu :)');
});

app.listen(3000, () => {
    console.log('Server started on port 3000');
});
