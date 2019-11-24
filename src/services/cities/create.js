import db from '../../database/models/index';

const create = async (name, stateId) => {
  return await db.cities.create({
        name, stateId
        }).then(data => {
          return data;
        }).catch(e => {
          console.log(e);
        });
}

module.exports = {
  create
}
