const fs = require('fs');
const crypto = require('crypto');
// const axios = require('axios');

const publicKey = fs.readFileSync('public.pem', 'utf8');

const text = 'Hello from Hossein Pira';

const buffer = Buffer.from(text, 'utf-8');
const encrypted = crypto.publicEncrypt(publicKey, buffer);

const base64Encrypted = encrypted.toString('base64');

console.log(base64Encrypted);


// axios.post('http://localhost:3000/api', {
//     text: base64Encrypted
// })
//     .then((response) => {
//         console.log(response.data);
//     })
//     .catch((error) => {
//         console.error(error);
//     })