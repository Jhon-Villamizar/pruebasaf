'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('states', [{
      name: 'Región Metropolitana',
      countryId: 1,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Lima',
      countryId: 2,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Distrito Metropolitano de Quito',
      countryId: 3,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Capital District',
      countryId: 4,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Bridgetown',
      countryId: 5,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Caguas',
      countryId: 6,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Florida',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Texas',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'South Carolina',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'North Carolina',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'Georgia',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'Maine',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'New York',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'Pensilvania',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'Virginia Occidental',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Ohio',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'Illinois',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'Montana',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'Oregon',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'California',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'Nevada',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'Utah',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),

    },
    {
      name: 'Arizona',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Colorado',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date(),
    },
    {
      name: 'Oklahoma',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Connecticut',
      countryId: 7,
      createdAt: new Date(),
      updatedAt: new Date()
    }
  ], {});
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('states', null, {});
  }
};
