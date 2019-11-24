'use strict';
module.exports = (sequelize, DataTypes) => {
  const states = sequelize.define('states', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    name: DataTypes.STRING,
    countryId: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			references: {
				model: 'countries',
				key: 'id'
			},
			field: 'countryId'
		},
  }, {});
  states.associate = function(models) {
    states.hasMany(models.cities,{as: 'cities'});
    states.hasMany(models.clients, {as: 'clients'});
    states.belongsTo(models.countries,{foreignKey: 'countryId', as: 'country'});
  };
  return states;
};