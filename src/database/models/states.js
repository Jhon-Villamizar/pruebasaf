'use strict';
module.exports = (sequelize, DataTypes) => {
  const states = sequelize.define('states', {
    name: DataTypes.STRING,
    countryId: DataTypes.INTEGER
  }, {});
  states.associate = function(models) {
    states.hasMany(models.cities,{as: 'cities'});
    states.hasMany(models.clients, {as: 'clients'});
    states.belongsTo(models.countries,{foreignKey: 'countryId', as: 'country'});
  };
  return states;
};