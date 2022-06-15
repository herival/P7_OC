'use strict';

const mysql = require('mysql2/promise');

//CONNEXION A LA BASE DE DONNEE
const db = mysql.createPool({
    connectionLimit: 100,
    host     : 'localhost',
    user     : 'root',
    password : '',
    waitForConnections: true,
    database: 'groupomania',
    charset: 'utf8mb4',
    debug: false
  });

  module.exports = db;