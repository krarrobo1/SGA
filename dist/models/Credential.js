"use strict";

var _interopRequireDefault = require("@babel/runtime/helpers/interopRequireDefault");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _sequelize = _interopRequireDefault(require("sequelize"));

var _database = require("../database/database");

var Credential = _database.sequelize.define("credentials", {
  email: {
    type: _sequelize["default"].STRING,
    validate: {
      isEmail: true
    },
    unique: true
  },
  password: {
    type: _sequelize["default"].STRING
  },
  userid: {
    type: _sequelize["default"].STRING(10)
  }
}, {
  timestamps: false
});

Credential.removeAttribute('id'); // linea agregada para evitar error en el findOne() 

var _default = Credential;
exports["default"] = _default;