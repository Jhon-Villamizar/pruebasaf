import db from '../../database/models/index';

const create = async (nit, name, address, phone, creditLimit, availableCredit, visitPercentage, description, countryId, stateId, cityId) => {
  return await db.clients.create({
    nit, name, address, phone, creditLimit, availableCredit, visitPercentage, description, countryId, stateId, cityId
        }).then(data => {
          return data;
        }).catch(e => {
          console.log(e);
        });
}

module.exports = {
  create
}
