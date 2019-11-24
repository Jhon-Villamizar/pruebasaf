'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('sellers', [{
      name: 'Juan Gomez',
      cc: '12345678',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Pedro Lopez',
      cc: '87654321',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Adriana Zapata',
      cc: '24680135',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Carolina Bustamante',
      cc: '13579246',
      createdAt: new Date(),
      updatedAt: new Date()
    },
  ], {});
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('sellers', null, {});
  }
};
