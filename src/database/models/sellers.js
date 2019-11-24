'use strict';
module.exports = (sequelize, DataTypes) => {
  const sellers = sequelize.define('sellers', {
    name: DataTypes.STRING,
    cc: DataTypes.INTEGER
  }, {});
  sellers.associate = function(models) {
    sellers.hasMany(models.visits, {as: 'visits'});
  };
  return sellers;
};