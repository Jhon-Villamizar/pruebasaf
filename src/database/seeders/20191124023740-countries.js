'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('countries', [{
      name: 'Chile',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Peru',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Ecuador',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Venezuela',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Barbados',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Puerto Rico',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'United States',
      createdAt: new Date(),
      updatedAt: new Date()
    }
  ], {});
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('countries', null, {});
  }
};
