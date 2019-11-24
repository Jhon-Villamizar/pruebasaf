'use strict';
export default (sequelize, DataTypes) => {
  const clients = sequelize.define('clients', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    nit: DataTypes.INTEGER,
    name: DataTypes.STRING,
    address: DataTypes.STRING,
    phone: DataTypes.STRING,
    creditLimit: DataTypes.INTEGER,
    availableCredit: DataTypes.INTEGER,
    visitPercentage: DataTypes.INTEGER,
    description: DataTypes.STRING,
    countryId: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			references: {
				model: 'countries',
				key: 'id'
			},
			field: 'countryId'
		},
    stateId: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			references: {
				model: 'states',
				key: 'id'
			},
			field: 'stateId'
		},
    cityId: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			references: {
				model: 'cities',
				key: 'id'
			},
			field: 'cityId'
		},
    createdAt: {
			type: DataTypes.DATE,
			allowNull: true,
			field: 'createdAt'
		},
		updatedAt: {
			type: DataTypes.DATE,
			allowNull: true,
			field: 'updatedAt'
		}
  }, {});
  clients.associate = function(models) {
    clients.hasMany(models.visits, {as: 'visits'});
    clients.belongsTo(models.countries,{foreignKey: 'countryId', as: 'country'});
    clients.belongsTo(models.states,{foreignKey: 'stateId', as: 'state'});
    clients.belongsTo(models.cities,{foreignKey: 'cityId', as: 'city'});
  };
  return clients;
};