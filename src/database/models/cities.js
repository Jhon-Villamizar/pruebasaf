'use strict';
export default (sequelize, DataTypes) => {

  const cities = sequelize.define('cities', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    name: DataTypes.STRING,
    stateId: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			references: {
				model: 'states',
				key: 'id'
			},
			field: 'stateId'
		},
  }, {});
  cities.associate = function(models) {
    cities.hasMany(models.clients, {as: 'clients'});
    cities.belongsTo(models.states,{foreignKey:'stateId', as:'state'});
  };
  return cities;
};