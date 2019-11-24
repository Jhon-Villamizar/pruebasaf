import db from '../../database/models/index';

const update = async (id, nit, name, address, phone, creditLimit, availableCredit, visitPercentage, description, countryId, stateId, cityId) => {
  return await db.clients.update({
    id, nit, name, address, phone, creditLimit, availableCredit, visitPercentage, description, countryId, stateId, cityId
  }, {
    where : {
      id: id
    }
  }).then(data => {
    return data;
  }).catch(e => {
    console.log(e);
  });
}

module.exports = {
  update
}
