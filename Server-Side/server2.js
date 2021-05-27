const http  = require('http');
const app = require('./app2');

const port = 3000;
const server = http.createServer(app);

server.listen(port || process.env.PORT , () => {
    console.log(`Server running at http://localhost:${port}`)
  })
