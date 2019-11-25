'use strict';
module.exports = (sequelize, DataTypes) => {
  const visits = sequelize.define('visits', {
    date: DataTypes.DATE,
    sellerId: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			references: {
				model: 'sellers',
				key: 'id'
			},
			field: 'sellerId'
		},
    net: DataTypes.INTEGER,
    visitTotal: DataTypes.INTEGER,
    description: DataTypes.STRING,
    clientId: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			references: {
				model: 'clients',
				key: 'id'
			},
			field: 'clientId'
		}
  }, {});
  visits.associate = function(models) {
    visits.belongsTo(models.clients,{foreignKey: 'clientId', as: 'client'});
    visits.belongsTo(models.sellers,{foreignKey: 'sellerId', as: 'seller'});
  };
  return visits;
};