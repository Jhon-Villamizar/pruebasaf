'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('cities', [{
      name: 'Santiago de Chile',
      stateId: 1,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Lima',
      stateId: 2,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Quito',
      stateId: 3,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Caracas',
      stateId: 4,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Bridgetown',
      stateId: 5,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Caguas',
      stateId: 6,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Clearwater',
      stateId: 7,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Lakeland',
      stateId: 7,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Dripping Springs',
      stateId: 8,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Charleston',
      stateId: 9,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Greenville',
      stateId: 9,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Greensboro',
      stateId: 10,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: ' Elizabeth City',
      stateId: 10,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Belmont',
      stateId: 10,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Asheville',
      stateId: 10,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Blue Ridge',
      stateId: 11,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Woolwich',
      stateId: 12,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Milford',
      stateId: 13,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Philadelphia',
      stateId: 14,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Martinsburg',
      stateId: 15,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Cincinnati',
      stateId: 16,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Palos Heights',
      stateId: 17,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Billings',
      stateId: 18,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Redmond',
      stateId: 19,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Newbury Park',
      stateId: 20,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Riverside',
      stateId: 20,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Tustin',
      stateId: 20,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Escondido',
      stateId: 20,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'El Cajon',
      stateId: 20,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Reno',
      stateId: 21,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Salt Lake City',
      stateId: 22,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Phoenix',
      stateId: 23,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Fruita',
      stateId: 24,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Salida',
      stateId: 24,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Nederland',
      stateId: 24,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Unit C Boulder',
      stateId: 24,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Shawnee',
      stateId: 25,
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Coventry',
      stateId: 26,
      createdAt: new Date(),
      updatedAt: new Date()
    }
  ], {});
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('cities', null, {});
  }
};
