'use strict';
module.exports = (sequelize, DataTypes) => {
  const cities = sequelize.define('cities', {
    name: DataTypes.STRING,
    stateId: DataTypes.INTEGER
  }, {});
  cities.associate = function(models) {
    cities.hasMany(models.clients, {as: 'clients'});
    cities.belongsTo(models.states,{foreignKey:'stateId', as:'state'});
  };
  return cities;
};