import db from '../../database/models/index';

const update = async (id, name, stateId) => {
  return await db.cities.update({
    id, name, stateId
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
