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
  countries.associate = function (models) {
    countries.hasMany(models.states, { as: 'states' });
    countries.hasMany(models.clients, { as: 'clients' });
  };
  return countries;
};