'use strict';
module.exports = (sequelize, DataTypes) => {
  const countries = sequelize.define('countries', {
    name: DataTypes.STRING
  }, {});
  countries.associate = function(models) {
    countries.hasMany(models.states, {as: 'states'});
    countries.hasMany(models.clients, {as: 'clients'});
  };
  return countries;
};