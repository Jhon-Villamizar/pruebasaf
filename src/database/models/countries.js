'use strict';
export default (sequelize, DataTypes) => {
  const countries = sequelize.define('countries', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    name: DataTypes.STRING,
  }, {});
  countries.associate = function (models) {
    countries.hasMany(models.states, { as: 'states' });
    countries.hasMany(models.clients, { as: 'clients' });
  };
  return countries;
};