'use strict';
module.exports = (sequelize, DataTypes) => {
  const visits = sequelize.define('visits', {
    date: DataTypes.DATE,
    srId: DataTypes.INTEGER,
    net: DataTypes.INTEGER,
    visitTotal: DataTypes.INTEGER,
    description: DataTypes.STRING,
    clientId: DataTypes.INTEGER
  }, {});
  visits.associate = function(models) {
    visits.belongsTo(models.clients,{foreignKey: 'clientId', as: 'client'});
    visits.belongsTo(models.sellers,{foreignKey: 'srId', as: 'seller'});
  };
  return visits;
};