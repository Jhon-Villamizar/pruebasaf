import db from '../../database/models/index';

const create = async (name, countryId) => {
  return await db.states.create({
        name, countryId
        }).then(data => {
          return data;
        }).catch(e => {
          console.log(e);
        });
}

module.exports = {
  create
}
