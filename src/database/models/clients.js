'use strict';
module.exports = (sequelize, DataTypes) => {
  const clients = sequelize.define('clients', {
    nit: DataTypes.INTEGER,
    name: DataTypes.STRING,
    address: DataTypes.STRING,
    phone: DataTypes.STRING,
    creditLimit: DataTypes.INTEGER,
    availableCredit: DataTypes.INTEGER,
    visitPercentage: DataTypes.INTEGER,
    description: DataTypes.STRING,
    countryId: DataTypes.INTEGER,
    stateId: DataTypes.INTEGER,
    cityId: DataTypes.INTEGER
  }, {});
  clients.associate = function(models) {
    clients.hasMany(models.visits, {as: 'visits'});
    clients.belongsTo(models.countries,{foreignKey: 'countryId', as: 'country'});
    clients.belongsTo(models.states,{foreignKey: 'stateId', as: 'state'});
    clients.belongsTo(models.cities,{foreignKey: 'cityId', as: 'city'});
  };
  return clients;
};